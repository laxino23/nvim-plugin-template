describe("my-plugin", function()
  local plugin

  before_each(function()
    plugin = require "my-plugin"
  end)

  it("can be required", function()
    assert.is_not_nil(plugin)
  end)

  it("has a setup function", function()
    assert.is_function(plugin.setup)
  end)

  it("has a greet function", function()
    assert.is_function(plugin.greet)
  end)

  it("uses default config", function()
    plugin.setup()
    assert.equals("Hello from my-plugin!", plugin.config.greeting)
  end)

  it("accepts custom config", function()
    plugin.setup { greeting = "Custom greeting" }
    assert.equals("Custom greeting", plugin.config.greeting)
  end)
end)
