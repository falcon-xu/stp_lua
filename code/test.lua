---载入stp工具箱
require "loadstp"
loadstp()
---基本函数
---sp函数
x=torch.Tensor({{1,2,3,-1}})
y=torch.Tensor({{2},{1}})
r1=sp(x,y)
print(r1)
---r1=[5  3]
---[torch.DoubleTensor of size 1x2]
x=torch.Tensor({{2,1}})
y=torch.Tensor({{1},{2},{3},{-1}})
r2=sp(x,y)
print(r2)
---r1=[5 ;3]
---[torch.DoubleTensor of size 2x1]
x=torch.Tensor({{1,2,1,1},{2,3,1,2},{3,2,1,0}})
y=torch.Tensor({{1,-2},{2,-1}})
r3=sp(x,y)
r4=sp1(x,y)
---r3 = r4 = [3,4,−3,−5;4,7,−5,−8;5,2,−7,−4]
---[torch.DoubleTensor of size 3x4]
r5=sp(sp(x,y),y)
r6=spn(x,y,y)
---r5=r6=[−3,−6,−3,−3;−6,−9,−3,−6;−9,−6,−3,0]
---[torch.DoubleTensor of size 3x4]
---bt函数
z=torch.Tensor({{1,2,3,4},{5,6,7,8},{9,10,11,12},{13,14,15,16}})
z1=bt(z,2,2)
z2=bt(z,1,4)
z3=bt(z,4,1)
print(z1)
print(z2)
print(z3)
---wij函数
test_wij=wij(2,3)
---vc函数
test_vc=vc(x)
---vr函数
test_vr=vr(x)
---invvc
invv_test=torch.Tensor({{1,2,3,4,5,6,7,8}})
invvc(invv_test,2)
---invvr
invvr(invv_test,2)

---stp类
a=newstp(x)
b=newstp(y)
c0=spn(x,y,y)
c=a*b*b
print(c.tensor)
print(c0)
---类转换成向量
c1=c:double()
print(c1)
---stp类的length
length1=c:length()
print(length1)
---stp类的size
size1=c:size()
print(size1)
---stp类的转置和共轭转职
a:transpose();
a:ctranspose();
---判断stp类中对应元素是否相等（相同维度的stp类）
c=newstp(x)
eq_test=stpeq(a,c)
print(eq_test.tensor)
times_test=stptimes(a,c)
times_test:double()
---对四个符号的重载
d=a+c
e=a-c
f=a^2
g=a*a




---lm类
m=torch.Tensor({{1,2,2,2}})
lm1=newlm(m,2)
lm1:display()
unique_test=lm1:unique()
unique_test:display()
lm1:issquare()
lm1:length()
lm1:size()
lm2=newlm(m,4)
lm2:diag()
lm2:issquare()
lm2:trace()
lm3=newlm(torch.Tensor({{1,2,4,3}}),4)
lm3:inv():display()
(lm1*lm2):display()
(lm1+lm2):display()
(lm1^2):display()
lmctimes_test=lmctimes(lm2,lm3)
lsp_test=lsp(lm1,lm2)
leye(3)
lmn(2)
lmc(2)
lmd(2)
lmi(2)
lme(2)
lmr(2)
lmu(2)
lmrand(2,3)
