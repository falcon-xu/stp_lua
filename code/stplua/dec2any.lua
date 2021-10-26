function dec2any(...)
local arg={...}
local argnum=select('#',...)
local k
local len
local a
local v
if(argnum==1)
then
	k=2
	len=0
	a=arg[1]
elseif(argnum==2)
then
	len=0
	a=arg[1]
	k=arg[2]
elseif(argnum==3)
then
	a=arg[1]
	k=arg[2]
	len=arg[3]
else
	print("Incorrect number of input parameters")
	return nil
end

if (a<0)
then
    print('The first input argument must be a non-negative integer')
	return nil
end

if (k<2)
then
    print('The second input argument must be a non-negative integer')
	return nil
end

if (len<0)
then
    print('The third input argument must be a non-negative integer')
	return nil
end


local l=math.ceil(log2(a+0.5)/log2(k))
v=torch.zeros(1,1)

if(a<k)
then
	v[{{1},{1}}]=a
else
	local i=0
	v=torch.zeros(1,l)
	while(a>=k)
	do
	t=a%k
	a=math.floor(a/k)
	v[{{1},{l-i}}]=t
	i=i+1
	end
v[{{1},{1}}]=a


end


if(len>0 and len>l)
then
local v1=torch.zeros(1,len)
v1[{{1},{(len-l+1),(len)}}]=v
v=v1


end
return v
end
