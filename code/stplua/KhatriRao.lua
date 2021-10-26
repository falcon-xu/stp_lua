function KhatriRao(A,B)
if(type(A)=="number"and type(B)=="number")
	then
	return A*B
end

local asize=A:size()
local bsize=B:size()
local ai1=asize[1]
local aj1=asize[2]
local bi1=bsize[1]
local bj1=bsize[2]
local C

if(aj1~=bj1)
then
print("The number of input matrix columns is different. ")
return 0
end
for i=1,1 do
C=Kronecker(A[{{},{1}}],B[{{},{1}}])
end
if(aj1>=2)
then
for i=2,aj1 do
D=Kronecker(A[{{},{i}}],B[{{},{i}}])
C=torch.cat(C,D)
end
end
return C
end








