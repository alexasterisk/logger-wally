return function()
    local Logger = require(script.Parent)

    describe("Logger", function()
        local logger = Logger("testez")

        it("should create a new Logger", function()
            expect(logger).to.be.ok()
            expect((logger :: Logger.Logger & { source: string }).source).to.equal("[TESTEZ]")
        end)

        it("should print a normal log", function()
            local result = logger:log("This is a normal log")
            expect(result).to.equal(true)
        end)

        it("should print a warning", function()
            local result = logger:warn("This is a warning")
            expect(result).to.equal(true)
        end)

        it("should print an error", function()
            expect(function()
                logger:err("This is an error")
            end).to.throw()
        end)
    end)
end