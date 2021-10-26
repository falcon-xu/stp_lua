--最小公倍数
function lcm(a, b)
    local lcm_num = a * b / gcd(a,b)
    return lcm_num
end
