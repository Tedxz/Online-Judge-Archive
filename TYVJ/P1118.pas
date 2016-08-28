//TYVJ P1118
Var
  t,a:qword;
  b,i:longint;
Begin
  readln(a,b);
  a:=a mod 1012;
  t:=1;
  for i:=1 to b do
    t:=t*a mod 1012;
  writeln(t mod 1012);
End.
