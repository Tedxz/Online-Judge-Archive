//TYVJ P1101
Var
  a:array[1..10000] of ansistring;
  n,i:longint;
  procedure sort(h,t:longint);
    var i,j:longint;
        x,c:ansistring;
    begin
      i:=h; j:=t; x:=a[(h+t)>>1];
      while i<=j do
        begin
          while a[j]>x do dec(j);
          while a[i]<x do inc(i);
          if i<=j then
            begin
              c:=a[i]; a[i]:=a[j]; a[j]:=c;
              inc(i); dec(j);
            end;
        end;
      if i<t then sort(i,t);
      if h<j then sort(h,j);
    end;
Begin
  readln(n);
  for i:=1 to n do readln(a[i]);
  sort(1,n);
  for i:=1 to n do writeln(a[i]);
End.
