function rank(A)
local U,S,V=torch.svd(A)
local n0=S:size()
local rank1=0
for i=1,n0[1] do
if(S[i]~=0)
then
rank1=rank1+1
end
end
return rank1
end
