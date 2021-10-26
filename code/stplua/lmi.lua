function lmi( ... )
    -- body
    -- LMI    Produces logical matrix for implication, return an LM object
    -- M = LMI     for classical logic
    -- M = LMI(K)  for k-valued logic
    -- Example: m = lmi, m = lmi(2)

    local arg={...}
    local ni = select("#",...)
    k = arg[1]

    if ( ni == 0 ) then
        k = 2
    end

    local Md = lmd(k)
    local Mn = lmn(k)
    return Md*Mn
end