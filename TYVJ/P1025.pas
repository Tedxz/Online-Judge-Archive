//TYVJ P1025
Var
  s:string;
  i,n:integer;
Begin
  readln(n);
  for i:=1 to n do
    begin
      readln(s);
      if ord(s[length(s)]) and 1=1 then writeln('odd') else writeln('even');
    end;
End.
