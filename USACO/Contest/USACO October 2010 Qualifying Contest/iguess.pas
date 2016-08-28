{
USER: Xie Zheng
TASK: iguess
LANG: PASCAL
}
Program iguess; //USACO October 2010 Bronze Fun Exercises
Var
  h,t,m:longint;
  ch:char;
Begin
  h:=1;
  readln(t);
  m:=(h+t)>>1;
  writeln(stdout,m); flush(stdout);
  while h<t do
    begin
      readln(ch);
      if ch='H' then t:=m else h:=m+1;
      m:=(h+t)>>1;
      writeln(stdout,m); flush(stdout);
    end;
End.