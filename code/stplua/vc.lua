function vc(A)
local asize=A:size()
local v=(A:t()):reshape(1,asize[1]*asize[2]):t()
return v
end
