const regex = /([a-z]+\:\/+)([^\/\s]*)([a-z0-9\-@\^=%&;\/~\+]*)[\?]?([^ \#]*)#?([^ \#]*)/ig;
class UserShortInfo {
    async make(params,data) {
	var image_url = (data.image_url.search("uploads") == -1) ? "uploads/user/"+data.image_url : data.image_url
        var image = (regex.exec(data.image_url) != null) ? data.image_url : __user_image_url + image_url;
        let response = {
            "id": data.id,
			"first_name": data.first_name,
			"last_name": data.last_name,
            'name': data.first_name + ' ' + data.last_name,
            "image_url": ((data.image_url != null)) ? image : __user_image_url +'/images/user-placeholder.png',
            "token": data.token,
            "online_status": data.online_status,
            //"jist_image_url": __user_image_url + data.jist_image_url,
            "is_anonymous": (typeof data.is_anonymous != "undefined" && data.is_anonymous > 0) ? data.is_anonymous : 0
        }
        return response;
    }

    async collection(params,data) {
        let response = [];
        if (data.length > 0) {
            for (var i= 0; i < data.length; i++){

		 var image_url = (data[i].image_url.search("uploads") == -1) ? "uploads/user/"+data[i].image_url : image_url
                var image = (regex.exec(data[i].image_url) != null) ? data[i].image_url : image_url;
                response.push({
                    "id": data[i].id,
                    "first_name": data.first_name,
					"last_name": data.last_name,
					'name': data.first_name + ' ' + data.last_name,
                    "image_url": ((data[i].image_url != null)) ? image : __user_image_url +'/images/user-placeholder.png',
                    "token": data.token,
                    //"jist_image_url": __user_image_url + data[i].jist_image_url,
                    "is_anonymous": (typeof data[i].is_anonymous != "undefined" && data[i].is_anonymous > 0) ? data[i].is_anonymous : 0,
                });
            }
        }
        return await response;
    }
}

module.exports = UserShortInfo
