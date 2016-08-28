Program Ural_1026;
Const
  maxN=100000;
Var
  a:array[1..maxN] of integer;
  n,i,x:longint;
  procedure sort(h,t:integer);
    var i,j,x,c:integer;
    begin
      i:=h; j:=t; x:=a[(h+t)>>1];
      repeat
        while a[i]<x do inc(i);
        while a[j]>x do dec(j);
        if i<=j then
          begin
            c:=a[i]; a[i]:=a[j]; a[j]:=c;
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j);
      if i<t then sort(i,t);
    end;
Begin
  readln(n);
  for i:=1 to n do readln(a[i]);
  sort(1,n);
  readln; readln(n);
  for i:=1 to n do
    begin
      readln(x);
      writeln(a[x]);
    end;
End.
