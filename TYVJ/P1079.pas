//TYVJ P1079
Const
  maxN=25;
Var
  a,f:array[1..maxN,1..maxN] of longint;
  i,j,k,n:integer;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
Begin
  readln(n);
  for i:=1 to n do
    begin
      for j:=1 to i do read(a[i,j]);
      readln;
    end;
  for i:=1 to n>>1-1 do a[n>>1,i]:=-maxint;
  for i:=1 to n do f[n,i]:=a[n,i];
  for i:=n-1 downto 1 do
    for j:=1 to i do f[i,j]:=max(f[i+1,j],f[i+1,j+1])+a[i,j];
  writeln(f[1,1]);
End.
