Program RQNOJ_13;
Var
  a:array[0..10000] of integer;
  l,m,i,j,k,q:integer;
  ans:integer;
Begin
  readln(l,m);
  for i:=0 to l do a[i]:=1;
  for i:=1 to m do
    begin
      read(k,q);
      for j:=k to q do a[j]:=0;
    end;
  ans:=0;
  for i:=0 to l do ans:=ans+a[i];
  writeln(ans);
End.