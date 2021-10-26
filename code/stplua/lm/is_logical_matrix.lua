function is_logical_matrix (A)
    local A_size = A:size()
    local flag = 1
    local A_size1 =A_size[1]
    local A_size2 = A_size[2]
    for i=1,A_size1 do
        for j=1,A_size2 do
            if(A[{i,j}]~=0 and A[{i,j}]~=1)then
                return false
            end
        end
    end
    for i=1,A_size2 do
        flag=0;
        for j=1,A_size1 do
            if(A[{j,i}]==1)then
                flag=flag+1
            end
        end
        if(flag~=1)then
            return false
        end
    end
return true
end
