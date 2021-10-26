function equ (A,n)
    local A_size = A:size()
    local A_size1 = A_size[1]
    local A_size2 = A_size[2]
    local B=torch.zeros(A_size1,A_size2)
    for i=1,A_size1 do
        for j=1,A_size2 do
            if(A[{i,j}]==n)then
                B[{i,j}]=1
            else
                B[{i,j}]=0
            end
        end
    end
    return B
end
