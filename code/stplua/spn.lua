function spn(...)
    local arg={...}
    local ni= select("#",...)
    local r
    if (ni==0)
    then
        print("'No input arguments.'")
        return nil
    elseif (ni==1)
    then
        r=arg[1]
    elseif(ni==2)
    then
        r=sp1(arg[1],arg[2])
    else
        r=sp1(arg[1],arg[2])
        for i=3,ni do
            r=sp1(r,arg[i])
        end
    end
    return r
end
