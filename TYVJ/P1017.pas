//TYVJ P1017
Const
  maxM=1000;
Var
  f:array[1..maxM] of integer;
  i,j,k,n,m,ans,x,y:integer;
  function find(k:integer):integer;
    begin
      if k<>f[k] then begin find:=find(f[k]); f[k]:=find; end
        else exit(k);
    end;
  procedure union(x,y:integer);
    begin
      f[find(x)]:=find(y);
    end;
Begin
  readln(n,m);
  ans:=0;
  for i:=1 to m do f[i]:=i;
  for i:=1 to n do
    begin
      readln(x,y);
      j:=find(x);
      k:=find(y);
      if j=k then inc(ans) else union(j,k);
    end;
  writeln(ans);
End.
