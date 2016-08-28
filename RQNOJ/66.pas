Program RQNOJ_66;
Var
  n:int64;
  k:longint;
  s:real;
Begin
  read(k);
  n:=0;
  s:=0;
  while s<=k do
    begin
       inc(n);
       s:=s+1/n;
    end;
  writeln(n);
End.