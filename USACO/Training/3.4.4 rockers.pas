{
USER: Xie Zheng
TASK: rockers
LANG: PASCAL
}
Program rockers; //USACO 3.4.4
Const
  maxN=20;
  maxT=20;
  maxM=20;
Var
  f:array[0..maxN,0..maxM,0..maxT] of longint;
  cost:array[1..maxN] of longint;
  i,j,k,n,t,m:longint;
Begin
  assign(input,'rockers.in'); reset(input);
  assign(output,'rockers.out'); rewrite(output);
  readln(n,t,m);
  for i:=1 to n do read(cost[i]);
  close(input);
  fillchar(f,sizeof(f),0);
  for i:=1 to n do
    for j:=0 to m do
      for k:=0 to t do
        begin
          f[i,j,k]:=f[i-1,j,k];
          if cost[i]>t then continue;
          if (k>=cost[i]) and (f[i-1,j,k-cost[i]]+1>f[i,j,k]) then
            f[i,j,k]:=f[i-1,j,k-cost[i]]+1;
          if (j>0) and (cost[i]>k) and (f[i-1,j-1,t-cost[i]]+1>f[i,j,k]) then
            f[i,j,k]:=f[i-1,j-1,t-cost[i]]+1;
        end;
  writeln(f[n,m,0]);
  close(output);
End.
