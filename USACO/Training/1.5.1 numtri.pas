{
USER: Xie Zheng
TASK: numtri
LANG: PASCAL
}
Program numtri; //USACO 1.5.1
Var
  a,f:array[1..1000,1..1000] of longint;
  i,j,n:integer;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
Begin
  assign(input,'numtri.in'); reset(input);
  assign(output,'numtri.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      for j:=1 to i do
        read(a[i,j]);
      readln;
    end;
  for i:=1 to n do f[n,i]:=a[n,i];
  for i:=n-1 downto 1 do
    for j:=1 to i do
      f[i,j]:=a[i,j]+max(f[i+1,j],f[i+1,j+1]);
  writeln(f[1,1]);
  close(input);
  close(output);
End.


