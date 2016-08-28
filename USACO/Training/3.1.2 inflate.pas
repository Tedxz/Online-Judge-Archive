{
USER: Xie Zheng
TASK: inflate
LANG: PASCAL
}
Program humble; //USACO 3.1.2
Const
  maxN=10000;
  maxT=10000;
Var
  t,n,i,j,k:longint;
  s:array[0..maxN] of longint;
  m:array[0..maxN] of longint;
  f:array[0..maxN] of longint;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
Begin
  assign(input,'inflate.in'); reset(input);
  assign(output,'inflate.out'); rewrite(output);
  readln(t,n);
  for i:=1 to n do
    readln(s[i],m[i]);
  close(input);
  for i:=1 to n do
    for j:=m[i] to t do
      f[j]:=max(f[j],f[j-m[i]]+s[i]);
  writeln(f[t]);
  close(output);
End.
