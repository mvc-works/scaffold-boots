
file_tree =
  "parent": "child"
  "tree":
    "a": "aa"
    "b": "bbb"

scaffold = require("../lib/index").ring

scaffold.emit "create", file_tree