{
USER: Xie Zheng
TASK: namenum
LANG: PASCAL
}
Program namenum; //USACO 1.2.3
Const
  dic:array['A'..'Z'] of char=('2','2','2','3','3','3','4','4','4','5','5','5','6','6','6','7','7','7','7','8','8','8','9','9','9','9');
Var
  s,st:string;
  i,j,l:integer;
  x,y:boolean;
Begin
  assign(input,'namenum.in'); reset(input);
  assign(output,'namenum.out'); rewrite(output);
  readln(s);
  close(input);
  l:=length(s);
  assign(input,'dict.txt'); reset(input);
  y:=true;
  while not eof do
    begin
      readln(st);
      if l<>length(st) then continue;
      x:=true;
      for i:=1 to l do
        if s[i]<>dic[st[i]] then begin x:=false; break; end;
      if not x then continue;
      writeln(st);
      y:=false;
    end;
  if y then writeln('NONE');
  close(input);
  close(output);
End.
