
file_tree =
  "parent": "child"
  "tree":
    "a": "aa"
    "b": "bbb"

scaffold = require("../lib/index").rain

scaffold.emit "create", file_tree, "test"
# the code below will delete all the files
# scaffold.emit "erase", file_tree, "test"