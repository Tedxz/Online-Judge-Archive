//TYVJ P1018
Var
  s:int64;
  n,i,k:integer;
  st:string;
Begin
  readln(n,k);
  s:=1;
  for i:=2 to n do s:=s*i;
  while s mod 10=0 do s:=s div 10;
  str(s,st);
  if length(st)<k then k:=length(st);
  writeln(copy(st,length(st)-k+1,k));
End.
