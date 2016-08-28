//TYVJ P1088
Const
  maxN=2000;
Var
  a:array[0..maxN] of longint;
  f:array[1..maxN,1..maxN] of int64;
  n,i,j,k,len:longint;
  function max(a,b:int64):int64;
    begin
      if a>b then exit(a) else exit(b);
    end;
Begin
  readln(n);
  for i:=1 to n do readln(a[i]);
  for i:=1 to n do f[i,i]:=a[i];
  for i:=2 to n do inc(a[i],a[i-1]);
  for len:=2 to n do
    for i:=1 to n-len+1 do
      begin
        j:=i+len-1;
        f[i,j]:=max(f[i+1,j],f[i,j-1])-a[i-1]+a[j];
    end;
  writeln(f[1,n]);
End.
