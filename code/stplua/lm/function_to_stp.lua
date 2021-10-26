function trans_to_stp(a,b)
    local a_size = a:size()
    local a_size1 = a_size[1]
    local a_size2 = a_size[2]
    local b=torch.zeros(b,a_size2)
    for i=1,a_size2 do
        b[{a[{1,i}],i}]=1
    end
    return b
end
