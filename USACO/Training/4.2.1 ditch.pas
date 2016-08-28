{
USER: Xie Zheng
TASK: ditch
LANG: PASCAL
}
Program ditch; //USACO 4.2.1
Const
  maxV=200;
  maxE=200;
Type
  edge=record
    a,next,c,op{反向边}:longint;
  end;
Var
  AM:array[1..maxV,1..maxV] of longint;      //邻接矩阵
  head:array[1..maxV] of longint;
  e:array[1..maxE*2] of edge;
  i,j,k,m{V},n{E},max_flow,x,y,z:longint;
  now_E:array[1..maxE] of longint;   //当前弧优化
  GAP:array[0..maxV+1] of longint;   //间隙优化
  back:array[1..maxV] of longint;    //到达某节点的流量
  dis:array[1..maxV] of longint;     //当前节点到汇点最短增广路的长度
  pre:array[1..maxV] of longint;     //到达当前节点的弧的编号
  procedure SAP;
    var flow_now,i,min,S,T:longint;
        flag:boolean;               //当前节点有无可行弧
    begin
      S:=1; T:=m;
      max_flow:=0;
      now_E:=head;
      flow_now:=$70000000;
      i:=S;
      GAP[0]:=m;
      while dis[S]<m do
        begin
          back[i]:=flow_now;  flag:=false;
          k:=now_E[i];
          while k>0 do
            begin
              if (e[k].c>0) and (dis[e[k].a]+1=dis[i]) then
                begin
                  flag:=true;
                  now_E[i]:=k;
                  pre[e[k].a]:=k;
                  if e[k].c<flow_now then flow_now:=e[k].c;
                  i:=e[k].a;
                  if i=T then
                    begin
                      inc(max_flow,flow_now);
                      while i<>S do
                        begin
                          dec(e[pre[i]].c,flow_now); inc(e[e[pre[i]].op].c,flow_now);
                          i:=e[e[pre[i]].op].a;
                        end;
                      flow_now:=$70000000;
                    end;
                  break;
                end;
              k:=e[k].next;
            end;
          if flag then continue;     //以下处理无可行弧
          min:=m;
          k:=head[i];
          while k>0 do
            begin
              if (e[k].c>0) and (dis[e[k].a]<min) then
                begin min:=dis[e[k].a]; now_E[i]:=k; end;   ///???????
              k:=e[k].next;
            end;
          dec(GAP[dis[i]]);
          if GAP[dis[i]]=0 then exit;
          dis[i]:=min+1;
          inc(GAP[dis[i]]);
          if i<>S then
            begin i:=e[e[pre[i]].op].a; flow_now:=back[i]; end;
        end;
    end;
Begin
  assign(input,'ditch.in'); reset(input);
  assign(output,'ditch.out'); rewrite(output);
  fillchar(AM,sizeof(AM),0);
  readln(n,m);
  for i:=1 to n do
    begin
      readln(x,y,z);
      inc(AM[x,y],z);
    end;
  k:=0;
  for i:=1 to m do
    for j:=1 to m do
      if AM[i,j]>0 then
        begin
          inc(k);
          e[k].a:=j; e[k].c:=AM[i,j]; e[k].next:=head[i]; head[i]:=k; e[k].op:=k+1;
          inc(k);
          e[k].a:=i; e[k].c:=0; e[k].next:=head[j]; head[j]:=k; e[k].op:=k-1;
        end;

  SAP;
  writeln(max_flow);
  close(input);
  close(output);
End.
