Program NOIP_1998_2;
Var
  a:array[1..20] of string[20];
  t:longint;
  i,n:integer;
  procedure sort(h,t:integer);
    var i,j:integer;
        tem,x:string[20];
    begin
      i:=h; j:=t; x:=a[(i+j)>>1];
      while i<=j do
        begin
          while a[j]+x<x+a[j] do dec(j);
          while a[i]+x>x+a[i] do inc(i);
          if i<=j then
            begin
              tem:=a[i]; a[i]:=a[j]; a[j]:=tem;
              inc(i); dec(j);
            end;
        end;
      if i<t then sort(i,t);
      if h<j then sort(h,j);
    end;
Begin
  readln(n);
  for i:=1 to n do
    begin
      read(t);
      str(t,a[i]);
    end;
  sort(1,n);
  for i:=1 to n do write(a[i]);
  writeln;
End.
