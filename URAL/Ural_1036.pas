Program Ural_1306;
Const
  maxN=250000;
Var
  a:array[1..maxN] of dword;
  i,n:longint;
  procedure msort(h,t:longint);
    var i,j:longint;
        x,c:dword
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
      if (h<j) and (j>(n>>1-2)) then msort(h,j);
      if (i<t) and (i<(n>>1+2)) then msort(i,t);
    end;
Begin
  readln(n);
  for i:=1 to n do readln(a[i]);
  msort(1,n);
  if n and 1=1 then writeln(a[(n+1)>>1],'.0')
  else writeln(((a[n>>1]+a[n>>1+1])/2):0:1);
End.
