//TYVJ P1156
Var
  k,i:integer;
  x,y,tem:qword;
  ans:byte;
Begin
  readln(k,x,y);
  ans:=1;
  for i:=k-1 downto 0 do
    begin
      if i=63 then tem:=trunc(exp(ln(2)*i)-1) else tem:=trunc(exp(ln(2)*i));
      if (x>tem) and (y>tem) then ans:=1 xor ans;
      if x>tem then dec(x,tem);
      if y>tem then dec(y,tem);
    end;
  writeln(ans);
End.
