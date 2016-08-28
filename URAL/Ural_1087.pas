Program Ural_1087;
Const
  maxN=10010;
  maxM=50;
Var
  k:array[1..maxM] of longint;
  f:array[0..maxN*2] of boolean;
  i,j,n,m:longint;
Begin
  readln(n,m);
  for i:=1 to m do read(k[i]);
  fillchar(f,sizeof(f),false);
  f[0]:=true;
  for i:=1 to n do
    for j:=1 to m do
      begin
        if i-k[j]<0 then continue;
        if not f[i-k[j]] then 
          begin f[i]:=true; break; end;
      end;
  if f[n] then writeln(1) else writeln(2);
End.