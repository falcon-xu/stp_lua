function unique(A)
    local A_size = A:size()
    local A_size1 = A_size[1]
    local A_size2 = A_size[2]
    local B=torch.Tensor({{A[{1,1}]}})
    local n=1
    local flag
    for i=1,A_size1 do
        for j=1,A_size2 do
            flag=0
            for p=1,n do
                if(A[{i,j}]==B[{1,p}])then
                    flag=1
                end
            end
            if(flag==0)then
                B=torch.cat(B,torch.Tensor({{A[{i,j}]}}),2)
                n=n+1
            end
        end
    end
    return bubble(B)
end
