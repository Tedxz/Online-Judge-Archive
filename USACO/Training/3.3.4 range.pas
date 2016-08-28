{
ID: xie_zhe1
PROG: range
LANG: PASCAL
}
Program range; //USACO 3.3.4
Const
  maxN=250;
Var
  field:array[0..maxN,0..maxN] of char;
  f:array[0..maxN,0..maxN] of word;
  ans:array[2..maxN] of word;
  i,j,k,n:word;
  function min(a,b,c:word):word;
    begin
      if a>b then a:=b;
      if a>c then exit(c) else exit(a);
    end;
Begin
  assign(input,'range.in'); reset(input);
  assign(output,'range.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      for j:=1 to n do
        read(field[i,j]);
        readln;
    end;
  close(input);
  for i:=1 to n do
    for j:=1 to n do
      if field[i,j]='1' then
        begin
          f[i,j]:=min(f[i-1,j],f[i,j-1],f[i-1,j-1])+1;
          for k:=2 to f[i,j] do inc(ans[k]);
        end;
  for i:=2 to n do
    if ans[i]>0 then writeln(i,' ',ans[i]);
  close(output);
End.
