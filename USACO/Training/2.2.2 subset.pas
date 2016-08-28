{
USER: Xie Zheng
TASK: subset
LANG: PASCAL
}
Program subset; //USACO 2.2.2
Var
  f:array[1..39,0..780] of longint;
  i,j,n,s:longint;
Begin
  assign(input,'subset.in'); reset(input);
  assign(output,'subset.out'); rewrite(output);
  readln(n);
  close(input);
  s:=(1+n)*n shr 1;
  if s and 1=1 then begin writeln(0); close(output); halt; end;
  s:=s >> 1;
  f[1,1]:=1;
  f[1,0]:=1;
  for i:=2 to n do
    for j:=1 to ((1+i)*i >> 1) do
      begin
        f[i,j]:=f[i-1,j];
        if j-i>0 then inc(f[i,j],f[i-1,j-i]);
      end;
  writeln(f[n,s]);
  close(output);
End.
