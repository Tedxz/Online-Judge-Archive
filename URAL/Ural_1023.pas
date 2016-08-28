Program Ural_1023;
Var
  i,n:longint;
Begin
  readln(n);
  for i:=3 to trunc(sqrt(n))+2 do
    if n mod i=0 then 
      begin writeln(i-1); halt; end;
  if n and 1=0 then writeln(n>>1-1)
  else writeln(n-1);
End.
