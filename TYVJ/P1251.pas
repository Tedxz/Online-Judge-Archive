//TYVJ P1251
Const
  maxN=5000;
Var
  fa:array[1..maxN] of integer;
  i,n,m,p,x,y:integer;
  function find(k:integer):integer;
    begin
      if fa[fa[k]]=fa[k] then exit(fa[k])
      else begin find:=find(fa[k]); fa[k]:=find; end;
    end;
  procedure union(x,y:integer);
    begin
      fa[find(x)]:=find(y);
    end;
Begin
  readln(n,m,p);
  for i:=1 to n do fa[i]:=i;
  for i:=1 to m do
    begin
      readln(x,y);
      union(x,y);
    end;
  for i:=1 to p do
    begin
      readln(x,y);
      if find(x)=find(y) then writeln('Yes') else writeln('No');
    end;
End.

