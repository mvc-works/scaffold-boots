
events = require "events"
exports.ring = ring = new events.EventEmitter

fs = require "fs"
path = require "path"

create_file = (base_path, data) ->
  if (typeof data) is "string"
    file_path = path.join base_path, data
    fs.writeFile file_path, ""
  else
    keys = Object.keys data
    console.log keys
    keys.forEach (key) ->
      value = data[key]
      new_path = path.join base_path, key
      fs.mkdir new_path, ->
        create_file new_path, value

ring.on "create", (tree, base_path) ->
  base_path = base_path or "."
  create_file base_path, tree