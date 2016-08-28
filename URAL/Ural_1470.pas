Program Ural_1470;
Const
  maxN=130;
  maxR=10000;
Var
  c:array[1..maxN,1..maxN,1..maxN] of longint;
  m,n,x1,x2,y1,y2,z1,z2,i,j,k,x,y,z:longint;
  function lowbit(k:longint):longint;
    begin exit(k and -k); end;
  function sum(x,y,z:integer):longint;
    var s,tx,ty,tz:integer;
    begin
      s:=0;
      tx:=x;
      while tx>0 do
        begin
          ty:=y;
          while ty>0 do
            begin
              tz:=z;
              while tz>0 do
                begin
                  inc(s,c[tx,ty,tz]);
                  dec(tz,lowbit(tz));
                end;
              dec(ty,lowbit(ty));
            end;
          dec(tx,lowbit(tx));
        end;
      exit(s);
    end;
  procedure modify(x,y,z,k:longint);
    var tx,ty,tz:longint;
    begin
      tx:=x;
      while tx<=n do
        begin
          ty:=y;
          while ty<=n do
            begin
              tz:=z;
              while tz<=n do
                begin
                  inc(c[tx,ty,tz],k);
                  inc(tz,lowbit(tz));
                end;
              inc(ty,lowbit(ty));
            end;
          inc(tx,lowbit(tx));
        end;
    end;
Begin
  readln(n); read(m);
  while m<3 do
    begin
      if m=1 then
        begin
          readln(x,y,z,k);
          modify(x+1,y+1,z+1,k);
        end
      else
        begin
          readln(x1,y1,z1,x2,y2,z2); inc(x2); inc(y2); inc(z2);
          k:=sum(x2,y2,z2)-sum(x1,y2,z2)-sum(x2,y1,z2)-sum(x2,y2,z1)
            +sum(x2,y1,z1)+sum(x1,y2,z1)+sum(x1,y1,z2)-sum(x1,y1,z1);
          writeln(k);
        end;
      read(m);
    end;
End.
