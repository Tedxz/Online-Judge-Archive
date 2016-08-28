//TYVJ P1099
Var
  a:array[1..20000] of longint;
  n,b,i:longint;
  procedure sort(h,t:longint);
    var i,j,x,c:longint;
    begin
      i:=h; j:=t; x:=a[(h+t)>>1];
      repeat
        while x>a[j] do dec(j);
        while x<a[i] do inc(i);
        if i<=j then
          begin
            c:=a[i]; a[i]:=a[j]; a[j]:=c;
            inc(i); dec(j);
          end;
      until i>j;
      if i<t then sort(i,t);
      if h<j then sort(h,j);
    end;
Begin
  readln(n,b);
  for i:=1 to n do readln(a[i]);
  sort(1,n);
  for i:=1 to n do begin dec(b,a[i]); if b<=0 then break; end;
  writeln(i);
End.

