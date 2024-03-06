
local P = {}
BizMath = P

P.band = function(__a, __b)
    local result = bit.band(__a, __b)
    return result
end

P.bor = function(__a, __b)
    local result = bit.bor(__a, __b)
    return result
end

P.lshift = function(__a, __b)
    local result = bit.lshift(__a, __b)
    return result
end

P.rshift = function(__a, __b)
    local result = bit.rshift(__a, __b)
    return result
end