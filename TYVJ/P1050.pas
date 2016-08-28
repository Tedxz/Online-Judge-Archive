//TYVJ P1050
Var
  s,s1,s2:ansistring;
  i,j,k,l1,l2:longint;
  f:array[0..2000,0..2000] of longint;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
Begin
  readln(s);
  k:=pos(' ',s);
  l1:=k-1;
  s1:=copy(s,1,l1);
  i:=length(s);
  l2:=i-k;
  s2:=copy(s,k+1,l2);
  f[0,0]:=0; f[0,1]:=0; f[1,0]:=0;
  for i:=1 to l1 do
    for j:=1 to l2 do
      if s1[i]=s2[j] then f[i,j]:=f[i-1,j-1]+1
        else
          f[i,j]:=max(f[i-1,j],f[i,j-1]);
  writeln(f[l1,l2]);
End.
