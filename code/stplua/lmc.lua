function lmc (N)
    local C
    local K=torch.zeros(1,N^2)
    for i=1,N do
        for j=1,i do
            K[{1,N*(i-1)+j}]=i
        end
        for j=i+1,N do
            K[{1,N*(i-1)+j}]=j
        end
    end
    return newlm(K,N)
end
