function leftsp(A,B)
	if(A.class=="stp" or A.class=="lm")then
		A=A.tensor
	end
	if(B.class=="stp" or B.class=="lm")then
		B=B.tensor
	end
if(type(A)=="number" or type(B)=="number")
then
return A*B
end
local asize=A:size()
local bsize=B:size()
local m=asize[1]
local n=asize[2]
local p=bsize[1]
local q=bsize[2]
local k=n/p;
local C=torch.zeros(m,k*q)
for i=1,m do
	for j=1,q do
		C[{{i},{((j-1)*k+1),(j*k)}}]=((((A[{{i},{}}]:t()):reshape(p,k)):t())*B[{{},{j}}]):t()
	end
end
return C
end
