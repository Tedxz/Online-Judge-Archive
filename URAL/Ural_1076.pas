Program Ural_1076;
Const
  maxN=200;
Type
  edge=record
    a,c,w,next:longint;
  end;
Var
  e:array[1..maxN*maxN*2] of edge;
  head:array[0..maxN*2] of longint;
  a:array[1..maxN,1..maxN] of longint;
  sum:array[1..maxN] of longint;
  cost,max_flow,i,j,k,n,m,v,s,t:longint;   //m:number of edge     v:number of vertex
  procedure add_edge(x,y,c1,c2,cost:longint);
    begin
      inc(m);
      e[m].a:=y; e[m].c:=c1; e[m].w:=cost;
      e[m].next:=head[x]; head[x]:=m;
      inc(m);
      e[m].a:=x; e[m].c:=c2; e[m].w:=-cost;
      e[m].next:=head[y]; head[y]:=m;
    end;
  function op(k:longint):longint;
    begin
      if (k and 1=1) then exit(k+1) else exit(k-1);
    end;
  procedure build_graph;
    var i,j:longint;
    begin
      m:=0;
      s:=0; t:=n<<1+1;
      for i:=1 to n do
        begin
          add_edge(s,i,1,0,0);
          add_edge(i+n,t,1,0,0);
          for j:=1 to n do add_edge(i,j+n,1,0,sum[i]-a[i,j]);
        end;
    end;
  procedure MCF;
    var
      dis,pre:array[0..maxN*2] of longint;
      q:array[1..512] of longint;
      v:array[1..maxN*2] of boolean;
      qh,qt,k,flow_now:longint;
    begin
      cost:=0; max_flow:=0;
      flow_now:=maxlongint;
      while flow_now>0 do
        begin
          filldword(dis,sizeof(dis)>>2,$10000000);
          dis[s]:=0;
          fillchar(v,sizeof(v),false);
          qh:=0; qt:=1;q[1]:=s;
          flow_now:=maxlongint;
          while qh<>qt do
            begin
              qh:=qh and 511+1;
              k:=head[q[qh]];
              v[q[qh]]:=false;
              while k>0 do
                begin
                  if (e[k].c>0) and (dis[e[k].a]>dis[q[qh]]+e[k].w) then
                    begin
                      dis[e[k].a]:=dis[q[qh]]+e[k].w;
                      pre[e[k].a]:=k;
                      if not v[e[k].a] then
                        begin
                          qt:=qt and 511+1;
                          q[qt]:=e[k].a;
                          v[q[qt]]:=true;
                        end;
                    end;
                  k:=e[k].next;
                end;
            end;
          i:=t;
          while i<>s do
            begin
              if flow_now>e[pre[i]].c then flow_now:=e[pre[i]].c;
              i:=e[op(pre[i])].a;
            end;
          i:=t;
          while i<>s do
            begin
              dec(e[pre[i]].c,flow_now);
              inc(e[op(pre[i])].c,flow_now);
              inc(cost,e[pre[i]].w*flow_now);
              i:=e[op(pre[i])].a;
            end;
          inc(max_flow,flow_now);
        end;
    end;
Begin
  readln(n);
  for i:=1 to n do
    for j:=1 to n do
      begin
        read(a[i,j]);
        inc(sum[i],a[i,j]);
      end;
  build_graph;
  MCF;
  writeln(cost);
End.