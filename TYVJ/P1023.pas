//TYVJ P1023
Const
  maxN=2000;
  maxM=500;
Var
  i,j,k,n,m:longint;
  f:array[0..maxN,0..maxM] of longint;
  d:array[1..maxN] of integer;
Begin
  readln(n,m);
  for i:=1 to n do readln(d[i]);
  for i:=1 to n do
    begin
      f[i,0]:=f[i-1,0];
      for k:=1 to i do if f[i-k,k]>f[i,0] then f[i,0]:=f[i-k,k];
      for j:=1 to m do
        f[i,j]:=f[i-1,j-1]+d[i];
    end;
  writeln(f[n,0]);
End.
