function lwij(...)
local arg={...}
local m
local n
local i
local j
if select("#",...)  == 1 then
m=arg[1]
n=m
elseif select("#",...)  == 2 then
m=arg[1]
n=arg[2]
end
local a=torch.zeros(1,m*n)
local b=torch.zeros(1,m*n)
for i=1,m do
for j=1,n do
a[{1,(i-1)*n+j}]=i
b[{1,(i-1)*n+j}]=j
end
end
local N=m*n
local V=a+(b-1)*m
return newlm(V,N)
end
