Program Ural_1098;
Var
  s,st:ansistring;
  i,n:longint;
Begin
  while not eof do
    begin
      readln(st);
      s:=s+st;
    end;
  for i:=2 to length(s) do
    n:=(n+1999) mod i;
  case s[n+1] of
    '?':writeln('Yes');
    ' ':writeln('No');
    else writeln('No comments');
  end;
End.
