Program RQNOJ_485;
Var
  s:string;
  n,k,i,j:longint;
Begin
  readln(s);
  j:=1; n:=0;
  for i:=1 to 11 do
    if s[i]<>'-' then begin n:=n+(ord(s[i])-48)*j; inc(j); end;
  n:=n mod 11;
  if s[13]='X' then j:=10 else j:=ord(s[13])-48;
  if n=j then s:='Right'
  else
    begin
      s[13]:=chr(n+48);
      if n=10 then s[13]:='X';
    end;
  writeln(s);
End.
