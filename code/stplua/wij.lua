function wij(...)
local arg={...}
local argnum=select('#',...)
local m
local n
if(argnum==1)
then
n=arg[1]
m=n
elseif(argnum==2)
then
m=arg[1]
n=arg[2]
else
print("Incorrect number of input parameters")
return nil
end

local d=m*n
local w=torch.zeros(d,d)
for k=1,d do
	local j=k%n
	if(j==0)
	then
	j=n
	end
	local i=(k-j)/n+1
	w[{{(j-1)*m+i},{k}}]=1
end
return w


end







