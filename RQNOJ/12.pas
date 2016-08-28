Program RQNOJ_12;
Var
  a:array[1..10] of integer;
  i,n,ans:integer;
Begin
  for i:=1 to 10 do
    read(a[i]);
  readln(n);
  n:=n+30;
  ans:=0;
  for i:=1 to 10 do
    if a[i]<=n then inc(ans);
  writeln(ans);
End.