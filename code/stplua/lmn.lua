function lmn (N)
    local C = torch.zeros(1,N)
    for i=1,N do
        C[{1,i}]=(N-i+1)
    end
    return newlm(C,N)
end
