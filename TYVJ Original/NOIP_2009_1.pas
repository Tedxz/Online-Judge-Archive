Program NOIP_2009_1;
Var
  a:array['A'..'Z'] of char;
  b:array['A'..'Z'] of boolean;
  i,j:integer;
  st,s:string;
  k:char;
Begin
  readln(st);
  readln(s);
  fillchar(a,sizeof(a),0);
  fillchar(b,sizeof(b),false);
  for i:=1 to length(s) do
    begin
      if (ord(a[st[i]])=0) or (a[st[i]]=s[i]) then a[st[i]]:=s[i]
        else begin writeln('Failed'); close(input); close(output); halt; end;
    end;
  for k:='A' to 'Z' do
    if ord(a[k])=0 then begin writeln('Failed'); halt; end
      else if b[a[k]] then begin writeln('Failed'); close(input); close(output); halt; end
             else b[a[k]]:=true;
  readln(s);
  for i:=1 to length(s) do
    write(a[s[i]]);
  writeln;
End.