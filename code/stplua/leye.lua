function leye (N)
    local C = torch.zeros(1,N)
    for i=1,N do
        C[{1,i}]=i
    end
    return newlm(C,N)
end
