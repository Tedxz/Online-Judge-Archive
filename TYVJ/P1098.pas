//TYVJ P1098
Const
  maxN=5000;
  INF=$F000000;
Var
  time,cost:array[0..maxN] of longint;
  f:array[0..maxN] of int64;
  i,j,n,s:longint;
Begin
  readln(n); readln(s);
  for i:=1 to n do
    begin
      readln(time[i],cost[i]);
      inc(time[i],time[i-1]);
      inc(cost[i],cost[i-1]);
    end;
  f[1]:=cost[n]*(time[1]*s);
  for i:=1 to n do
    begin
      f[i]:=INF;
      for j:=0 to i-1 do
        if f[i]>f[j]+(cost[n]-cost[j])*(time[i]-time[j]+s) then
          f[i]:=f[j]+(cost[n]-cost[j])*(time[i]-time[j]+s);
    end;
  writeln(f[n]);
End.
