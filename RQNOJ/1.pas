Program RQNOJ_1;
Var
  a:array[1..1000] of boolean;
  i,n,x,m:integer;
Begin
  readln(n);
  fillchar(a,sizeof(a),false);
  m:=0;
  for i:=1 to n do begin read(x); if not a[x] then inc(m); a[x]:=true; end;
  writeln(m);
  for i:=1 to 1000 do
    begin
        if a[i] then begin write(i); dec(m);         
        if not (m=0) then write(' ');
    end;
end;
End.