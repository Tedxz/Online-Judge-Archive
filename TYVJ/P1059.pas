//TYVJ P1059
Var
  l,s,t,m,k,i,j,tem:longint;
  f:array[-100..10000] of longint;
  a,d:array[1..100] of longint;
  function min(a,b:longint):longint;
    begin
     if a<b then exit(a) else exit(b);
    end;
  procedure sort(h,t:longint);
    var i,j,x,c:longint;
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
      if h<j then sort(h,j);
      if i<t then sort(i,t);
    end;
Begin
  readln(l);
  readln(s,t,m);
  for i:=1 to m do read(a[i]);
  if s=t then
    begin
      for i:=1 to m do if a[i] mod t=0 then inc(j);
      writeln(j);
      halt;
    end;
  sort(1,m);
  k:=t*(t-1);
  l:=l-a[m];
  if a[1]>k then a[1]:=k;
  for i:=2 to m do d[i]:=min(k,a[i]-a[i-1]);
  for i:=2 to m do
    a[i]:=a[i-1]+d[i];
  for i:=1 to m do inc(f[a[i]]);
  if l>k then l:=k;
  l:=l+a[m];
  for i:=-100 to -1 do f[i]:=200;
  for i:=1 to l+k do
    begin
      tem:=200;
      for j:=s to t do
        if f[i-j]<tem then tem:=f[i-j];
      inc(f[i],tem);
    end;
  writeln(f[l+k]);
End.
