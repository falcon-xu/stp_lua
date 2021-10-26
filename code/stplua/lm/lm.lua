function newlm(...)
    local lm={}
    local arg={...}
    local ni = select("#",...)
    lm.class="lm"
    if(ni==1) then
        local a = arg[1]
        if(a.class=="stp")   then
            a=a.tensor
        end
        if(a.class=="lm")   then
            a=a.tensor
        end
        if(is_logical_matrix(a))then
            local size_a=a:size()
            local size_a1 = size_a[1]
            local size_a2 = size_a[2]
            lm.n=size_a1
            lm.v=logical(a)
            lm.tensor=a
        else
            error ("The input argument must be a logical matrix.")
        end
    elseif(ni==2)then
        local a = arg[1]
        local b = arg[2]
        if(is_logical(a,b))then
            local size_a=a:size()
            local size_a1 = size_a[1]
            local size_a2 = size_a[2]
            if(size_a1>1)then
                lm.v=a:t()
            else
                lm.v=a
            end
            lm.n=b
            lm.tensor=(trans_to_stp(a,b))
        else
                error ("Input argument is wrong")
        end
    else
        error("Amount of input argument is wrong!")
    end

    lm.size=function(A)
        local C = torch.zeros(1,2)
        C[{1,1}]=A.n
        C[{1,2}]=A:length()
        return C
    end


    lm.length=function(A)
        local v_size=A.v:size()
        local v_size2=v_size[2]
        return v_size2
    end

    lm.unique=function(A)
        return newlm(unique(A.v),A.n)
    end

    lm.rank=function(A)
        return (A:unique()):length()
    end

    lm.trace=function(A)
        if(A:issquare())then
            return sum(A:diag())
        else
            error("LM object must be square")
        end
    end

    lm.issquare=function(a)
        local m = a.tensor:size()[1]
        local n = a.tensor:size()[2]
        if (m == n) then
            return true
        else
            return false
        end
    end


    lm.display=function(A)
        print("v: ")
        print(A.v)
        print("n: ")
        print(A.n)
    end

    lm.diag=function(a)
        local size0 = a.tensor:size()[2]
        local b = torch.zeros(1,size0)
        for i = 1,size0 do
            b[1][i] = a.tensor[i][i]
        end
        return b
    end

    lm.inv=function(a)
        if (a:issquare() == torch.zeros(1)) then
        error("Error! \n The input argument is not square.")
        end
        if (a:rank() ~= a.n) then
       error("Error! \n The input argument is not invertible.")
        end
        local n = a.n
        local v = torch.ones(1,n)
        for i = 1,n do
            v[1][i] = find_row(a.v, i)
        end
        return newlm(v,n)
    end

    mt={
        __add=function(A,B)
            return lmkron(A,B)
        end
        ,
        __mul=function(C,D)
            local A = newlm(C)
            local B = newlm(D)
            local m =A:size()[{1,1}]
            local n = A:size()[{1,2}]
            local p = B:size()[{1,1}]
            local q = B:size()[{1,2}]
            local result
            if(n==p)then
                result=sp1(A.tensor,B.tensor)
                return newlm(result)
            elseif (n%p==0)then
                result=sp1(A.tensor,B.tensor)
                return newlm(result)
            elseif(p%n==0)then
                result=sp1(A.tensor,B.tensor)
                return newlm(result)
            else
                error("INput argument error")
            end
        end
        ,
        __pow=function(A,n)
            local B = newlm(A)
            if(n==1)then
                return B
            else
                return B*B^(n-1)
            end
        end

    }
    setmetatable(lm,mt)
    return lm
end

function lmsetdiff (A,B)
    if(A.n~=B.n)then
        error("The row numbers must agree")
    end
    return newlm(setdiff_m(A.v,B.v),A.n)
end

function lmctimes( a, b)
    local a = newlm(a)
    local b = newlm(b)
    if ((isempty(a) or isempty(b)) == 1) then
        error("Error! LM： ctimes\n Empty lm object!")
    end
    if (a:length() ~= b:length()) then
        error("Error! LM： ctimes\n The column numbers must agree.")
    end
    local n = a.n*b.n
    local aL = a:length()
    local v = torch.zeros(1,aL)
    for i = 1,aL do
        v[1][i] = (a.v[1][i] - 1)*b.n + b.v[1][i]
    end
    return newlm(v,n)
end

function find_row(x,n)
    local size = x:size()
    for i = 1,size[2] do
        if (x[{1,i}] == n) then
            return i
        end
    end
end




function lmeq(a,b)
    local re = torch.Tensor()
    if (a.class == 'lm' and b.class == 'lm') then
        if (a.n ~= b.n) then
            error("Error! LM:eq \n The column numbers must agree")
        end
        local x = torch.zeros(1,a.n)
        for i = 1,a.n do
            if (a.v[1][i] == b.v[1][i]) then
                x[1][i] = 1
            end
        end
        re = x
    elseif (a.class == 'lm' or b.class == 'lm') then
        if (a.class == 'lm') then
            if (torch.isTensor(b)) then
                local x = torch.zeros(1,a.n)
                for i = 1,a.n do
                    if (a.v[1][i] == b[1][i]) then
                        x[1][i] = 1
                    end
                end
                re = x
            end
        else
            if (torch.isTensor(a)) then
                local x = torch.zeros(1,a.n)
                for i = 1,a.n do
                    if (a.v[1][i] == b[1][i]) then
                        x[1][i] = 1
                    end
                end
                re = x
            end
        end
    end
    return re
end
