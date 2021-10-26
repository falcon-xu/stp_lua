function power(A,B)
    local m=math.max(A:size(1),B:size(1))
    local n=math.max(A:size(2),B:size(2))
    local C=torch.zeros(m,n)
    if (A:size(1)==B:size(1) and A:size(2)==B:size(2)) then
        for i=1,m do
            for j=1,n do
                C[{i,j}]=A[{i,j}]^B[{i,j}]
            end
        end
    elseif (A:size(1)==1 and A:size(2)==1) then
        for i=1,m do
            for j=1,n do
                C[{i,j}]=A[{1,1}]^B[{i,j}]
            end
        end
    elseif (B:size(1)==1 and B:size(2)==1) then
        for i=1,m do
            for j=1,n do
                C[{i,j}]=A[{i,j}]^B[{1,1}]
            end
        end
    else
        error('Matrix dimensions must agree.')
    end
    return C
end
