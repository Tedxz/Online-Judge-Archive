Program Ural_1226;
Const
  zm=['a'..'z','A'..'Z'];
Var
  s:string;
  c:char;
Begin
  s:='';
  repeat
    read(c);
    if c in zm then s:=c+s else begin write(s,c); s:=''; end;
  until eof;
  write(s);
End.