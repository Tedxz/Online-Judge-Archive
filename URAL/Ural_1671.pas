Program Ural_1671;
Const
  maxN=100000;
Var
  anc:array[1..maxN] of longint;
  num,i,j,k,n,m,q:longint;
  e:array[1..maxN,1..2] of longint;
  f:array[1..maxN] of boolean;
  des:array[1..maxN] of longint;
  ans:array[1..maxN] of longint;
  function find(x:longint):longint;
    var tem:longint;
    begin
      //writeln('find ',x);
      if x=anc[x] then exit(x)
      else
        begin
          tem:=find(anc[x]);
          anc[x]:=tem;
          exit(tem);
        end;
    end;
  procedure union(x,y:longint);
    begin
      if find(x)<>find(y) then anc[find(x)]:=find(y);
    end;
Begin
  readln(n,m);
  for i:=1 to n do
    anc[i]:=i;
  num:=n;
  for i:=1 to m do
    readln(e[i,1],e[i,2]);
  readln(q);
  for i:=1 to q do
    begin
      read(des[i]);
      f[des[i]]:=true;
    end;
  for i:=1 to m do
    if not f[i] then
      if find(e[i,1])<>find(e[i,2]) then
        begin
          union(e[i,1],e[i,2]);
          dec(num);
        end;
  j:=0;
  for i:=q downto 1 do
    begin
      inc(j); ans[j]:=num;
      if find(e[des[i],1])<>find(e[des[i],2]) then
        begin
          union(e[des[i],1],e[des[i],2]);
          dec(num);
        end;
    end;
  for i:=j downto 1 do write(ans[i],' ');
End.
