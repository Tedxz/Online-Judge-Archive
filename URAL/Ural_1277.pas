Program Ural_1277;
Const
  maxN=110;
  maxM=11000;
  newN=maxN*2;
  newM=maxN*2+maxM*4;
  INF=$10000000;
Type
  edge=record
    a,c,next:longint;
  end;
Var
  e:array[1..newM] of edge;
  head,cur,dis,pre,back:array[1..newN] of longint;
  gap:array[0..newN] of longint;
  s,t,nn,nm,i,j,k,n,m,x,y:longint;
  max_flow:longint;
  function op(k:longint):longint;
    begin if (k and 1=1) then exit(k+1) else exit(k-1); end;
  procedure add_edge(x,y,c1,c2:longint);
    begin
      inc(nm);
      e[nm].a:=y; e[nm].c:=c1; e[nm].next:=head[x]; head[x]:=nm;
      inc(nm);
      e[nm].a:=x; e[nm].c:=c2; e[nm].next:=head[y]; head[y]:=nm;
    end;
  procedure SAP;
    var i,k,min,flow_now:longint;
        flag:boolean;
    begin
      if s>>1=t>>1 then begin max_flow:=INF; exit; end;
      filldword(gap,sizeof(gap)>>2,0);
      gap[0]:=nn;
      cur:=head;
      filldword(dis,sizeof(dis)>>2,0);
      i:=s;
      flow_now:=INF;
      max_flow:=0;
      while dis[s]<nn do
        begin
          flag:=false;
          back[i]:=flow_now;
          k:=cur[i];
          while k>0 do
            begin
              if (e[k].c>0) and (dis[i]=dis[e[k].a]+1) then
                begin
                  flag:=true;
                  cur[i]:=k;
                  i:=e[k].a;
                  pre[i]:=k;
                  if flow_now>e[k].c then flow_now:=e[k].c;
                  if i=t then
                    begin
                      inc(max_flow,flow_now);
                      while i<>s do
                        begin
                          dec(e[pre[i]].c,flow_now);
                          inc(e[op(pre[i])].c,flow_now);
                          i:=e[op(pre[i])].a;
                        end;
                      flow_now:=INF;
                    end;
                  break;
                end;
              k:=e[k].next;
            end;
          if flag then continue;
          min:=nn+1;
          k:=head[i];
          while k>0 do
            begin
              if (e[k].c>0) and (dis[e[k].a]<min) then
                begin
                  min:=dis[e[k].a];
                  cur[i]:=k;
                end;
              k:=e[k].next;
            end;
          dec(gap[dis[i]]);
          if gap[dis[i]]=0 then exit;
          dis[i]:=min+1;
          inc(gap[min+1]);
          if i<>s then
            begin
              i:=e[op(pre[i])].a;
              flow_now:=back[i];
            end;
        end;
    end;
Begin
  readln(k);
  readln(n,m,s,t);
  s:=s<<1+1; t:=t<<1; nn:=n<<1;
  nm:=0;
  for i:=1 to n do
    begin
      read(x);
      add_edge(i*2,i*2+1,x,0);
    end;
  for i:=1 to m do
    begin
      readln(x,y);
      add_edge(x<<1+1,y<<1,INF,0);
      add_edge(y<<1+1,x<<1,INF,0);
    end;
  SAP;
  if k>=max_flow then writeln('YES') else writeln('NO');
End.
