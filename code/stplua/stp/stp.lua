function newstp(x)
local stp={}
if(x.class=="stp")then
	stp.tensor=x.tensor
	stp.class="stp"
elseif(x.class=="lm")then
	stp.tensor=x.tensor
	stp.class="stp"
else
	stp.tensor=x
	stp.class="stp"
end

--double类型转换
stp.double=function(A)
	return A.tensor
end
stp.display=function(A)
	return A.tensor
end
--内置函数转置
stp.transpose=function(A)
return newstp(A.tensor:t())
end

--内置函数共轭转置
stp.ctranspose=function(A)
	return newstp(A.tensor:t())
end

--stp类的size
stp.size=function(...)
	local arg = {...}
	local ni = select("#",...)
	local r
	local M
	local N
	if(ni==0)then
		error("No input arguments")
	elseif(ni==1)then
		M=arg[1]
		return M.tensor:size()
	elseif(ni==2)then
		M=arg[1]
		N=arg[2]
		return M.tensor:size(N)
	else
		error("Num of input argument must less than two.")
	end
end

--stp类的length
stp.length=function (m)
	return math.max(m.tensor:size(1),m.tensor:size(2))

end

mt={
--对+的重载
__add=function(A,B)
local asize=(A.tensor):size()
local bsize=(B.tensor):size()
local C
if(asize[1]==bsize[1] and  asize[2]==bsize[2])
then
C=newstp(A.tensor+B.tensor)
else
	error('Matrix dimensions must agree.')
end
return C
end
,
--对-的重载
__sub=function(A,B)
local asize=(A.tensor):size()
local bsize=(B.tensor):size()
local C
if(asize[1]==bsize[1] and  asize[2]==bsize[2])
then
C=newstp(A.tensor-B.tensor)
else
	error('Matrix dimensions must agree.')
end
return C
end
,
--对*的重载
__mul=function(A,B)
local asize=(A.tensor):size()
local bsize=(B.tensor):size()
local n=asize[2]
local p=bsize[1]
local C
if(n==p)
then
C=newstp(A.tensor*B.tensor)
else
local t=lcm(n,p)
C=newstp(Kronecker(A.tensor,torch.eye(t/n,t/n))*Kronecker(B.tensor,torch.eye(t/p,t/p)))
end
return C
end
,
--对相反数（-）的重载
__unm=function(A)
local C=newstp(-1*A.tensor)
return C
end
,
--对乘方（^）的重载

__pow=function(A,p)
	local B=newstp(A)
	if (type(p)=="number") then
		if (p>=0 and p==math.floor(p)) then
    		if(p==0) then
				return newstp(torch.eye(1))
			elseif (p==1) then
	    		return B
			else
				return B*stpmpower(B,p-1)
			end
		else
        	error('The second operand must be a non negative integer.')
    	end
	else
    	error('The second operand must be a scalar.')
	end
end
}
setmetatable(stp,mt)
return stp
end

--stp矩阵点矩阵次幂
function stpdotpower(A,B)
local A=newstp(A)
local B=newstp(B)
return newstp(power(A.tensor,B.tensor))
end

function stpmpower(A,p)
local A=newstp(A)
if (type(p)=="number") then
  if (p>=0 and p==math.floor(p)) then
    if(p==0) then
		return newstp(torch.eye(1))
	elseif (p==1) then
	    return A
	else
		return A*stpmpower(A,p-1)
	end
	else
        error('The second operand must be a non negative integer.')
    end
else
    error('The second operand must be a scalar.')
end
end

--stp的点乘
function stptimes(A,B)
return newstp(torch.cmul(A.tensor,B.tensor))
end



--对等于等于进行重载
function stpeq(A,B)
	if(A.class=="stp" and B.class=="stp") then
		return eq(A.tensor,B.tensor)
	elseif(A.class=="stp" and B.class~="stp") then
		return eq(A.tensor,B)
	elseif(A.class~="stp" and B.class=="stp") then
		return eq(A,B.tensor)
	end
end
