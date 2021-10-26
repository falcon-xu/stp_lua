function Hadamard(A,B)
	local C
	if(type(A)=="number"and type(B)=="number")
	then
	return A*B
	end
	C=torch.cmul(A,B)
	return C
end
