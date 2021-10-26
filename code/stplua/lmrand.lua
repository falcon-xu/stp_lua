function lmrand(...)
local arg={...}
local m,n,i
if select("#",...)  == 1 then
m=arg[1]
n=m
else
m=arg[1]
n=arg[2]
end
local V=torch.rand(1,n)*m
for i=1,n do
V[{1,i}]=math.floor(V[{1,i}])+1
end
return newlm(V,m)
end
