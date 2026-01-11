greet("Lua")

-- Lua Advanced Syntax Test for Solarized Flat Theme
local Logger = {}
function Logger.log(msg) print('[LOG]', msg) end

local User = {}
User.__index = User
function User:new(name, active)
    return setmetatable({name = name, active = active ~= false}, self)
end

local Dog = setmetatable({}, {__index = Logger})
Dog.__index = Dog
function Dog:new(name)
    return setmetatable({name = name}, self)
end
function Dog:greet(name)
    self.log('Greeting ' .. name)
    print('Hello, ' .. name .. '!')
end
function Dog:speak()
    print(self.name .. ' barks!')
end

local function squared(tbl)
    local out = {}
    for _, v in ipairs(tbl) do out[#out+1] = v * v end
    return out
end

local function try_divide(a, b)
    if b == 0 then error('div by zero') end
    return a // b
end

local function async_add(a, b)
    local co = coroutine.create(function() coroutine.yield(a + b) end)
    local _, sum = coroutine.resume(co)
    return sum
end

local user = User:new('Alice')
local dog = Dog:new('Buddy')
dog:greet(user.name)
dog:speak()
local nums = {1, 2, 3}
print(table.concat(squared(nums), ', '))
local ok, err = pcall(function() try_divide(10, 0) end)
if not ok then print('Caught error:', err) end
local sum = async_add(2, 3)
print('Async sum:', sum)
local color = 'green'
if color == 'red' then print('Red')
elseif color == 'green' then print('Green')
elseif color == 'blue' then print('Blue') end
local closure = function(msg) print('Closure:', msg) end
closure('Test')
