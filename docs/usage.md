# Usage

To get started using `Logger`, you will need to import the `Logger` class.

```lua
local logger = require(game.ReplicatedStorage.Packages.Logger) "MySource"
```

-----

## `logger:log(string, ...any)`

This method is used to log information to the console. It is the same as `print` but with the source prefix.

```lua
logger:log("Hello, World!")
logger:log("Hello, World!", "How are you today?", 100)
```

## `logger:warn(string, ...any)`

This method is used to log warnings to the console. It is the same as `warn` but with the source prefix.

```lua
logger:warn("Oops, World!") --> "[MYSOURCE] Oops, World!"
logger:warn("Oops, World!", "You should not do that!", -100) --> "[MYSOURCE] Oops, World! You should not do that! -100"
```

## `logger:err(string, number|any, ...any)`

This method is used to log errors to the console. It is the same as `error` but with the source prefix. It also accepts varadic arguments. If the first argument is a number, it will be treated as the **Logging Level**.

```lua
logger:err("Oh no, World!") --> "[MYSOURCE] Oh no, World!" with a Level of 1
logger:err("Oh no, World!", 2, "Can't recover from that!") --> "[MYSOURCE] Oh no, World! Addition Info: Can't recover from that!" with a Level of 2
logger:err("Oh no, World!", "Can't recover from that!") --> "[MYSOURCE] Oh no, World! Additional Info: Can't recover from that!" with a Level of 1
```
