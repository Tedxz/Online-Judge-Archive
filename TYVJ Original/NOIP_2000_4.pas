//NOIP 2000 4
Const
  maxN=10;
Var
  f:array[1..maxN*2,1..maxN,1..maxN] of longint;
  a:array[1..maxN,1..maxN] of longint;
  i,j,k,len,x,y,n:integer;
  function max(a,b:longint):longint;
    begin if a>b then exit(a) else exit(b); end;
  function min(a,b:longint):longint;
    begin if a<b then exit(a) else exit(b); end;
Begin
  readln(n);
  readln(i,j,k);
  repeat
    a[i,j]:=k;
    readln(i,j,k);
  until j=0;
  f[3,1,2]:=a[1,2]+a[2,1];
  for len:=4 to n*2-1 do
    for i:=1 to min(n,len)-1 do
      for j:=i+1 to min(len,n) do
        for x:=-1 to 0 do
          for y:=-1 to 0 do
              if (i+x>=1) and (j+y>=1) and (i+x<>j+y)then
              f[len,i,j]:=max(f[len,i,j],f[len-1,i+x,j+y]+a[i,len-i]+a[j,len-j]);
  writeln(f[n<<1-1,n-1,n]+a[1,1]+a[n,n]);
End.
