Program RQNOJ_39;
Var
  i,j,c,b,ans:longint;
  a:array[1..21] of longint;
  procedure dfs(k,num:longint);
    begin
      if k=b+1 then begin if (num>ans) then ans:=num; exit; end;
      dfs(k+1,num);
      if num+a[k]<=c then dfs(k+1,num+a[k]);
    end;
Begin
  readln(c,b);
  for i:=1 to b do
    read(a[i]);
  ans:=0;
  dfs(1,0);
  writeln(ans);
End.