function Kronecker(A,B)
if(type(A)=="number"and type(B)=="number")
	then
	return A*B
end
local asize=A:size()
local bsize=B:size()
local ai=asize[1]
local aj=asize[2]
local E
local D
local C
for i=1,1 do
	D=A[i][1]*B
	if(aj>=2)
	then
	for j=2,aj do
	C=A[i][j]*B
	D=torch.cat(D,C)

	end
	end
	E=D
end
if(ai>=2)
then
for i=2,ai do
	D=A[i][1]*B
	if(aj>=2)
	then
	for j=2,aj do
	C=A[i][j]*B
	D=torch.cat(D,C)
	end
	end
	E=torch.cat(E,D,1)
end
end
	return E
end
