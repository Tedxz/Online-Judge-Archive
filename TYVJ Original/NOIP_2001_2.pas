//NOIP 2001 2
Const
  maxN=200;
  maxK=6;
Var
  f:array[1..maxK,1..maxN]of longint;
  i,j,n,k:longint;
Begin
  readln(n,k);
  for i:=1 to k do
    begin
      f[i,i]:=1;
      for j:=i+1 to n do
        f[i,j]:=f[i-1,j-1]+f[i,j-i];
    end;
  writeln(f[k,n]);
End.
