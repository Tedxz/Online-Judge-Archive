//NOIP 2006 2
Uses math;
Const
  maxM=60;
  maxN=32000;
Var
  v,c:array[1..maxM] of longint;
  son:array[1..maxM,1..2] of shortint;
  i,j,k,n,m:longint;
  b:array[1..maxM] of boolean;
  f:array[0..maxN div 10] of longint;
Begin
  readln(n,m); n:=n div 10;
  for i:=1 to m do
    begin
      readln(c[i],v[i],k);
      c[i]:=c[i] div 10;
      v[i]:=v[i]*c[i];
      if k=0 then b[i]:=true;
      if k=0 then continue;
      if son[k,1]=0 then son[k,1]:=i else son[k,2]:=i;
    end;
  for i:=1 to m do
    if b[i] then
      for j:=n downto c[i] do
        begin
          f[j]:=max(f[j],f[j-c[i]]+v[i]);
          if son[i,1]=0 then continue;
          if j-c[i]-c[son[i,1]]>=0 then
            f[j]:=max(f[j],f[j-c[i]-c[son[i,1]]]+v[i]+v[son[i,1]]);
          if son[i,2]=0 then continue;
          if j-c[i]-c[son[i,2]]>=0 then
            f[j]:=max(f[j],f[j-c[i]-c[son[i,2]]]+v[i]+v[son[i,2]]);
          if j-c[i]-c[son[i,1]]-c[son[i,2]]>=0 then
            f[j]:=max(f[j],f[j-c[i]-c[son[i,1]]-c[son[i,2]]]+v[i]+v[son[i,1]]+v[son[i,2]]);
        end;
  writeln(f[n]*10);
End.
