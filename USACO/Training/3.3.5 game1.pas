{
USER: Xie Zheng
TASK: game1
LANG: PASCAL
}
Program game1; //USACO 3.3.5
Const
  maxN=100;
Var
  s:array[0..maxN] of dword;
  f:array[1..maxN,1..maxN] of dword;
  i,j,l,n:dword;
  function min(a,b:dword):dword;
    begin
      if a<b then exit(a) else exit(b);
    end;
Begin
  assign(input,'game1.in'); reset(input);
  assign(output,'game1.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    begin read(s[i]); inc(s[i],s[i-1]); end;
  close(input);
  for i:=1 to n do f[i,i]:=s[i]-s[i-1];
  for l:=2 to n do
    for i:=1 to n-l+1 do
      begin
        j:=i+l-1;
        f[i,j]:=s[j]-s[i-1]-min(f[i,j-1],f[i+1,j]);
      end;
  writeln(f[1,n],' ',s[n]-f[1,n]);
  close(output);
End.
