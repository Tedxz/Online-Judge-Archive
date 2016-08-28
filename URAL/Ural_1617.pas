Program Ural_1617;
Var
  i,j,k,t,n,m:longint;
  a:array [599..701] of longint;
Begin
  readln(n);
  for i:=1 to n do
    begin
      readln(t);
      inc(a[t]);
      if a[t]>=4 then
        begin
          dec(a[t],4);
          inc(m);
        end;
    end;
  writeln(m);
End.
