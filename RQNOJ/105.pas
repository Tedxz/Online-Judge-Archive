Program RQNOJ_105;
Var
  n,m:integer;
  s:int64;
  procedure dfs(k,num:integer);
    begin
      if k=n+1 then begin inc(s); exit; end;
      dfs(k+1,0);
      if num<m then dfs(k+1,num+1);
    end;
Begin
  readln(n,m);
  s:=0;
  dfs(1,0);
  writeln(s);
End.