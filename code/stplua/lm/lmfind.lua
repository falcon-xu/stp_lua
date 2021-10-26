function lmfind( a,b,op )
    -- overloaded find for lm class

    if (op == "" or op == nil) then
        -- body
        op = "="
    end

    local l = torch.Tensor()
    local r = torch.Tensor()
    if (a.class == "lm" and b.class == 'lm') then
        -- body
        if (a.n ~= b.n) then
            -- body
            error("Error! LM:find \n The row numbers must agree.")
        end0
        l = a.v
        r = b.v
    else
        if (a.class == "lm") then
            -- body
            l = a.v
            r = b
        else
            l = a
            r = b.v
        end
    end

    if (op == "=" or op == "==" or op == "eq" ) then
        -- body
        return eq(a,b)

    elseif (op == ">" or op == "gt") then
        return torch.gt(l,r)

    elseif (op == "<" or op == "lt") then
        return torch.lt(l,r)

    elseif (op == ">=" or op == "ge") then
        return torch.ge(l,r)

    elseif (op == "<=" or op == "le") then
        return torch.le(l,r)

    else
        error("Error! LM:find \n unknown operation.")
    end
end
