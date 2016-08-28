Program Ural_1022;
Const
  maxN=100;
Type
  edge=record
    a,next:integer;
  end;
Var
  e:array[1..maxN*maxN div 2] of edge;
  head:array[1..maxN] of integer;
  dgr:array[1..maxN] of longint;
  q:array[1..maxN] of integer;
  i,j,k,n:integer;
Begin
  readln(n);
  for i:=1 to n do
    begin
      read(j);
      while j>0 do
        begin
          inc(k);
          e[k].a:=j; e[k].next:=head[i]; head[i]:=k;
          inc(dgr[j]);
          read(j);
        end;
    end;
  j:=0;
  for i:=1 to n do
    if dgr[i]=0 then
      begin inc(j); q[j]:=i; end;
  for i:=1 to n-1 do
    begin
      k:=head[q[i]];
      while k>0 do
        begin
          dec(dgr[e[k].a]);
          if dgr[e[k].a]=0 then
            begin inc(j); q[j]:=e[k].a; end;
          k:=e[k].next;
        end;
      write(q[i],' ');
    end;
  writeln(q[n]);
End.
