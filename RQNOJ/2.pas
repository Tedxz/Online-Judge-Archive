Program RQNOJ_2;
Var
  w,v:array[1..100] of integer;
  n,m,i,j:integer;
  ans:int64;
  f:array[1..100] of boolean;
  procedure dfs(k,rst:longint;num:int64);
    var i,j:integer;
    begin
      if k=m+1 then
        begin
          if num>ans then ans:=num;
          exit;
        end;

      if rst>v[k] then
        dfs(k+1,rst-v[k],num+w[k]*v[k]);
      dfs(k+1,rst,num);
    end;
Begin
  readln(n,m);
  for i:=1 to m do
    read(v[i],w[i]);
  ans:=0;
  dfs(1,n,0);
  writeln(ans);
End.