//TYVJ P1072
Const
  maxN=1000;
Var
  x,y,z:array[1..maxN] of longint;
  i,j,k,n,ans:longint;
  f:array[1..maxN] of longint;
  procedure sort(h,t:longint);
    var i,j,c,k:longint;
    begin
      i:=h; j:=t; k:=z[(h+t)>>1];
      repeat
        while k<z[j] do dec(j);
        while k>z[i] do inc(i);
        if i<=j then
          begin
            c:=x[i]; x[i]:=x[j]; x[j]:=c;
            c:=y[i]; y[i]:=y[j]; y[j]:=c;
            c:=z[i]; z[i]:=z[j]; z[j]:=c;
            inc(i); dec(j);
          end;
      until i>j;
    if h<j then sort(h,j);
    if i<t then sort(i,t);
  end;
Begin
  readln(n);
  for i:=1 to n do readln(x[i],y[i],z[i]);
  sort(1,n);
  filldword(f,sizeof(f)>>2,1);
  for i:=2 to n do
    for j:=i-1 downto 1 do
      if (f[j]>=f[i]) and (x[j]<x[i]) and (y[j]<y[i]) and (z[j]<z[i]) then f[i]:=f[j]+1;
  ans:=0;
  for i:=n downto 1 do
    if f[i]>ans then ans:=f[i];
  writeln(ans);
  filldword(f,sizeof(f)>>2,1);
  f[1]:=1;
  for i:=2 to n do
    for j:=i-1 downto 1 do
      if (f[j]>=f[i]) and not((x[j]<x[i]) and (y[j]<y[i]) and (z[j]<z[i])) then f[i]:=f[j]+1;
  ans:=0;
  for i:=n downto 1 do
    if f[i]>ans then ans:=f[i];
  writeln(ans);
  //for i:=1 to n do write(f[i],' ');
End.
