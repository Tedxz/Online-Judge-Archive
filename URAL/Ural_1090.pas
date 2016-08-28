Program Ural_1090;
Const
  maxN=10000;
  maxk=20;
Var
  x,ans,maxt,i,j,k,n,tem:longint;
  c:array[1..maxN] of longint;
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
      while pos<=n do
        begin
          inc(c[pos]);
          inc(pos,lowbit(pos));
        end;
    end;
Begin
  readln(n,k);
  maxt:=0;
  for j:=1 to k do
    begin
      fillchar(c,sizeof(c),0); tem:=0;
      for i:=1 to n do
        begin
          read(x);
          inc(tem,i-sum(x));
          insert(x);
        end;
      if tem>maxt then begin maxt:=tem; ans:=j; end;
    end;
  writeln(ans);
End.
