{
USER: Xie Zheng
TASK: countbead
LANG: PASCAL
}
Program countbead; //USACO October 2010 Bronze Fun Exercises
Const
  maxN=80;
Var
  a:array[1..maxN] of boolean;
  i,n,ans:integer;
  t:integer;
Begin
  assign(input,'countbead.in'); reset(input);
  assign(output,'countbead.out'); rewrite(output);
  readln(n);
  for i:=1 to n do begin read(t); if t=1 then a[i]:=true; end;
  for i:=2 to n do if a[i] xor a[i-1] then inc(ans);
  writeln(ans);
  close(input);
  close(output);
End.
