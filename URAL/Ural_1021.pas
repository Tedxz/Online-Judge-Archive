Program Ural_1021;
Var
  a:array[-100000..100000] of boolean;
  i,j,n:longint;
Begin
  readln(n);
  for i:=1 to n do
    begin readln(j); a[j]:=true; end;
  readln(n);
  for i:=1 to n do
    begin
      readln(j);
      if a[10000-j] then
        begin writeln('Yes'); halt; end;
    end;
  writeln('No');
End.
