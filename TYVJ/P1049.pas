//TYVJ P1049
Var
  f:array[1..5000] of integer;
  i,n,ans,j,x:integer;
Begin
  readln(n);
  fillword(f,sizeof(f)>>1,$7FFF);
  ans:=0;
  for i:=1 to n do
    begin
      read(x);
      for j:=1 to ans+1 do
        if f[j]>x then begin f[j]:=x; break; end;
      if j>ans then ans:=j;
    end;
  writeln(ans);
End.

