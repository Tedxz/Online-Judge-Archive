//TYVJ P1044
Var
  f,a:array[1..25,1..25] of longint;
  i,j,n:longint;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
Begin
  readln(n);
  for i:=1 to n do
    for j:=1 to i do
      read(a[i,j]);
  for i:=1 to n do
    f[n,i]:=a[n,i];
  for i:=n-1 downto 1 do
    for j:=1 to i do
      f[i,j]:=max(f[i+1,j],f[i+1,j+1])+a[i,j];
  writeln(f[1,1]);
End.