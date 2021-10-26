function lspn(...)
    local arg={...}
    local ni = select("#",...)
    local r
    if (ni==0)then
        error("No input argument!")
    elseif(ni==1)then
        return newlm(arg[1])
    elseif(ni==2)then
        return lsp(arg[1],arg[2])
    else
        r=lsp(arg[1],arg[2])
        for i=3,ni do
            r=lsp(r,arg[i])
        end
        return r
    end
end
