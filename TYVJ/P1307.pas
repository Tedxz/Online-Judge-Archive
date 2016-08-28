//TYVJ P1037
Const
  maxN=2000;
  maxM=10000;
Type
  edge=record
    x,y:integer;
    cost:longint;
  end;
Var
  fa:array[1..maxN] of integer;
  e:array[1..maxM] of edge;
  i,j,k,n,m,ans,num,p,u,v,w,sets:longint;
  procedure sort(h,t:longint);
    var i,j,x:longint;
        tem:edge;
    begin
      i:=h; j:=t; x:=e[(h+t)>>1].cost;
      repeat
        while x<e[j].cost do dec(j);
        while x>e[i].cost do inc(i);
        if i<=j then
          begin
            tem:=e[i]; e[i]:=e[j]; e[j]:=tem;
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j);
      if i<t then sort(i,t);
    end;
  function find(k:integer):integer;
    begin
      if fa[k]=k then exit(k)
        else
          begin find:=find(fa[k]); fa[k]:=find; end;
    end;
  procedure union(x,y:integer);
    var fx,fy:integer;
    begin
      fx:=find(x); fy:=find(y);
      if fx<>fy then
        begin
          fa[fx]:=fy;
          dec(sets);
        end;
    end;
Begin
  readln(n,m);
  ans:=0;
  num:=0;
  sets:=n;
  for i:=1 to n do
    fa[i]:=i;
  for i:=1 to m do
    begin
      readln(p,u,v,w);
      if p=1 then begin inc(ans,w); union(u,v); end
        else
          begin
            inc(num);
            with e[num] do
              begin x:=u; y:=v; cost:=w; end;
          end;
    end;
  sort(1,num);
  i:=1;
  while sets>1 do
    begin
      if find(e[i].x)<>find(e[i].y) then
        begin inc(ans,e[i].cost); union(e[i].x,e[i].y); end;
      inc(i);
    end;
  writeln(ans);
End.

