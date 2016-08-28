Program RQNOJ_96;
Var
  a,b:array[1..2000] of integer;
  n,m,j,k,i:integer;
  s:integer;
  h1,h2:integer;
  procedure qs(h,t:integer);
    var i,j,x,c:integer;
    begin
      i:=h; j:=t; x:=a[(h+t) shr 1];
      while i<=j do
        begin
          while x<a[j] do dec(j);
          while x>a[i] do inc(i);
          if i<=j then
            begin
              c:=a[i]; a[i]:=a[j]; a[j]:=c;
              inc(i); dec(j);
            end;
        end;
      if i<t then qs(i,t);
      if h<j then qs(h,j);
    end;
Begin
  readln(n,m);
  for i:=1 to n do readln(a[i]);
  qs(1,n);
  b:=a;
  for i:=1 to m do readln(a[i]);
  qs(1,m);
  h1:=1; h2:=1; k:=1;
  while (h1<=m) and (h2<=n) do
    begin
      if a[h1]=0 then begin inc(k); inc(h1); continue; end; //height>0
      if a[h1]<b[h2] then inc(h1);
      inc(h2);
    end;
  writeln(m-h1+k);
End.