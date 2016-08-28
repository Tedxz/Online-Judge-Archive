Program RQNOJ_26;
Var
  a,f,g,h:array[1..100] of integer;
  i,j,k,n:integer;
  ans,s:integer;
Begin
  readln(n);
  for i:=1 to n do read(a[i]);
  fillchar(f,sizeof(f),0);
  fillchar(g,sizeof(g),0);
  f[1]:=1;
  for i:=2 to n do
    begin
      for j:=1 to i-1 do
        if (a[j]<a[i]) and (f[i]<f[j]) then f[i]:=f[j];
      inc(f[i]);
    end;
  g[n]:=1;
  for i:=n-1 downto 1 do
    begin
      for j:=n downto i+1 do
        if (a[j]<a[i]) and (g[i]<g[j]) then g[i]:=g[j];
      inc(g[i]);
    end;
  for i:=1 to n do
    if ans<f[i]+g[i] then ans:=f[i]+g[i];
  ans:=n-ans+1;
  writeln(ans);
End.