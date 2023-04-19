"use strict";

class Controller {

    constructor() {
    }

    async __sendResponse(params = {},resource, result, response_code, message,is_collection= 0) 
    {      
        if (resource != "") {
            let resourceClass = require("../resources/" + resource + ".js");
            resource = new resourceClass();

            if(typeof result.id != "undefined" && result.id > 0){              
                result = await resource.make(params,result);
            }
            if (typeof result.length != "undefined" && result.length > 0 && is_collection == 1) {
                result = await resource.collection(params,result);
            }
        }
        let response = await {
            'code': response_code,
            'data': (typeof result != "undefined") ? result : [],
            'message': message
        };
        return await response;
    }


    async __sendErrors(error, errorMessages = [], code = 404) {

        let response = {
            'code': code,
            'data': errorMessages,
            'message': error
        };

        return response;
    }
}

module.exports = Controller;
