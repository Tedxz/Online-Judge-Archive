//NOIP 1999 1
Const
  maxN=100;
Var
  a,f,g:array[1..maxN] of longint;
  i,j,k,n,ans1,ans2:longint;
Begin
  while not eoln do
    begin inc(n); read(a[n]); end;
  for i:=1 to n do g[i]:=$10000000;;
  for i:=1 to n do
    begin
      for j:=1 to n do if f[j]<a[i] then begin f[j]:=a[i]; break; end;
      if j>ans1 then ans1:=j;
      for j:=1 to n do if g[j]>=a[i] then begin g[j]:=a[i]; break; end;
      if j>ans2 then ans2:=j;
    end;
  writeln(ans1,' ',ans2);
End.
