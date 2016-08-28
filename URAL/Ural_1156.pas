Program Ural_1156;
Const
  maxN=100;
  maxM=200;
Type
  edge=record
    a,next:longint;
  end;
Var
  e:array[1..maxM] of edge;
  head:array[1..maxN] of longint;
  col:array[1..maxN] of longint;
  brk:array[1..maxN] of longint;
  num:array[1..maxN,1..2] of longint;
  exc:array[1..maxN] of boolean;
  f:array[1..maxN,1..maxN] of boolean;
  i,j,k,n,m,mark,x,y:longint;
  procedure fail;
    begin
      writeln('IMPOSSIBLE');
      halt;
    end;
  procedure color(k,c:longint);
    var p:longint;
    begin
      if col[k]=c then exit;
      if col[k]>0 then fail;
      col[k]:=c;
      inc(num[mark,c]);
      brk[k]:=mark;
      p:=head[k];
      while p>0 do
        begin
          color(e[p].a,3-c);
          p:=e[p].next;
        end;
    end;
  function dfs(k,sum:longint):boolean;
    begin
      if k=mark+1 then
        if sum=n then exit(true)
        else exit(false);
      if sum>n then exit(false);
      if f[k,sum] then exit;
      f[k,sum]:=true;
      if dfs(k+1,sum+num[k,1]) then
        begin
          exc[k]:=false;
          exit(true);
        end
      else
        if dfs(k+1,sum+num[k,2]) then
          begin
            exc[k]:=true;
            exit(true);
          end;
      exit(false);
    end;
Begin
  readln(n,m);
  for i:=1 to m do
    begin
      readln(x,y);
      inc(j);
      e[j].a:=y; e[j].next:=head[x]; head[x]:=j;
      inc(j);
      e[j].a:=x; e[j].next:=head[y]; head[y]:=j;
    end;
  for i:=1 to n<<1 do
    if col[i]=0 then
      begin
        inc(mark);
        color(i,1);
      end;
  if not dfs(1,0) then fail;
  for i:=1 to n<<1 do
    if (exc[brk[i]] and (col[i]=1)) or (not exc[brk[i]] and (col[i]=2)) then
      write(i,' ');
  writeln;
  for i:=1 to n<<1 do
    if (not exc[brk[i]] and (col[i]=1)) or (exc[brk[i]] and (col[i]=2)) then
      write(i,' ');
  writeln;
End.
