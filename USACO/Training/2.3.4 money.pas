{
USER: Xie Zheng
TASK: money
LANG: PASCAL
}
Program money; //USACO 2.3.4
Var
  v,n,i,j:integer;
  a:array[1..25] of integer;
  f:array[0..10000] of qword;
Begin
  assign(input,'money.in'); reset(input);
  assign(output,'money.out'); rewrite(output);
  readln(v,n);
  for i:=1 to v do read(a[i]);
  f[0]:=1;
  for i:=1 to v do
    begin
      if a[i]>n then continue;
      for j:=0 to n-a[i] do if f[j]>0 then inc(f[j+a[i]],f[j]);
    end;
  writeln(f[n]);
  close(input);
  close(output);
End.
