Program Ural_1038;
Const
  s1:set of char=['a'..'z'];
  s2:set of char=['A'..'Z'];
  s3:set of char=['.','!','?'];
Var
  s:string;
  c:char;
  ans,l:integer;
  b:byte;
Begin
  b:=2; ans:=0;
  repeat
    readln(s);
    l:=0;
    while (l<length(s)) do
      begin
        inc(l);
        c:=s[l];
        if(c in s1)or(c in s2)then
          begin
            if(c in s1)and(b=2)then inc(ans);
            if(c in s2)and(b=0)then inc(ans);
            b:=0;
          end
        else
          if(c in s3)then b:=2
          else if(b=0)then b:=1;
      end;
    if(b=0)then b:=1;
  until(seekeof);
  writeln(ans);
End.