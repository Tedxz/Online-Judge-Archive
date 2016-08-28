//TYVJ P1258
Const
  maxN=100;
Var
  w:array[1..maxN] of longint;
  e:array[1..maxN,1..maxN-1] of integer;
  ans,i,j,k,n:longint;
  f:array[1..maxN] of longint;
  function dfs(i:integer):longint;
    var j,max:longint;
    begin
      if f[i]>0 then exit(f[i]);
      if e[i,1]=0 then begin f[i]:=w[i]; exit(w[i]); end;
      dfs:=w[i];
      j:=1;
      max:=0;
      while e[i,j]<>0 do
        begin
          if max<dfs(e[i,j]) then max:=f[e[i,j]];
          inc(j);
        end;
      inc(dfs,max);
      f[i]:=dfs;
    end;
Begin
  readln(n);
  for i:=1 to n do
    begin
      read(w[i]);
      j:=0;
      while not eoln do
        begin
          inc(j);
          read(e[i,j]);
        end;
      readln;
    end;
  for i:=1 to n do
    if f[i]=0 then
      begin f[i]:=dfs(i); if f[i]>ans then ans:=f[i]; end;
  writeln(ans);
End.
