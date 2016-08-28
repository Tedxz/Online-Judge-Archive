//TYVJ P1055
Const
  maxN=300;
  INF=$10000000;
Var
  a:array[0..maxN] of longint;
  f:array[1..maxN,1..maxN] of longint;
  n,i,j,k,len:longint;
  function min(a,b:longint):longint;
    begin
      if a<b then exit(a) else exit(b);
    end;
Begin
  readln(n);
  for i:=1 to n do
    read(a[i]);
  for i:=1 to n-1 do
    f[i,i+1]:=a[i]+a[i+1];
  for i:=2 to n do inc(a[i],a[i-1]);
  for len:=3 to n do
    for i:=1 to n-len+1 do
      begin
       j:=i+len-1;
       f[i,j]:=INF;
       for k:=i to j-1 do
         f[i,j]:=min(f[i,j],f[i,k]+f[k+1,j]);
       f[i,j]:=f[i,j]-a[i-1]+a[j];
      end;
   writeln(f[1,n]);
End.
