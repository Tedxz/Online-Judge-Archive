Program RQNOJ_95;
Var
  v,w:array[1..100] of integer;
  n,m,i,j,l,ans:longint;
  procedure dfs(k,x,sum,ti:longint);
    begin
      if x=m then
        begin
          if sum>ans then ans:=sum;
          exit;
        end;
      if k=n+1 then exit;
      if ti=0 then exit;
      dfs(k+1,x,sum,ti);
      if ti>=v[k] then dfs(k+1,x+1,sum+w[k],ti-v[k]);
    end;
Begin
  readln(n,m,l);
  for i:=1 to n do
    readln(v[i],w[i]);
  ans:=0;
  dfs(1,0,0,l);
  writeln(ans);
End.
