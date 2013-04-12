
events = require "events"
exports.rain = new events.EventEmitter

{rain, boots} = require "rain-boots"

fs = require "fs"
path = require "path"

create_file = (base_path, data) ->
  if (typeof data) is "string"
    file_path = path.join base_path, data
    fs.writeFileSync file_path, ""
  else
    keys = Object.keys data
    keys.forEach (key) ->
      value = data[key]
      new_path = path.join base_path, key
      fs.mkdirSync new_path
      create_file new_path, value

exports.rain.on "create", (tree, base_path) ->
  base_path = base_path or "."
  create_file base_path, tree
  exports.rain.emit "created", tree

exports.rain.on "erase", (tree, base_path) ->
  keys = Object.keys tree
  base_path = base_path or ""
  keys.forEach (key) ->
    path_name = path.join base_path, key
    boots.erase_path path_name
  exports.rain.emit "erased", tree