//TYVJ P1289
Const
  maxN=100;
Var
  f:array[0..maxN,1..6] of longint;
  ans,i,j,k,n:longint;
Begin
  readln(n);
  for j:=1 to 6 do f[1,j]:=1;
  for i:=1 to n do
    for j:=1 to 6 do
      for k:=1 to j do inc(f[i,j],f[i-1,k]);
  for j:=1 to 6 do inc(ans,f[n,j]);
  writeln(ans);
End.
