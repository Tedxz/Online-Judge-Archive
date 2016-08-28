{
USER: Xie Zheng
TASK: ride
LANG: PASCAL
}
Program ride; //USACO 1.1.1
Var
  s1,s2:string;
  function f(st:string):longint;
    var i:integer;
    begin
      f:=1;
      for i:=1 to length(st) do
        f:=f*(ord(st[i])-ord('A')+1);
      f:=f mod 47;
    end;
Begin
  assign(input,'ride.in'); reset(input);
  assign(output,'ride.out'); rewrite(output);
  readln(s1);
  readln(s2);
  if f(s1)=f(s2) then writeln('GO') else writeln('STAY');
  close(input);
  close(output);
End.
