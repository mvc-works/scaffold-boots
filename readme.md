
## Scaffold-Boots is a scaffold tool for rain-boots

Use `npm install scaffold-boots` to install it.  
Then `scaffold-boots` generates the file structure.  
After requiring, it listens to `create` event and create file tree.  
`file_tree` and base directory can be passed to it.  

```coffee
file_tree =
  "parent": "child"
  "tree":
    "a": "aa"
    "b": "bbb"

scaffold = require("scaffold-boots").rain

scaffold.emit "create", file_tree, "test"

scaffold.emit "erase", file_tree, "test"
```