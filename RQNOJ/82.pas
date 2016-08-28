Program RQNOJ__82;
Var
  f:array[-1..10000,1..2] of longint;
  a:array[1..10000] of integer;
  n,i,j:longint;
  function min(a,b:longint):longint;
    begin
      if a<b then exit(a) else exit(b);
    end;
Begin
  readln(n);
  for i:=1 to n do read(a[i]);
  f[-1,1]:=0; f[-1,2]:=0;
  f[0,1]:=0; f[0,2]:=0;
  for i:=1 to n do
    begin
      f[i,1]:=min(f[i-1,1],f[i-1,2])+a[i];
      f[i,2]:=min(f[i-1,1],f[i-2,1]);
    end;
  writeln(min(f[i,1],f[i,2]));
End.

