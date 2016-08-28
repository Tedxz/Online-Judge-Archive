//Program Ural_1421;
Const
  maxN=210;
Type
  edge=record
    a,c,next:longint;
  end;
Var
  i,j,k,n,m,max_flow,num,sum_a,sum_b,v,s,t:longint;
  a,b:array[1..maxN] of longint;
  e:array[1..maxN*maxN] of edge;
  head,cur:array[0..maxN*2] of longint;
  ans:array[0..maxN,0..maxN] of integer;
  dis,pre,back,gap:array[0..maxN*2] of longint;
  function op(k:longint):longint;
    begin
      if k and 1=1 then exit(k+1) else exit(k-1);
    end;
  procedure add_edge(x,y,c1,c2:longint);
    begin
      inc(num);
      e[num].a:=y; e[num].c:=c1; e[num].next:=head[x]; head[x]:=num;
      inc(num);
      e[num].a:=x; e[num].c:=c2; e[num].next:=head[y]; head[y]:=num;
    end;
  procedure build_graph;
    var i,j:longint;
    begin
      s:=0; t:=n<<1+1;
      num:=0;
      for i:=1 to n do
        begin
          add_edge(s,i,a[i],0);
          add_edge(i+n,t,b[i],0);
          for j:=1 to n do add_edge(i,j+n,100,0);
        end;
    end;
  procedure SAP;
    var
      flow_now,i,k,min:longint;
      flag:boolean;
    begin
      i:=s;
      cur:=head;
      filldword(gap,sizeof(gap)>>2,0);
      filldword(dis,sizeof(dis)>>2,0);
      gap[0]:=v;
      flow_now:=maxlongint;
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
              if (dis[e[k].a]<min) and (e[k].c>0) then
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
            begin i:=e[op(pre[i])].a; flow_now:=back[i]; end;
        end;
    end;
Begin
  readln(n); v:=n*2+2;
  for i:=1 to n do
    begin read(a[i]); inc(sum_a,a[i]); end;
  for i:=1 to n do
    begin read(b[i]); inc(sum_b,b[i]); end;
  if not sum_a=sum_b then
    begin
      writeln('NO');
      halt;
    end;
  build_graph;
  max_flow:=0;
  SAP;
  if sum_a=max_flow then
    begin
      writeln('YES');
      for i:=1 to n do
        begin
          k:=head[i];
          while k>0 do
            begin
              if e[k].a=0 then
                begin k:=e[k].next; break; end;
              ans[i,e[k].a-n]:=e[op(k)].c;
              k:=e[k].next;
            end;
        end;
      for i:=1 to n do
        begin
          for j:=1 to n do write(ans[i,j],' ');
          writeln;
        end;
    end
  else writeln('NO');
End.