Program Ural_1028;
Const
  maxN=15000;
  maxX=32010;
Type
  star=record
    x,y:longint;
  end;
Var
  s:array[1..maxN] of star;
  c:array[1..maxX] of longint;
  level:array[0..maxN] of longint;
  i,j,n:longint;
  function lowbit(k:longint):longint;
    begin exit(k and -k); end;
  function sum(pos:longint):longint;
    var s:longint;
    begin
      s:=0;
      while pos>0 do
        begin
          inc(s,c[pos]);
          dec(pos,lowbit(pos));
        end;
      exit(s);
    end;
  procedure insert(pos:longint);
    begin
      while pos<=maxX do
        begin
          inc(c[pos]);
          inc(pos,lowbit(pos));
        end;
    end;
Begin
  readln(n);
  for i:=1 to n do
    begin
      readln(s[i].x,s[i].y);
      inc(s[i].x); inc(s[i].y);
    end;
  for i:=1 to n do
    begin
      inc(level[sum(s[i].x)]);
      insert(s[i].x);
    end;
  for i:=0 to n-1 do writeln(level[i]);
End.
