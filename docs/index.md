# Logger

The `Logger` class is simple by design. It is a wrapper around the regular `print`, `warn`, and `error` functions. It is designed to provide simple extra context like the source and **additional info** for `error` specifically. In Roblox's provided `error` function, it does not support varadic arguments unlike `print` and `warn`. **arg1** was always treated as a **Logging Level**; however, my `Logger:err` method supports varadic arguments and will treat the first argument as the **Logging Level** (if it was a number!)

-----

## Installation

### Using Wally

`Logger` is available on [Wally](https://wally.run/), a package manager for Roblox. Installing it is as easy as the following:

```toml title="wally.toml" hl_lines="8"
[package]
name = "user/repo"
version = "1.0.0"
registry = "https://github.com/UpliftGames/wally-index"
realm = "shared"

[dependencies]
Logger = "alexasterisk/logger@1.0.0"
```

```ps1
wally install
```

Requiring `Logger` will depend on your [Rojo](https://rojo.space/) project format. I will assume you have **Wally Packages** going into `ReplicatedStorage/Packages` for usage examples.

```json title="default.project.json" hl_lines="6 7 8"
{
    "name": "project-name",
    "tree": {
        "$className": "DataModel",
        "ReplicatedStorage": {
            "Packages": {
                "$path": "Packages"
            }
        },
        ...
    }
}
```

-----

## Importing

When importing `Logger`, you must use the **Constructor** to create a new `Logger` object. This constructor takes in a **string** for the **source** of the `Logger`. This will be used as the prefix for all logs.

```lua
local logger = require(game.ReplicatedStorage.Packages.Logger) "MySource"
```