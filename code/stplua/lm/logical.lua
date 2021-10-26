function logical(A)
    local A_size = A:size()
    local A_size1 = A_size[1]
    local A_size2 = A_size[2]
    local B = torch.zeros(1,A_size2)
    local flag=0
    for i=1,A_size2 do
        flag=0
        for j=1,A_size1 do
            if(A[{j,i}]==1)then
                flag=j
            end
        end
        B[{1,i}]=flag
    end
    return B
end
