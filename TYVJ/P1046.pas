//TYVJ P1048
Const
  maxN=1000;
  MONEY=200;
Var
  a:array[1..maxN,boolean] of integer;
  f:array[-1..maxN,-1..maxN] of longint;
  ans,i,j,n:longint;
  procedure sort(h,t:integer; b:boolean);
    var i,j,c,x:integer;
    begin
      i:=h; j:=t; x:=a[(h+t)>>1,b];
      repeat
        while x>a[j,b] do dec(j);
        while x<a[i,b] do inc(i);
        if i<=j then
          begin
            c:=a[i,b]; a[i,b]:=a[j,b]; a[j,b]:=c;
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j,b);
      if i<t then sort(i,t,b);
    end;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
  function point(x,y:integer):longint;
    begin
      if a[x,true]=a[y,false] then exit(0);
      if a[x,true]>a[y,false] then exit(MONEY);
      exit(-MONEY);
    end;
Begin
  readln(n);
  for i:=1 to n do read(a[i,true]);
  readln;
  for i:=1 to n do read(a[i,false]);
  sort(1,n,true);
  sort(1,n,false);
  i:=1; j:=1; ans:=0;
  for i:=0 to n do
    for j:=0 to n-i  do
      begin
        if (i=0) and (j=0) then continue;
        if i=0 then begin f[i,j]:=f[i,j-1]+point(n-j+1,j); continue; end;
        if j=0 then begin f[i,j]:=f[i-1,j]+point(i,i); continue; end;
        f[i,j]:=max(f[i-1,j]+point(i,i+j),f[i,j-1]+point(n-j+1,i+j));
      end;
  ans:=-maxlongint;
  for i:=0 to n do if f[i,n-i]>ans then ans:=f[i,n-i];
  writeln(ans);
End.
