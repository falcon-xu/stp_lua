function invvc(...)
local arg={...}
local x=arg[1]
local l=x:size(1)*x:size(2)
x=x:t():reshape(l,1)
local arg={...}
local m
local y
local a
local r
if select("#",...)  == 1 then
	m = math.ceil(math.sqrt(l));
    if m^2-1 ~= 1 then
		l = m^2
		y=torch.zeros(a-l,1)
		x=torch.cat(x,y,1)
    end
else
	m=arg[2]
    r = l%m
    if r ~= 0 then
        a = l+m-r;
		y=torch.zeros(a-l,1)
		x=torch.cat(x,y,1)
	else
	a=l
	end
end
local A = x:reshape(a/m,m)
A=A:t()
return A
end
