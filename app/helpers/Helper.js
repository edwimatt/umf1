"use strict";
const slugify = require('slugify')
var fs = require('fs');

class Helper {

    /**
     *
     * @param url
     * @returns {Promise<void>}
     */
    async urlGenerate(url) {
        return await slugify(url, {
            replacement: '-',  // replace spaces with replacement character, defaults to `-`
            remove: undefined, // remove characters that match regex, defaults to `undefined`
            lower: true,      // convert to lower case, defaults to `false`
            strict: false,     // strip special characters except replacement, defaults to `false`
        })
    }

    async makeNewDir(dir_name) {
        var dir = dir_name.split("/");
        var new_dir = [];
        if (dir.length > 0) {
            for (var dir_index = 0; dir_index < dir.length; dir_index++) {
                new_dir.push(dir[dir_index])
                fs.access(new_dir.join("/"), function(error) {
                    if (error) {
                        fs.mkdir(new_dir.join("/"), "0777",function () {
                            //callback(null, file.fieldname + '-' + Date.now(Date.now())+path.extname(file.originalname));
                        });
                    }
                });
            }
        }
    }
}

module.exports = new Helper()
