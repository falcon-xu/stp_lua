function setdiff_m (A,B)
    local A_size = A:size()
    local B_size = B:size()
    local A_size1 = A_size[1]
    local A_size2 = A_size[2]
    local B_size1 = B_size[1]
    local B_size2 = B_size[2]
    local C
    local none="ans = []"
    local flag=0
    for i=1,A_size1 do
        for j=1,A_size2 do
            flag=0
            for m=1,B_size1 do
                for n=1,B_size2 do
                    if(A[{i,j}]==B[{m,n}])then
                        flag=1
                    end
                end
            end
            if(flag==0)then
                if(type(C)=="nil")then
                    C=torch.Tensor({{A[{i,j}]}})
                else
                    C=torch.cat(C,torch.Tensor({{A[{i,j}]}}),2)
                end
            end
        end
    end
    if(type(C)=="nil")then
        return none
    else
        return bubble(C)
    end
end
