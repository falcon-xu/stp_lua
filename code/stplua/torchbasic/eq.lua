function eq(A,B)
  local m=A:size(1)
  local n=A:size(2)
  local C=torch.zeros(m,n)
    for i=1,m do
      for j=1,n do
        if (A[{i,j}]==B[{i,j}]) then
	C[{i,j}]=1
	elseif (A[{i,j}]~=B[{i,j}]) then
        C[{i,j}]=0
        end
      end
    end
  return C
end
