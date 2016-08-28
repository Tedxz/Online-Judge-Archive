Program Ural_1025;
Const
  maxN=1100;
Var
  a:array[1..maxN] of longint;
  ans,i,j,n:longint;
  procedure sort(h,t:longint);
    var i,j,x,c:longint;
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
  ans:=0;
  for i:=1 to n do
    read(a[i]);
  sort(1,n);
  for i:=1 to n>>1+1 do inc(ans,a[i]>>1+1);
  writeln(ans);
End.
