//TYVJ P1083
Const
  maxN=100000;
Var
  edge:array[1..100000,1..2] of longint;
  head:array[1..maxN] of longint;
  i,j,k,n,p,c,x,y:longint;
  m,ans:int64;
  num,h,t:longint;
  v:array[1..maxN] of boolean;
  q:array[1..maxN] of longint;
  dis:array[1..maxN] of int64;
  procedure BFS;
    begin
      h:=0; t:=1; v[c]:=true; q[1]:=c;
      for i:=1 to n do dis[i]:=$100000;
      dis[c]:=0;
      while h<>t do
        begin
          inc(h);
          k:=head[q[h]];
          while k>0 do
            begin
              if not v[edge[k,1]] then
                begin
                  dis[edge[k,1]]:=dis[q[h]]+1;
                  inc(t);
                  q[t]:=edge[k,1];
                  v[q[t]]:=true;
                end;
              k:=edge[k,2];
            end;
        end;
      ans:=0;
      for i:=1 to n do if ans<dis[i] then ans:=dis[i];
    end;
Begin
  read(n,p,c);
  read(m);
  num:=0;
  filldword(head,sizeof(head)>>2,0);
  for i:=1 to p do
    begin
      read(x,y);
      inc(num,2);
      edge[num-1,1]:=y; edge[num-1,2]:=head[x]; head[x]:=num-1;
      edge[num,1]:=x; edge[num,2]:=head[y]; head[y]:=num;
    end;
  BFS;
  writeln(m+ans+1);
End.
