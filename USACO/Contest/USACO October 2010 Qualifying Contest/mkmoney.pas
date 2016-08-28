{
USER: Xie Zheng
TASK: mkmoney
LANG: PASCAL
}
Program mkmoney; //USACO October 2010 Gold Qualifying Contest
Const
  maxN=100;
  maxM=100000;
 Var
   i,j,n,m,ans:longint;
   cost,val:array[1..maxN+1] of longint;
   f:array[0..maxM] of longint;
   function max(a,b:longint):longint;
     begin
       if a>b then exit(a) else exit(b);
     end;
Begin
  assign(input,'mkmoney.in'); reset(input);
  assign(output,'mkmoney.out'); rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      readln(cost[i],val[i]);
      dec(val[i],cost[i]);
    end;
  inc(n); cost[n]:=1; val[n]:=1;
  close(input);
  f[0]:=0;
  for i:=1 to n do
    for j:=cost[i] to m do
      f[j]:=max(f[j],f[j-cost[i]]+val[i]);
  writeln(f[m]);
  close(output);
End.

