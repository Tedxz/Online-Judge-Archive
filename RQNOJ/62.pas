Program RQNOJ_62;
Var
  n,i,j:integer;
  l,r,k,s:longint;
  a:array[1..100] of integer;
Begin
  readln(n);
  for i:=1 to n do
    begin
      read(a[i]);
      k:=k+a[i];
    end;
  i:=1; j:=n;
  l:=0; r:=0;
  k:=k div n;
  s:=0;
  while i<j do
    begin
      l:=l+a[i]-k;
      if l<>0 then inc(s);
      inc(i);
      if i=j then break;
      r:=r+a[j]-k;
      if r<>0 then inc(s);
      dec(j);
    end;
  writeln(s);
End.
