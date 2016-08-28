//TYVJ P1011
Const
  maxN=50;
Var
  a:array[0..maxN,0..maxN] of longint;
  f:array[0..maxN*2,-1..maxN,-1..maxN] of longint;
  i,j,k,n,m:longint;
  function min(a,b:longint):longint;
    begin
      if a<b then exit(a) else exit(b);
    end;
Begin
  readln(n,m);
  dec(n); dec(m);
  for i:=0 to n do
    begin
      for j:=0 to m do read(a[i,j]);
      readln;
    end;
  f[0,0,0]:=0;
  for i:=1 to n+m do
    for j:=0 to min(n,i)-1 do
      for k:=j+1 to min(i,n) do
        begin
          f[i,j,k]:=f[i-1,j,k];
          if f[i-1,j-1,k]>f[i,j,k] then f[i,j,k]:=f[i-1,j-1,k];
          if f[i-1,j,k-1]>f[i,j,k] then f[i,j,k]:=f[i-1,j,k-1];
          if f[i-1,j-1,k-1]>f[i,j,k] then f[i,j,k]:=f[i-1,j-1,k-1];
          f[i,j,k]:=f[i,j,k]+a[j,i-j]+a[k,i-k];
        end;
  writeln(f[n+m-1,n-1,n]);
End.
