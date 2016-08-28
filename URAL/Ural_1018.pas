Program Ural_1018;
Const
  maxN=110;
Type
  edge=record
    a,w,next:longint;
  end;
  point=record
    val,lc,rc,ch:longint;
  end;
Var
  e:array[0..maxN*2] of edge;
  p:array[0..maxN] of point;
  head:array[0..maxN] of longint;
  f:array[0..maxN,0..maxN] of longint;
  v:array[0..maxN] of boolean;
  i,j,k,n,q,x,y,z:longint;
  function build(k,value:longint):longint;
    var po,tem:longint;
    begin
      v[k]:=true;
      p[k].val:=value;
      tem:=0;
      po:=head[k];
      while po>0 do
        begin
          if not v[e[po].a] then
            begin
              tem:=tem+build(e[po].a,e[po].w);
              if p[k].lc=0 then p[k].lc:=e[po].a
              else p[k].rc:=e[po].a;
            end;
            po:=e[po].next;
        end;
      p[k].ch:=tem;
    end;
  function dfs(k,r:longint):longint;
    var i,tem:longint;
    begin
      if f[k,r]>0 then exit(f[k,r]);
      if r=0 then exit(0);
      if (p[k].lc=0) or (r=1) then exit(p[k].val);
      for i:=0 to r-1 do
        begin
          tem:=dfs(p[k].lc,i)+dfs(p[k].rc,r-i-1);
          if f[k,r]<tem then f[k,r]:=tem;
        end;
      inc(f[k,r],p[k].val);
      exit(f[k,r]);
    end;
Begin
  readln(n,q);
  fillchar(f,sizeof(f),0);
  for i:=1 to n-1 do
    begin
      readln(x,y,z);
      e[i].a:=y; e[i].w:=z; e[i].next:=head[x]; head[x]:=i;
      e[i+n-1].a:=x; e[i+n-1].w:=z; e[i+n-1].next:=head[y]; head[y]:=i+n-1;
    end;
  build(1,0);
  writeln(dfs(1,1+q));
End.
