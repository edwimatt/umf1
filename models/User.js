"use strict";
const db = require('../config/knex.js');
var passwordHash = require('password-hash');

class User {

    async getData(params = {}) {
        let record = await db.select("*")
            .from('user')
            .where("user.id","<>",params.user_id)
            .orderBy("user.created_at", "DESC");

        return record;
    }

    async getSingleRecord(params = {}) {
        let record = await db.select("*")
            .from('user')
            .where("user.id", params.user_id)
            .whereNull("user.deleted_at")
            .first();

        return record;
    }

    async Insert(params = []) {
        let record = await db('user').insert({
            first_name: params.username,
            username: params.username,
            email: params.email,
            image_url: "https://static.turbosquid.com/Preview/001292/481/WV/_D.jpg",
            password: passwordHash.generate(params.password),
            token: passwordHash.generate("token-" + params.email)
        });

        return record;
    }

    async loginUser(params = {}) {
        let record = await db.select("*")
            .from('user')
            .where("user.email", params['email'])
            .where("user.password", passwordHash.generate(params['password']))
            .first();

        return record;
    }

    async updateUserStatus(params = {}) {
        let record = await db("user")
            .where("id", params.user_id)
            .update({"online_status": params.online_status});

        return await this.getSingleRecord({"user_id" : params.user_id});
    }
}

module.exports = new User();
