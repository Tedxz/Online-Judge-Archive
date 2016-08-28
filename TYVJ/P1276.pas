//TYVJ P1276
Const
  maxN=100;
  maxG=50000;
Var
  n,g,j,i,k,mi,gi,pi:longint;
  f:array[1..maxG] of longint;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
Begin
  readln(n,g);
  for i:=1 to n do
    begin
      readln(mi,gi,pi);
      if mi=-1 then
        for j:=gi to g do f[j]:=max(f[j],f[j-gi]+pi)
      else
        for k:=1 to mi do
          for j:=g downto gi do f[j]:=max(f[j],f[j-gi]+pi);
    end;
  writeln(f[g]);
End.
