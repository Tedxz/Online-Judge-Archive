Program RQNOJ_72;
Var
  a:array[1..100] of integer;
  n,i,s,sum,ans:longint;
  t:integer;
  procedure dfs(k,w:longint);
    begin
      if k=n then exit;
      if w>s then exit;
      if ans<w then ans:=w;
      if ans=s then begin writeln(((s-ans) shl 1)+t); halt; end;
      dfs(k+1,w+a[k]);
      dfs(k+1,w);
    end;

Begin
  readln(n);
  s:=0;
  for i:=1 to n do
    begin
      read(a[i]);
      s:=s+a[i];
    end;
  t:=s and 1;
  s:=s shr 1;
  dfs(1,0);
  writeln(((s-ans) shl 1)+t);
End.
