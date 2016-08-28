//TYVJ P1087
Const
  maxN=1000000;
Var
  f:array[0..maxN] of int64;
  i,n:longint;
Begin
  readln(n);
  f[1]:=1;
  f[2]:=2;
  for i:=3 to n do
    if i and 1=1 then f[i]:=f[i-1]
      else f[i]:=(f[i-1]+f[i>>1]) mod 1000000000;
  writeln(f[n] mod 10000000000);
End.
