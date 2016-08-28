Program Ural_1316;
Const
  maxN=10001000;
Var
  tree:array[1..maxN] of longint;
  prise:extended;
  i,j,k:longint;
  ch,r:char;
  ans:int64;
  function min(a,b:longint):longint;
    begin if a<b then exit(a) else exit(b); end;
  function lowbit(k:longint):longint;
    begin exit(k and -k); end;
  function query(pos:longint):longint;
    var tem:longint;
    begin
      tem:=0;
      repeat
        inc(tem,tree[pos]);
        dec(pos,lowbit(pos));
      until pos=0;
      exit(tem);
    end;
  procedure modify(pos,key:longint);
    begin
      repeat
        inc(tree[pos],key);
        inc(pos,lowbit(pos));
      until pos>maxN;
    end;
  procedure bid;
    begin
      readln(prise);
      modify(maxN-round(prise*100+0.2),1);
    end;
  procedure del;
    begin
      readln(prise);
      modify(maxN-round(prise*100+0.2),-1);
    end;
  procedure sale;
    begin
      readln(prise,k);
      inc(ans,min(k,query(maxN-round(prise*100+0.2))));
    end;
Begin
  repeat
    read(ch);
    for i:=1 to 3 do read(r);
    case ch of
      'Q':break;
      'B':bid;
      'S':sale;
      'D':del;
    end;
  until ch='Q';
  writeln(ans/100:0:2);
End.
