//NOIP 2002 1
Const
  maxN=100;
Var
  a:array[1..maxN] of longint;
  ans,i,sum,n:longint;
Begin
  readln(n);
  for i:=1 to n do begin read(a[i]); inc(sum,a[i]); end;
  sum:=sum div n;
  for i:=1 to n-1 do
    if a[i]<>sum then
      begin
        inc(ans);
        inc(a[i+1],a[i]-sum);
      end;
  writeln(ans);
End.
