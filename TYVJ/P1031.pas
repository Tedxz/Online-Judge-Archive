//TYVJ P1031
Const
  maxN=2500;
  maxM=6200;
Type
  edge=record
    w,a,next:longint;
  end;
Var
  head:array[1..maxN] of longint;
  e:array[1..maxM*2] of edge;
  q:array[0..4096] of longint;
  v:array[1..maxN] of boolean;
  dis:array[1..maxN] of longint;
  i,j,k,n,m,x,y,start,target,z:longint;
  procedure SPFA;
    var h,t:longint;
    begin
      h:=0; t:=1; q[t]:=start;
      filldword(dis,sizeof(dis)>>2,$20000000);
      dis[start]:=0;
      while h<>t do
        begin
          h:=h and 4095 +1;
          v[q[h]]:=false;
          k:=head[q[h]];
          while k>0 do
            begin
              if dis[q[h]]+e[k].w<dis[e[k].a] then
                begin
                  dis[e[k].a]:=dis[q[h]]+e[k].w;
                  if not v[e[k].a] then
                    begin t:=t and 4095 +1; q[t]:=e[k].a; v[q[t]]:=true; end;
                end;
              k:=e[k].next;
            end;
        end;
    end;
Begin
  readln(n,m,start,target);
  for i:=1 to m do
    begin
      readln(x,y,z);
      with e[i<<1-1] do
        begin a:=y; w:=z; next:=head[x]; head[x]:=i<<1-1; end;
      with e[i<<1] do
        begin a:=x; w:=z; next:=head[y]; head[y]:=i<<1; end;
    end;
  SPFA;
  writeln(dis[target]);
End.

