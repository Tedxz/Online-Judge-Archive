{
USER: Xie Zheng
TASK: stall4
LANG: PASCAL
}
Program stall4; //USACO 4.2.2
Const
  maxN=200;
  maxP=402;
Type
  edge=record
    a,c,next:longint;
  end;
Var
  head:array[0..maxP] of longint;
  e:array[0..2*(maxN*maxN+maxN*2)] of edge;
  max_flow,n,m,i,j,s,t,num,x,ans,k:longint;
  function op(k:longint):longint; //opposite edge
    begin if k and 1=1 then exit(k+1) else exit(k-1); end;
  procedure add_edge(x,y,c1,c2:longint);
    begin
      //writeln('                     ',x,' ',y);
      inc(num);
      e[num].a:=y; e[num].c:=c1;
      e[num].next:=head[x]; head[x]:=num;
      inc(num);
      e[num].a:=x; e[num].c:=c2;
      e[num].next:=head[y]; head[y]:=num;
    end;
  procedure SAP;
    var dis,back,gap,cur,pre:array[0..maxP] of longint;
        flow_now,i,k,min:longint;
        flag:boolean;
    begin
      n:=n+m+2;
      gap[0]:=n;
      cur:=head;
      max_flow:=0; flow_now:=$10000000;
      fillchar(dis,sizeof(dis),0);
      i:=s;
      while dis[s]<n do
        begin
          flag:=false;
          back[i]:=flow_now;
          k:=cur[i];
          while k>0 do
            begin
              if (dis[e[k].a]+1=dis[i]) and (e[k].c>0) then
                begin
                  flag:=true;
                  cur[i]:=k;
                  i:=e[k].a;
                  pre[i]:=k;
                  if flow_now>e[k].c then flow_now:=e[k].c;
                  if i=t then
                    begin
                      //writeln(flow_now,'!!!!!!!!!!');
                      inc(max_flow,flow_now);
                      while i<>s do
                        begin
                          //write(i,' ');
                          dec(e[pre[i]].c,flow_now); inc(e[op(pre[i])].c,flow_now);
                          i:=e[op(pre[i])].a;
                        end;
                        //writeln;
                      flow_now:=$10000000;
                    end;
                  break;
                end;
              k:=e[k].next;
            end;
          if flag then continue;
          min:=n;
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
  assign(input,'stall4.in'); reset(input);
  assign(output,'stall4.out'); rewrite(output);
  readln(n,m);
  s:=402; t:=401;
  for i:=1 to n do
    begin
      read(k);
      for j:=1 to k do
        begin
          read(x);
          add_edge(i,maxN+x,$10000000,0);
        end;
    end;
  for i:=1 to n do
    add_edge(s,i,1,0);
  for i:=maxN+1 to maxN+m do
    add_edge(i,t,1,0);
  SAP;
  writeln(max_flow);
  close(input);
  close(output);
End.

