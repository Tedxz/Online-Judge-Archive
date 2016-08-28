Program RQNOJ_20;
Var
  i,j:integer;
  a:array[0..7] of integer;
Begin
  a[0]:=8;
  for i:=1 to 7 do
    begin
      read(a[i],j);
      a[i]:=a[i]+j;
    end;
  j:=0;
  for i:=1 to 7 do
    if a[i]>a[j] then j:=i;
  writeln(j);
End.