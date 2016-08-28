//TYVJ P1249
Const
  maxN=1000;
  maxM=10000;
Var
  deg:array[1..maxN] of integer;
  head:array[1..maxN] of integer;
  e:array[1..maxM,1..2] of integer;
  fa,f:array[1..maxN] of integer;
  q:array[1..maxN] of integer;
  num,r,tem,x,y,z,m,n,i,j,k,h,t:longint;
  procedure swap(var a,b:longint);
    var s:longint;
    begin
      s:=a; a:=b; b:=s;
    end;
  procedure error;
    begin
      writeln('NO');
      halt;
    end;
  function find(k:integer):integer;
    begin
      if fa[fa[k]]=fa[k] then exit(fa[k])
        else begin find:=find(fa[k]); fa[k]:=find; end;
    end;
  procedure Topo;
    begin
      while h<t do
        begin
          inc(h);
          k:=head[q[h]];
          while k<>0 do
            begin
              dec(deg[e[k,1]]);
              if deg[e[k,1]]=0 then begin inc(t); q[t]:=e[k,1]; end;
              if f[e[k,1]]<f[q[h]]+1 then f[e[k,1]]:=f[q[h]]+1;
              k:=e[k,2];
            end;
        end;
      if t<r then error else writeln(f[q[t]]);
    end;
Begin
  assign(input,'a.in'); reset(input);
  readln(n,m);
  for i:=1 to maxN do fa[i]:=i;
  for i:=1 to m do                       //并查集缩点
    begin
      read(x,y,z);
      if z=0 then
        begin if find(x)<>find(y) then fa[find(y)]:=find(x); continue; end
      else
        if z=-1 then swap(x,y);
      inc(num);
      e[num,1]:=y; e[num,2]:=x;
    end;
for i:=1 to num do                     //处理不等关系
    begin
      e[i,1]:=find(e[i,1]); e[i,2]:=find(e[i,2]);
      tem:=e[i,2];
      e[i,2]:=head[tem];
      head[tem]:=i;
      inc(deg[e[i,1]]);
    end;
  r:=0;
  for i:=1 to n do if fa[i]=i then inc(r);
  h:=0; t:=0;
  for i:=1 to n do                       //入度为0的点入队列
    if (fa[i]=i) and (deg[i]=0) then
      begin
        inc(t);
        q[t]:=i;
        f[i]:=0;
      end;
  Topo;
End.
