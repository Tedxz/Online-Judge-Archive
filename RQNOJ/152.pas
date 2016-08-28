Program RQNOJ_152;
Var
  a,b:int64;
  i,j:longint;
  c:char;
Begin
  a:=0; b:=0;
  read(c);
  while c<>' ' do
    begin
      a:=a-48+ord(c);
      read(c);
    end;
  while not eoln do
    begin
      read(c);
      b:=b-48+ord(c);
    end;
  writeln(a*b);
End.