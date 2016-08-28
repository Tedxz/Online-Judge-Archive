//TYVJ P1213
Const
  maxN=2000;
Var
  a:array[1..maxN,boolean] of longint;
  n,ans,i,j,k:longint;
  f:array[1..maxN] of longint;
  procedure swap(var a,b:longint);
    var t:longint;
    begin
      t:=a; a:=b; b:=t;
    end;
  procedure sort(h,t:longint);
    var i,j,c,x:longint;
    begin
      i:=h; j:=t; x:=a[(h+t)>>1,true];
      repeat
        while x<a[j,true] do dec(j);
        while x>a[i,true] do inc(i);
        if i<=j then
          begin
            swap(a[i,true],a[j,true]);
            swap(a[i,false],a[j,false]);
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j);
      if i<t then sort(i,t);
    end;
Begin
  readln(n);
  for i:=1 to n do
    begin
      readln(a[i,true],a[i,false]);
      if a[i,true]>a[i,false] then swap(a[i,true],a[i,false]);
    end;
  sort(1,n);
  f[1]:=1;
  for i:=1 to n do
    begin
      f[i]:=1;
      k:=i-1; while (k>0) and (a[k,true]=a[i,true]) do dec(k);
      if k=0 then continue;
      for j:=k downto 1 do
        begin
          if j<f[i] then break;
          if (a[i,false]>a[j,false]) and (f[j]>=f[i]) then
            f[i]:=f[j]+1;
        end;
      if ans<f[i] then ans:=f[i];
    end;
  writeln(ans);
End.
