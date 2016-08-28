//TYVJ P1287
Uses math;
Const
  maxN=1024;
  INF=int64(1)<<60;
Var
  f:array[-1..maxN,-1..maxN] of int64;
  ans:int64;
  i,j,k,r,g,b,n,t:longint;
Begin
  readln(n,r,g,b,t);
  for i:=0 to n do begin f[-1,i]:=-INF; f[i,-1]:=-INF; end;
  for i:=0 to n do
    for j:=0 to n-i do
      begin
        f[i,j]:=max(f[i,j],f[i-1,j]+int64(g)*j*(t+(i-1)*b));
        f[i,j]:=max(f[i,j],f[i,j-1]+int64(g)*(j-1)*(t+i*b));
        ans:=max(ans,f[i,j]+(int64(n)-i-j)*(t+b*i)*(r+g*j));
      end;
  writeln(ans);
End.
