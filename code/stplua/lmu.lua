function lmu(...)
local arg={...}
local p,q,m,t,i,j
local x=arg[1]
if select("#",...)  == 0 then
p=2
q=2
t=0
elseif select("#",...)  == 1 then
p=arg[1]
q=p
t=0
elseif select("#",...)  == 2 then
p=arg[1]
q=arg[2]
t=0
else
p=arg[1]
q=arg[2]
t=arg[3]
end
if t>0 then
local V=torch.zeros(1,p*q)
for i=1,p do
for j=1,q do
V[{1,(i-1)*q+j}]=i
end
end
m=newlm(V,p)
else
local V=torch.zeros(1,p*q)
for i=1,p do
for j=1,q do
V[{1,(i-1)*q+j}]=j
end
end
m=newlm(V,q)
end
return m
end
