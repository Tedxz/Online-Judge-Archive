{
USER: Xie Zheng
TASK: sort3
LANG: PASCAL
}
Program sort3; //USACO 2.1.3
Var
  a:array[1..1000] of integer;
  b:array[1..3] of integer;
  c:array[1..3,1..3] of integer;
  ans,s,i,n:integer;
  function min(a,b:integer):integer;
    begin
      if a<b then exit(a) else exit(b);
    end;
Begin
  assign(input,'sort3.in'); reset(input);
  assign(output,'sort3.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(a[i]);
      inc(b[a[i]]);
    end;
  for i:=1 to b[1] do
    inc(c[1,a[i]]);
  for i:=b[1]+1 to b[1]+b[2] do
    inc(c[2,a[i]]);
  for i:=b[1]+b[2]+1 to n do
    inc(c[3,a[i]]);
  s:=min(c[1,2],c[2,1]);
  inc(ans,s); dec(c[1,2],s); dec(c[2,1],s);
  s:=min(c[1,3],c[3,1]);
  inc(ans,s); dec(c[1,3],s); dec(c[3,1],s);
  s:=min(c[2,3],c[3,2]);
  inc(ans,s); dec(c[2,3],s); dec(c[3,2],s);
  s:=(c[1,2]+c[1,3])*2;
  inc(ans,s);
  writeln(ans);
  close(input);
  close(output);
End.

