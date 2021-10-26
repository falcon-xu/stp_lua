function bubble(B)
  local len = B:size()[2]
  local B_size1=B:size()[1]
  local A=torch.zeros(B_size1,len)
  for m=1,B_size1 do
      for n=1,len do
          A[{m,n}]=B[{m,n}]
      end
  end
  local i = 1
  local j = 1
  local temp = 0
  while(true)
  do
    if(i > len)
    then
      break
    end
    j = 1
    while(true)
    do
      if(j > len - i)
      then
        break
      end
      if(A[1][j] > A[1][j + 1])
      then
        temp = A[1][j]
        A[1][j] = A[1][j + 1]
        A[1][j + 1] = temp
      end
      j = j + 1
    end
    i = i + 1
  end
  return A
end
