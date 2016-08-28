Program Ural_1319;
Const
  maxN=100;
Var
  a:array[1..maxN,1..maxN] of integer;
  i,j,t,n:longint;
Begin
  readln(n);
  i:=1; j:=n; t:=1;
  repeat
    a[i,j]:=t;
    inc(t);
    i:=i+1; j:=j+1;
    if (i>n) or (j>n) then
      begin
        inc(i);
        while (i>1) and (j>1) do begin dec(i); dec(j); end;
      end;
  until t=n*n+1;
  for i:=1 to n do
    begin
      for j:=1 to n do write(a[i,j],' ');
      writeln;
    end;
End.
