Program Ural_1563;
Const
  maxN=1000;
Var
  a:array[1..$100000] of boolean;
  s:array[1..maxN] of string[32];
  n,i,j,ans:longint;
Begin
  readln(n);
  for i:=1 to n do
    begin
      readln(s[i]);
      for j:=1 to i-1 do if s[i]=s[j] then begin inc(ans); break; end;
    end;
  writeln(ans);
End.
