function lmkron( a,b )
    -- Kronecher product for lm class
    if (torch.isTensor(a)) then
        -- body
        a = newlm(a)
    end
    if (torch.isTensor(b)) then
        -- body
        b = newlm(b)
    end
    local size1 = a.tensor:size()
    local size2 = b.tensor:size()
    local r = (a.v - 1)*size2[1]
    r = torch.ones(size2[2],1)*r
    r = r + (b.v):t()*torch.ones(1,size1[2])
    local size0 = r:size()
    local v = torch.zeros(1,size0[1]*size0[2])
    for i = 1,size0[1] do
        for j = 1,size0[2] do
            v[1][(i-1)*size0[2]+j] = r[i][j]
        end
    end
    local n = size1[1]*size2[1]
    return newlm(v,n)
end
