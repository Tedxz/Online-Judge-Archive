//TYVJ P1012
Const
  tab:array[0..9] of integer=(6,2,5,5,4,5,6,3,7,6);
Var
  i,j,k,n,ans,s,t:integer;
Begin
  readln(n);
  n:=n-4;
  ans:=0;
  for i:=0 to 999 do
    for j:=0 to 999-i do
      begin
        t:=tab[i mod 10]+tab[(i div 10) mod 10]+tab[i div 100]+tab[j mod 10]+tab[(j div 10) mod 10]+tab[j div 100];
        if i<100 then dec(t,6); if j<100 then dec(t,6);
        if i<10 then dec(t,6); if j<10 then dec(t,6);
        s:=tab[(i+j) mod 10]+tab[((i+j) div 10) mod 10]+tab[(i+j) div 100];
        if i+j<100 then dec(s,6);
        if i+j<10 then dec(s,6);
        if s+t=n then inc(ans);
      end;
  writeln(ans);
End.
