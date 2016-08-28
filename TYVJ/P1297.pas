//TYVJ P1297
Const
  maxN=50000;
Var
  big,small,a:array[1..maxN] of longint;
  p,n,i,j,tem,x,y:longint;
Begin
  readln(n,p);
  for i:=1 to n do read(a[i]); readln;
  for i:=n-1 downto 1 do
    begin
      big[i]:=i+1; small[i]:=i+1;
      while (big[i]<>0) and (a[big[i]]<=a[i]) do big[i]:=big[big[i]];
      while (small[i]<>0) and (a[small[i]]>=a[i]) do small[i]:=small[small[i]];
    end;
  for i:=1 to p do
    begin
      readln(x,y);
      tem:=x;
      while (big[tem]<=y) and (big[tem]>0) do tem:=big[tem];
      write(a[tem],' ');
      tem:=x;
      while (small[tem]<=y) and (small[tem]>0) do tem:=small[tem];
      writeln(a[tem]);
    end;
End.
