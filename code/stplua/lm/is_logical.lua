function is_logical (A,n)
    local A_size = A:size()
    local A_size1 = A_size[1]
    local A_size2 = A_size[2]
    if((A_size1~=1)and(A_size2~=1))then
        return false
    end
    for i=1,A_size1 do
        for j=1,A_size2 do
            if(A[{i,j}]>n or A[{i,j}]<0)then
                return false
            end
        end
    end
    return true
end
