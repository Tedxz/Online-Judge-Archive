Program Ural_1654;
Var
  s:ansistring;
  i,j:longint;
Begin
  i:=0;
  setlength(s,210000);
  repeat
    inc(i);
    read(s[i]);
    if s[i]=s[i-1] then dec(i,2);
  until eoln;
  for j:=1 to i do write(s[j]);
  writeln;
End.
