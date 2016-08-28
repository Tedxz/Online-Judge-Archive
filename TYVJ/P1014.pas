//TYVJ P1014
Var
  a:array[1..100] of dword;
  f:array[1..100,1..100] of int64;
  i,j,k,len,n:dword;
Begin
  readln(n);
  for i:=1 to n do read(a[i]);
  for i:=1 to n-1 do f[i,i+1]:=0;
  for i:=1 to n-2 do f[i,i+2]:=a[i]*a[i+1]*a[i+2];
  for len:=4 to n do
    for i:=1 to n-len+1 do
      begin
        j:=i+len-1;
        f[i,j]:=1<<60;
        for k:=i+1 to j-1 do
          if f[i,j]>f[i,k]+f[k,j]+a[i]*a[k]*a[j] then f[i,j]:=f[i,k]+f[k,j]+a[i]*a[k]*a[j];
      end;
  writeln(f[1,n]);
End.
