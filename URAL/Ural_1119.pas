Program Ural_1119;
Const
  maxK=110;
Var
  x,y,f:array[0..maxK] of integer;
  i,j,n,a,b:integer;
  procedure sort(h,t:integer);
    var i,j,tem,c:integer;
    begin
      i:=h; j:=t; tem:=x[(h+t)>>1];
      repeat
        while x[i]<tem do inc(i);
        while x[j]>tem do dec(j);
        if i<=j then
          begin
            c:=x[i]; x[i]:=x[j]; x[j]:=c;
            c:=y[i]; y[i]:=y[j]; y[j]:=c;
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j);
      if i<t then sort(i,t);
    end;
Begin
  readln(a,b);
  readln(n);
  for i:=1 to n do readln(x[i],y[i]);
  sort(1,n);
  inc(n);
  y[0]:=0; y[n]:=maxint;
  for i:=0 to n do
    for j:=i-1 downto 0 do
      if (f[i]<f[j]+1) and (y[i]>y[j]) then f[i]:=f[j]+1;
  writeln(round(((f[n]-1)*sqrt(2)+a+b-2*(f[n]-1))*100));
End.
