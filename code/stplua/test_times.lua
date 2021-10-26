function times(C,D)
    local A = newlm(C)
    local B = newlm(D)
    local m =A:size()[1]
    local n = A:size()[2]
    local p = B:size()[1]
    local q = B:size()[2]
    local result
    if(n==p)then
        result=sp1(A.tensor,B.tensor)
        return newlm(result)
    elseif (n%p==0)then
        result=sp1(A.tensor,B.tensor)
        return newlm(result)
    elseif(p%n==0)then
        result=sp1(A.tensor,B.tensor)
        return newlm(result)
    else
        error("INput argument error")
    end
end
