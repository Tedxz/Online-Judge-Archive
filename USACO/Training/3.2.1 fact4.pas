{
USER: Xie Zheng
TASK: fact4
LANG: PASCAL
}
Program fact4; //USACO 3.2.1
Var
  i,n:word;
  ans:dword;
Begin
  assign(input,'fact4.in'); reset(input);
  assign(output,'fact4.out'); rewrite(output);
  readln(n);
  close(input);
  ans:=1;
  for i:=2 to n do
    begin
      ans:=ans*i;
      while ans mod 10=0 do ans:=ans div 10;
      ans:=ans mod 100000;
    end;
  writeln(ans mod 10);
  close(output);
End.
