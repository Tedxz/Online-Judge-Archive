{
USER: Xie Zheng
TASK: gift1
LANG: PASCAL
}
Program gift1; //USACO 1.1.2
Var
  nam:array[1..10] of string;
  mon,num,rec:array[1..10] of longint;
  n,i,j,k:integer;
  s,st:string;
  function sp(st:string):integer;
    var i:integer;
    begin
      for i:=1 to n do
        if nam[i]=st then exit(i);
    end;
Begin
  assign(input,'gift1.in'); reset(input);
  assign(output,'gift1.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    readln(nam[i]);
  for i:=1 to n do
    begin
      readln(s);
      k:=sp(s);
      readln(mon[k],num[k]);
      if num[k]=0 then continue;
      for j:=1 to num[k] do
        begin
          readln(st);
          inc(rec[sp(st)],mon[k] div num[k]);
        end;
      rec[k]:=rec[k]+mon[k] mod num[k];
    end;
  for i:=1 to n do
    writeln(nam[i],' ',rec[i]-mon[i]);
  close(input);
  close(output);
End.


