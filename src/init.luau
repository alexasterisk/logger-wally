local Logger = {}
Logger.__index = Logger

--- Creates a new Logger
--- @param source string -- The source of the Logger. This will be represented as the prefix of each log.
local function LoggerConstructor(source: string): Logger
    local self = setmetatable({}, Logger)
    self.source = `[{source:upper()}]`
    return self
end

--- Prints an Error
--- @param message string -- The message to throw an Error with.
--- @vararg any -- Additional information to log.
--- - If the **first** varadic argument is a number, it will be used as the **logging level**.
function Logger:err(message: string, ...)
    local data = {...}
    local hasLoggingLevel = type(data[1]) == "number"
    local extraData: {any}?

    if data[2] ~= nil then
        extraData = data
        if hasLoggingLevel then
            table.remove(extraData, 1)
        end
    end

    error(`{self.source} {message}`.. extraData and `\nAdditional Info:\n{unpack(extraData)}`, data[1])
end

--- Prints a Warning
--- @param message string -- The message to print as the Warning.
--- @vararg any -- Additional information to log.
--- @return boolean -- Always returns true to indicate that the warning was logged.
function Logger:warn(message: string, ...): boolean
    warn(`{self.source} {message}`, ...)
    return true
end

--- Prints a Message
--- @param message string -- The message to print.
--- @vararg any -- Additional information to log.
--- @return boolean -- Always returns true to indicate that the message was logged.
function Logger:log(message: string, ...): boolean
    print(`{self.source} {message}`, ...)
    return true
end

export type Logger = {
    err: (self: Logger, message: string, ...any) -> (),
    warn: (self: Logger, message: string, ...any) -> (),
    log: (self: Logger, message: string, ...any) -> (),
}

return LoggerConstructor
