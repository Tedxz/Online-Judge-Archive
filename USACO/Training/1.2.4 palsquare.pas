{
USER: Xie Zheng
TASK: palsquare
LANG: PASCAL
}
Program palsquare; //USACO 1.2.4
Const
  dic:array[0..19] of char=('0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F','G','H','I','J');
Var
  s,st:array[1..17] of integer;
  b:integer;
  i,j,k,l:longint;
  x:boolean;
Begin
  assign(input,'palsquare.in'); reset(input);
  assign(output,'palsquare.out'); rewrite(output);
  readln(b);
  writeln(1,' ',1);
  for i:=2 to 300 do
    begin
      l:=0; k:=i*i;
      while k>0 do
        begin
          inc(l);
          s[l]:=k mod b;
          k:=k div b;
        end;
      x:=true;
      for j:=1 to l shr 1 do
        if s[j]<>s[l-j+1] then begin x:=false; break; end;
      if x then
        begin
          k:=i; j:=0;
          while k>0 do
            begin
              inc(j);
              st[j]:=k mod b;
              k:=k div b;
            end;
          for k:=j downto 1 do write(dic[st[k]]);
          write(' ');
          for j:=1 to l do write(dic[s[j]]);
          writeln;
        end;
    end;
  close(input);
  close(output);
End.


