//TYVJ P1003
Const
  maxM=10000000;
Var
  u,d,f,ans,m,t,i:longint;
  ch:char;
Begin
  ans:=0;
  readln(m,t,u,f,d);
  f:=f<<1; d:=d+u; u:=u+d;
  for i:=1 to t do
    begin
      readln(ch);
      if ch='f' then dec(m,f) else dec(m,d);
      if m>=0 then inc(ans) else break;
    end;
  writeln(ans);
End.