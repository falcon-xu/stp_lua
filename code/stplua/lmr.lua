function lmr( ... )
    -- body
    -- LMR    Produces power-reducing matrix, return an LM object

    -- The power-reducing matrix M satisfies P^2=MP, where P is a logical variable.

    -- M = LMR     for classical logic
    -- M = LMR(K)  for k-valued logic

    -- Example: m = lmr, m = lmr(2)
    local arg={...}
    local ni = select("#",...)
    k = arg[1]

    if (ni < 2) then
        -- body
        n = 1
    end

    if ( ni == 0 ) then
        k = 2
    end

    local Mr = newlm(torch.eye(3))
    if (n == 1) then
        -- body
        local a = torch.zeros(1,k)
        local i = 0
        a:apply(function()
        i = i +1 
        return i
        end)
        Mr = newlm(a+(a-1)*k,k^2)
    else
        Mr = (leye(2)+lwij(2,2^(n-1)))*lmr(k,1)*(leye(2)+lmr(k,n-1))
    end
    return Mr
end