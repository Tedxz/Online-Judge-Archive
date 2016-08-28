//TYVJ P1305
Const
  maxN=300000;
Var
  q,a,f:array[0..maxN] of longint;
  n,m,i,h,t,ans:longint;
Begin
  a[0]:=0;
  readln(n,m);
  for i:=1 to n do begin read(a[i]); inc(a[i],a[i-1]); end;
  h:=0; t:=1;
  q[t]:=1;
  f[1]:=a[1];
  ans:=f[1];
  for i:=2 to n do
    begin
      while i-q[h]>m do inc(h);
      while (a[i]<a[q[t]]) and (t>=h) do dec(t);
      inc(t); q[t]:=i;
      f[i]:=a[i]-a[q[h]];
      if ans<f[i] then ans:=f[i];
    end;
  writeln(ans);
End.