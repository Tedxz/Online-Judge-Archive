Program Ural_1404;
Var
  s:string[110];
  i,j,k:longint;
Begin
  readln(s);
  for i:=length(s) downto 2 do
    s[i]:=chr((ord(s[i])-ord(s[i-1])+26) mod 26+ord('a'));
  s[1]:=chr((ord(s[1])-5-ord('a')+26) mod 26+ord('a'));
  writeln(s);
End.
