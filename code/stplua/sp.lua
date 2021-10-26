function sp(A,B)
    if(A.class=="stp" or A.class=="lm")then
        A=A.tensor
    end
    if(B.class=="stp" or B.class=="lm")then
        B=B.tensor
    end
    if(type(A)=="number" or type(B)=="number")
    then
        return A*B
    end
    local Adims=A:nDimension()
    local Bdims=B:nDimension()
    if(Adims>2 or Bdims>2)
    then
        print("Input arguments must be 2-D")
        return nil
    end
    local Asize=A:size()
    local Bsize=B:size()
    local n=Asize[2]
    local p=Bsize[1]
    local C
    if(n==p)
    then
        C=A*B
    else
        z=lcm(n,p)
        C=Kronecker(A,torch.eye(z/n))*Kronecker(B,torch.eye(z/p))
    end
    return C
end
