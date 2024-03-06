
local P = {}
BizMath = P

P.band = function(__a, __b)
    local result = __a & __b
    return result
end

P.bor = function(__a, __b)
    local result = __a | __b
    return result
end

P.lshift = function(__a, __b)
    local result = (__a << __b)
    return result
end

P.rshift = function(__a, __b)
    local result = (__a >> __b)
    return result
end