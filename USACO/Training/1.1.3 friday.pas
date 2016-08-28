{
USER: Xie Zheng
TASK:friday
LANG:PASCAL
}
Program friday; //USACO 1.1.3
Const
  a:array[1..12] of integer=(31,28,31,30,31,30,31,31,30,31,30,31);
Var
  n,i,j,t:longint;
  b:array[0..6] of longint;
Begin
  assign(input,'friday.in'); reset(input);
  assign(output,'friday.out'); rewrite(output);
  readln(n);t:=0;
  for i:=1900 to 1900+n-1 do
  begin
    if (i mod 400=0)or((i mod 4=0)and(i mod 100<>0)) then a[2]:=29 else a[2]:=28;
    for j:=1 to 12 do
    begin
      inc(b[(t+13) mod 7]);
      inc(t,a[j]);
    end;
  end;
  writeln(b[6],' ',b[0],' ',b[1],' ',b[2],' ',b[3],' ',b[4],' ',b[5]);
  close(input);
  close(output);
End.