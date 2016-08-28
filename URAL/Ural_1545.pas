Program Ural_1545;
Const
  maxN=1100;
Var
  dic:array[1..maxN,1..2] of char;
  n,i,j:longint;
  ch:char;
Begin
  readln(n);
  for i:=1 to n do readln(dic[i,1],dic[i,2]);
  read(ch);
  for i:=1 to n do if dic[i,1]=ch then writeln(dic[i,1],dic[i,2]);
End.
