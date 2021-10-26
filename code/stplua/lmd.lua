function lmd( ... )
    -- 
    -- LMD    Produces logical matrix for disjunction, return an LM object

    -- M = LMD     for classical logic
    -- M = LMD(K)  for k-valued logic
    -- Example: m = lmd, m = lmd(2)

    local arg={...}
    local ni = select("#",...)
    k = arg[1]

    if ( ni == 0 ) then
        k = 2
    end

    local n = k
    local p = torch.zeros(1,n^2)
    local q = torch.zeros(1,n^2)
    for i = 1,n do
        for j = 1,n do
            p[1][(i-1)*n+j] = i
            q[1][(i-1)*n+j] = j
        end
    end
    b = torch.le(p,q)
    b = b:type("torch.DoubleTensor")
    v = torch.cmul(p,b)+torch.cmul(q,torch.ones(1,n^2)-b)
    return newlm(v,n)
end