{
USER: Xie Zheng
TASK: fence9
LANG: PASCAL
}
Program fence9; //USACO 3.4.3
Var
  n,m,p:longint;
  b,s:longint;
  function gcd(a,b:longint):longint;
    var t:word;
    begin
      while b<>0 do
        begin
          t:=a mod b;
          a:=b;
          b:=t;
        end;
      exit(a);
    end;
Begin
  assign(input,'fence9.in'); reset(input);
  assign(output,'fence9.out'); rewrite(output);
  readln(n,m,p);
  close(input);
  b:=gcd(n,m)+gcd(m,abs(p-n))+p;
  s:=p*m;
  writeln((s+2-b)>>1);
  close(output);
End.


