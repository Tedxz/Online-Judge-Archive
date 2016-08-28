//TYVJ P1238
Const
  maxN=100;
  maxM=1000;
Var
  head:array[0..maxN] of integer;
  cost,dis:array[0..maxN] of longint;
  e:array[1..maxM,1..3] of longint;
  h,t,i,j,k,m,n:longint;
  q:array[1..maxN] of integer;
  v:array[0..maxN] of boolean;
  procedure SPFA;
    begin
      h:=0; t:=1; q[1]:=0;
      filldword(dis,sizeof(dis)>>2,$1000000);
      filldword(cost,sizeof(cost)>>2,$10000000);
      dis[0]:=0;
      cost[0]:=0;
      while h<>t do
        begin
          h:=h mod maxN+1;
          k:=head[q[h]];
          while k>0 do
            begin
              if (dis[e[k,1]]>dis[q[h]]+1) or ((dis[e[k,1]]=dis[q[h]]+1) and (cost[e[k,1]]>cost[q[h]]+e[k,2])) then
                begin
                  t:=t mod maxN+1;
                  q[t]:=e[k,1];
                  dis[q[t]]:=dis[q[h]]+1; cost[q[t]]:=cost[q[h]]+e[k,2];
                end;
              k:=e[k,3];
            end;
        end;
    end;
Begin
  readln(n,m);
  for i:=1 to m do
    begin
      readln(j,e[i,1],e[i,2]);
      e[i,3]:=head[j]; head[j]:=i;
    end;
  SPFA;
  writeln(cost[1]);
End.
