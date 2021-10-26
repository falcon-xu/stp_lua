function det(A)
Aeig=torch.eig(A)
eigsize=Aeig:size()
det1=1
for i=1,eigsize[1] do
if(Aeig[i][2]==0)
then
det1=det1*Aeig[i][1]
else
det1=det1*(Aeig[i][1]^2+Aeig[i][2]^2)^0.5
end
end
return det1
end
