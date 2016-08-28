Program Ural_1774;
Const
  maxN=150;
  maxT=3000;
  maxV=3000;
Type
  edge=record
    a,next,c:longint;
  end;
Var
  head,cur:array[0..maxV] of longint;
  e:array[1..maxT*maxN*2] of edge;
  i,j,k,n,m,v,s,t:longint;
  tl,ts:array[1..maxN] of longint;
  fir:boolean;
  max_time,min_time,max_flow:longint;

  function op(k:longint):longint;
    begin
      if (k and 1=1) then exit(k+1) else exit(k-1);
    end;

  procedure add_edge(x,y,c1,c2:longint);
    begin
      inc(m);
      e[m].a:=y; e[m].c:=c1; e[m].next:=head[x]; head[x]:=m;
      inc(m);
      e[m].a:=x; e[m].c:=c2; e[m].next:=head[y]; head[y]:=m;
    end;


  procedure build_graph;
    var i,j:longint;
    begin
      m:=0; s:=0; t:=maxV;
      v:=max_time+n+2;
      for i:=max_time downto min_time do
        add_edge(s,i,k,0);
      for i:=max_time downto min_time do
        for j:=n downto 1 do
          if (i>=ts[j]) and (i<=ts[j]+tl[j]-1) then
            add_edge(i,j+max_time,1,0);
      for i:=1 to n do
        add_edge(i+max_time,t,2,0);
    end;

  procedure SAP;
    var
      dis,gap,back,pre:array[0..maxV] of longint;
      min,i,k,flow_now:longint;
      flag:boolean;
    begin
      filldword(gap,sizeof(gap)>>2,0);
      gap[0]:=v;
      filldword(dis,sizeof(dis)>>2,0);
      cur:=head;
      max_flow:=0;
      flow_now:=maxlongint;
      i:=s;
      while dis[s]<v do
        begin
          flag:=false;
          back[i]:=flow_now;
          k:=cur[i];
          while k>0 do
            begin
              if (dis[e[k].a]+1=dis[i]) and (e[k].c>0) then
                begin
                  flag:=true;
                  if flow_now>e[k].c then flow_now:=e[k].c;
                  cur[i]:=k;
                  i:=e[k].a;
                  pre[i]:=k;
                  if i=t then
                    begin
                      inc(max_flow,flow_now);
                      while i<>s do
                        begin
                          dec(e[pre[i]].c,flow_now);
                          inc(e[op(pre[i])].c,flow_now);
                          i:=e[op(pre[i])].a;
                        end;
                      flow_now:=maxlongint;
                    end;
                  break;
                end;
              k:=e[k].next;
            end;
          if flag then continue;
          min:=v;
          k:=head[i];
          while k>0 do
            begin
              if (min>dis[e[k].a]) and (e[k].c>0) then
                begin
                  min:=dis[e[k].a];
                  cur[i]:=k;
                end;
              k:=e[k].next;
            end;
          dec(gap[dis[i]]);
          if gap[dis[i]]=0 then exit;
          dis[i]:=min+1;
          inc(gap[dis[i]]);
          if i<>s then
            begin
              i:=e[op(pre[i])].a;
              flow_now:=back[i];
            end;
        end;
    end;
Begin
  readln(n,k);
  max_time:=0; min_time:=maxlongint;
  for i:=1 to n do
    begin
      readln(ts[i],tl[i]);
      if max_time<ts[i]+tl[i] then max_time:=ts[i]+tl[i];
      if min_time>ts[i] then min_time:=ts[i];
    end;
  build_graph;
  SAP;
  if max_flow=n<<1 then
    begin
      writeln('Yes');
      for i:=1 to n do
        begin
          fir:=true;
          k:=head[i+max_time];
          while k>0 do
            begin
              if e[k].c=1 then
                begin
                  write(e[k].a);
                  if fir then write(' ') else writeln;
                  fir:=false;
                end;
              k:=e[k].next;
            end;
        end;
    end
  else writeln('No');
End.
