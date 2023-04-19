"use strict";

const UserClass = require("../app/controllers/UserController");
const User = new UserClass();
const ChatRoomClass = require("../app/controllers/RoomController");
const ChatRoom = new ChatRoomClass();
const ChatMessageClass = require("../app/controllers/ChatMessageController");
const ChatMessage = new ChatMessageClass();
const fetch = require('node-fetch'); //https://www.npmjs.com/package/node-fetch
// socket io code
let chat_users = new Map();
let user_active_rooms = new Map();
let user_room_exists = new Map();
var last_active_room = '';
//socket connection

module.exports = (io) => {

    io.on('connection', (socket) => {

        console.log('socket id:', socket.id);

        // current user socket id

        //Get the chatID of the user and join in a room of the same chatID
        //var chatID = socket.handshake.query.chatID;

        /**
         * On update User status and join socket
         *
         * get @param object
         * payload send : { user_id : param.user_id }
         */

        socket.on("_joinSocket", async (user_data) => {
            // Join user by id
            socket.join("user_"+user_data.id)
            let response = await User.updateStatus({user_id: user_data.id, online_status: 1});
            // send Notification for this user is online
            chat_users.set(user_data.id, user_data);
            socket.broadcast.emit("_online",user_data);
        });


		socket.on("_joinSocketWithCB", async (user_data,callback) => {
            // Join user by id
            socket.join("user_"+user_data.id)
            let response = await User.updateStatus({user_id: user_data.id, online_status: 1});
            // send Notification for this user is online
            chat_users.set(user_data.id, user_data);
            socket.broadcast.emit("_online",user_data);
			callback(user_data);
        });

        socket.on("_updateOnlineStatus", async (params) => {
            await User.updateStatus({user_id: params.user_id, online_status: params.status})
        })

        /**
         * On load Room get Chat with user or group
         *
         * get @param object
         * payload send : { user_id : param.user_id,search : param.search }
         *
         */
        socket.on("_loadRecentChat", async (param) => {
            // leave All chat room
            socket.leaveAll();
            let getRecentChat = await User.getRecentChat(param);
            // Join Chat or Group
            socket.join(getRecentChat)
            let response = await ChatRoom.getOneToOneRecord({user_id: param.user_id, search: param.search});
            io.in("user_"+param.user_id).emit("_loadRecentChat", response)
        });

        socket.on("_loadRecentChatCb",async (param,callback) => {
              socket.leaveAll();
              let getRecentChat = await User.getRecentChat(param)
              // Join Chat or Group
              socket.join(getRecentChat)
              let response = await ChatRoom.getOneToOneRecord({user_id: param.user_id, search: param.search});
              callback(response);
        });

        socket.on("_loadNewMessage", async (param) => {
            let message = await ChatMessage.getRecord(param);
            socket.emit("_loadNewMessage", message);
        })

        socket.on("_loadChatHistory", async (param) => {
            if(typeof param.chat_room_id != "undefined" && param.chat_room_id > 0){
                socket.join("room_"+param.chat_room_id);
			}
            let message = await ChatMessage.getRecord(param);
            socket.emit("_loadChatHistory", message);

            user_active_rooms.set(param.user_id,param.chat_room_id);

         });


        socket.on("_loadChatHistoryWithCb", async (param,callback) => {
            if(typeof param.chat_room_id != "undefined" && param.chat_room_id > 0){
                socket.join("room_"+param.chat_room_id);
            }
			let message = await ChatMessage.getRecord(param);
            //socket.emit("_loadChatHistory", message);
            callback(message)
            user_active_rooms.set(param.user_id,param.chat_room_id);
        })

        socket.on('_sendMessage', async (client_params) => {
            var message = [];
            if (typeof client_params.chat_room_id != "undefined" && client_params.chat_room_id > 0) {
                message = await ChatMessage.insertRecord(client_params)
                io.in('room_' + message.data.chat_room_id).emit("_receivedMessage", message);
                //load recent chat actor_user
                let recentActorChat = await ChatRoom.getOneToOneRecord({user_id: client_params.user_id, search: ''});
                io.in("user_"+client_params.user_id).emit("_loadRecentChat", recentActorChat)
                //load recent chat target user
                let recentTargetChat = await ChatRoom.getOneToOneRecord({user_id: client_params.target_id, search: ''});
                io.in("user_"+client_params.target_id).emit("_loadRecentChat", recentTargetChat)

				if(typeof message.data.id != "undefined"){
					client_params.message_id = message.data.id;
					await ChatMessage.updateMessageCounter(client_params);
				}
            } else {
                message = await ChatMessage.insertRecord(client_params)
                message.data.target_id = client_params.target_id;
                //let participant = await ChatMessage.getAllParticipants(message.data)
                // join room
                socket.join('room_' + message.data.chat_room_id);
                //send message to client
                socket.emit('_receivedMessage',message)
                socket.to("user_"+client_params.target_id).emit('_receivedMessage',message);
                //load recent chat actor_user
                let recentActorChat = await ChatRoom.getOneToOneRecord({user_id: client_params.user_id, search: ''});
                io.in("user_"+client_params.user_id).emit("_loadRecentChat", recentActorChat)
                //load recent chat target user
                let recentTargetChat = await ChatRoom.getOneToOneRecord({user_id: client_params.target_id, search: ''});
                io.in("user_"+client_params.target_id).emit("_loadRecentChat", recentTargetChat)

				if(typeof message.data.id != "undefined"){
					client_params.message_id = message.data.id;
					await ChatMessage.updateMessageCounter(client_params);
				}
            }

            //send notification
            // let body = {
            //     actor_id: message.data.user_id,
            //     chat_room_id:message.data.chat_room_id,
            //     chat_message_type:message.data.message_type,
            //     chat_message_id:message.data.id,
            //     chat_message:message.data.message
            // };
            // let notification_url = process.env.IMAGE_BASE_URL + '/api/chat/send-notification';
            // fetch( notification_url, {
            //     method: 'POST',
            //     body:    JSON.stringify(body),
            //     headers: { 'token':'api.Pd*!(5675' ,'Content-Type': 'application/json' },
            // }).then(res => res.json())
            //     .then(json => console.log(json));

        });

        socket.on("_getRoomId", async (param) => {
            let room_id = await ChatMessage.checkExistsRoom(param);

            if(typeof room_id.data.chat_room_id != "undefined" && room_id.data.chat_room_id > 1){
                // Join room by id
                socket.join("room_"+room_id.data.chat_room_id);
            }
            socket.emit("_getRoomId",room_id);
        });

        socket.on("_getRoomIdWithCb", async (param,callback) => {
            let room_id = await ChatMessage.checkExistsRoom(param);

            if(typeof room_id.data.chat_room_id != "undefined" && room_id.data.chat_room_id > 1){
                // Join room by id
                socket.join("room_"+room_id.data.chat_room_id);
            }
            callback(room_id)
        });

        //Emit typing
        socket.on("_startTyping", (param) => {
            socket.to('room_' + param.id).emit("_startTyping", param);
        });

        //Emit typing
        socket.on("_stopTyping", (param) => {
            socket.to('room_' + param.id).emit("_stopTyping", param);
        });

        //Emit Leave
        socket.on("_leave", (param) => {
           socket.leave("user_" + param.user_id);
           socket.leave("room_" + param.chat_room_id);
        });

        // On logout user
        socket.on("_logoutUser", async (param) => {
            let current_timestamp = new Date();
            let user = await User.updateStatus({user_id: param.user_id, online_status: 0});
            socket.broadcast.emit("_offline",chat_users.get(param.user_id));
            socket.leaveAll();
        })

         /**
           * delete Single message
           */
          socket.on('_deleteMessageByIDWithCb', async (param,callback) => {
              let message = await ChatMessage.deleteMessage(param);
              callback(message);
          });

          /**
           * delete Single message
           */
          socket.on('_deleteRecentChatWithCb', async (param,callback) => {
              let message = await ChatMessage.deleteRecentChat(param);
              callback(message);
          });

          /**
           * delete Single message
           */
          socket.on('_readRecentChatWithCb', async (param,callback) => {
              let message = await ChatMessage.readRecentChat(param);
              callback(message);
          });

        // Group Events

        // Create Group with CallBack
        socket.on('_createGroupWithCb', async (param,callback) => {
            let group = await ChatRoom.createGroup(param);
            var group_users = param.group_users;

            var socketRooms = socket.rooms;
            if(group_users.length > 0){

                if (typeof param.chat_room_id != "undefined" && group.data.id > 0 && typeof socketRooms["group_"+group.data.id] == "undefined") {
                    // Join room by id
                    socket.join("group_"+group.data.id)
                }

                for(let i=0; i < group_users.length; i++){
                    io.in("user_"+group_users[i]).emit("_loadGroup",group);
                }
            }

            callback(group);
        });

        // Get Group
        socket.on('_getGroupWithCb', async (param,callback) => {
            let groups = await ChatRoom.getRecentGroup(param);
            callback(groups);
        });

        socket.on('_getGroup', async (param) => {
            let groups = await ChatRoom.getRecentGroup(param);
            io.in("user_"+param.user_id).emit("_getGroup",groups);
        });

        // Create Group
        socket.on('_createGroup', async (param) => {
            let group = await ChatRoom.createGroup(param);
            var group_users = param.group_users;

            var socketRooms = socket.rooms;
            if(group_users.length > 0){

                if (typeof param.chat_room_id != "undefined" && group.data.id > 0 && typeof socketRooms["group_"+group.data.id] == "undefined") {
                    // Join room by id
                    socket.join("group_"+group.data.id)
                }

                for(let i=0; i < group_users.length; i++){
                    let groups = await ChatRoom.getRecentGroup(param);
                    io.in("user_"+group_users[i]).emit("_getGroup",groups);
                }
            }

        });



        //On Leave the room if the user closes the socket
        socket.on('_disconnect', (param) => {
            socket.leaveAll();
        });

        socket.on('_disconnecting', (reason) => {
          console.log('disconnecting',socket.rooms); // Set { ... }
        });

    })
}
