function sum (A)
    local A_size = A:size()
    local A_size1 = A_size[1]
    local A_size2 = A_size[2]
    if(A_size1==1 or A_size2==1)then
        local B = 0
        for i=1,A_size1 do
            for j=1,A_size2 do
                B=B+A[{i,j}]
            end
        end
        return B
    else
    local B=torch.zeros(1,A_size2)
    for j=1,A_size2 do
        for i=1,A_size1 do
            B[{1,j}]=B[{1,j}]+A[{i,j}]
        end
    end
    return B
    end
end
