{
USER: Xie Zheng
TASK: agrinet
LANG: PASCAL
}
Program agrinet; //USACO 3.1.1
Const
  maxN=100;
Type
  edge=record
    x,y:longint;
    w:longint;
  end;
Var
  f:array[0..maxN] of integer;
  e:array[1..5000] of edge;
  n,i,j,s,t,l,num:longint;
  ans:longint;
  function find(k:integer):integer;
    begin
      if f[k]=k then exit(k)
        else
          begin
            find:=find(f[k]);
            f[k]:=find;
          end;
    end;
  function union(xt,yt:integer):boolean;
    var x,y:integer;
    begin
      x:=xt; y:=yt;
      x:=find(xt);
      y:=find(yt);
      if (x<>y) and (xt<>x) and (yt<>y) then f[y]:=x;
      exit(x=y);
    end;
  procedure qs(h,t:longint);
    var i,j:longint;
        x:longint;
        c:edge;
    begin
      i:=h; j:=t; x:=e[(h+t)>>1].w;
      while i<=j do
        begin
          while x<e[j].w do dec(j);
          while x>e[i].w do inc(i);
          if i<=j then
            begin
              c:=e[i]; e[i]:=e[j]; e[j]:=c;
              inc(i); dec(j);
            end;
        end;
      if i<t then qs(i,t);
      if h<j then qs(h,j);
    end;
  procedure Kruskal;
    var i:longint;
    begin
      for i:=1 to n do f[i]:=i;
      for i:=1 to num do
        begin
          if not union(e[i].x,e[i].y) then
            begin
              inc(ans,e[i].w);
              f[find(e[i].y)]:=f[e[i].x];
            end;
        end;
    end;
Begin
  assign(input,'agrinet.in'); reset(input);
  assign(output,'agrinet.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      for j:=1 to n do
        begin
          read(e[num+1].w);
          if j>i then
            begin inc(num);
            e[num].x:=i;
            e[num].y:=j; end;
        end;
    end;
  close(input);
  qs(1,num);
  ans:=0;
  Kruskal;
  writeln(ans);
  close(output);
End.
