function bt(A,s,t)
local asize=A:size()
local m=asize[1]
local n=asize[2]
if(m%s~=0 or n%t~=0)
then
print("The dimensions of the first argument do not meet the conditions of block transpose.")
return nil
end
local p=m/s
local q=n/t
local B=torch.zeros(s*q,t*p)
for i=1,p do
	for j=1,q do
	B[{{((j-1)*s+1),(j*s)},{((i-1)*t+1),(i*t)}}]=A[{{((i-1)*s+1),(i*s)},{((j-1)*t+1),(j*t)}}]
	end
end
return B
end
