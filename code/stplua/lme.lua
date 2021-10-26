function lme( ... )
    -- body
    -- LME    Produces logical matrix for equivalence, return an LM object
    -- M = LME     for classical logic
    -- M = LME(K)  for k-valued logic

    -- Example: m = lme, m = lme(2)

    local arg={...}
    local ni = select("#",...)
    k = arg[1]

    if ( ni == 0 ) then
        k = 2
    end

    Mc = lmc(k)
    Mi = lmi(k)
    Mr = lmr(k)

    return Mc*Mi*(leye(k^2)+Mi)*(leye(k)+Mr)*(leye(k)+lwij(k))*Mr
end