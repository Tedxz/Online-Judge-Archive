Program Ural_1016;
Const
  maxN=110;
Type
  edge=record
    a,next:integer;
  end;
Var
  mark:array[1..maxN] of byte;
  e:array[1..maxN*maxN] of edge;
  head:array[1..maxN] of integer;
  i,j,n,tot,t1,t2:longint;
  procedure add_edge(i,j:integer);
    begin
      inc(tot);
      e[tot].a:=j; e[tot].next:=head[i]; head[i]:=tot;
    end;
  procedure dfs(k,m:integer);
    var p:integer;
    begin
      if m=1 then inc(t1) else inc(t2);
      mark[k]:=m;
      p:=head[k];
      while p>0 do
        begin
          if mark[e[p].a]=0 then dfs(e[p].a,3-m);
          p:=e[p].next;
        end;
    end;
Begin
  readln(n);
  for i:=1 to n do
    begin
      read(j);
      while j>0 do
        begin
          add_edge(i,j);
          read(j);
        end;
    end;
  for i:=1 to n do if mark[i]=0 then dfs(i,1);
  if t1+t2<n then begin writeln(0); halt; end;
  writeln(t1);
  for i:=1 to n do if mark[i]=1 then write(i,' ');
End.