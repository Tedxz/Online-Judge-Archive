//TYVJ P1310
Const
  maxN=1500;
  maxM=300000;
Var
  head:array[1..maxN] of longint;
  ram:array[1..maxM*2,1..3] of longint;
  f:array[1..maxM] of boolean;
  h,t,i,j,k,n,m,x1,y1,x2,y2,num,ans,x,y,d:longint;
  q,fa,way:array[1..maxN] of longint;
  v:array[1..maxN] of boolean;
  procedure check1;
    var k:longint;
    begin
      k:=t;
      while fa[k]<>0 do
        begin
          f[way[k]]:=true;
          k:=fa[k];
        end;
    end;
  procedure check2;
    var k:longint;
    begin
      k:=t;
      ans:=0;
      while fa[k]<>0 do
        begin
          if f[way[k]] then inc(ans,ram[way[k],2]);
          k:=fa[k];
        end;
    end;

  procedure BFS(b:integer);
    var start,goal:longint;
    begin
      h:=0; t:=1;
      if b=1 then begin start:=x1; goal:=y1 end
        else begin start:=x2; goal:=y2; end;
      q[1]:=start; fa[1]:=0;
      fillchar(v,sizeof(v),false); v[start]:=true;
      while h<t do
        begin
          inc(h);
          k:=head[q[h]];
          while k<>0 do
            begin
              if not v[ram[k,1]] then
                begin
                  inc(t);
                  q[t]:=ram[k,1];
                  fa[t]:=h;
                  v[t]:=true;
                  way[t]:=k;
                  if q[t]=goal then
                    begin
                      if b=1 then check1 else check2;
                      exit;
                    end;
                end;
              k:=ram[k,3];
            end;
        end;
    end;
Begin
  readln(n,m,x1,y1,x2,y2);
  num:=0;
  for i:=1 to m do
    begin
      readln(x,y,d);
      inc(num);
      ram[num,3]:=head[x]; head[x]:=num; ram[num,1]:=y; ram[num,2]:=d;
      inc(num);
      ram[num,3]:=head[y]; head[y]:=num; ram[num,1]:=x; ram[num,2]:=d;
    end;
  BFS(1);
  BFS(2);
  writeln(ans);
  for i:=1 to m*2 do writeln(f[i]);
End.
