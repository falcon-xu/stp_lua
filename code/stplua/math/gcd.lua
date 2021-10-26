
--计算最大公约数
function gcd(a, b)
    local d_value = a % b
    if d_value == 0 then
       return b  -- mathassert((m > 0) and (n > 0)).min(a, b)
    end
    return gcd(b, d_value)
end
