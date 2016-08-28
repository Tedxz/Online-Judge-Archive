Program RQNOJ_15;
Var
  f:array[0..100,0..1000] of longint;
  t,w:array[1..100] of integer;
  i,j,m,s:integer;
Begin
  readln(s,m);
  for i:=1 to m do readln(t[i],w[i]);
  for i:=0 to m do f[i,0]:=0;
  for j:=0 to s do f[0,j]:=0;
  for i:=1 to m do
    for j:=1 to s do
      begin
        f[i,j]:=f[i-1,j];
        if (t[i]<=j)and(f[i-1,j-t[i]]+w[i]>f[i,j]) then
          f[i,j]:=f[i-1,j-t[i]]+w[i];
      end;
  writeln(f[m,s]);
End.