{
USER: Xie Zheng
TASK: dinner
LANG: PASCAL
}
Program dinner; //USACO October 2010 Silver Qualifying Contest
Const
  maxN=1000;
Var
  seat,cow:array[1..maxN,1..2] of int64;
  f:array[1..maxN] of boolean;
  i,j,k,n,m,p:longint;
  tem,min:extended;
  function dis(i,j:longint):extended;
    begin
      dis:=sqrt((seat[i,1]-cow[j,1])*(seat[i,1]-cow[j,1])+(seat[i,2]-cow[j,2])*(seat[i,2]-cow[j,2]));
    end;
Begin
  assign(input,'dinner.in'); reset(input);
  assign(output,'dinner.out'); rewrite(output);
  fillchar(f,sizeof(f),false);
  readln(n,m);
  if n=m then begin writeln(0); close(input); close(output); halt; end;
  for i:=1 to n do
    readln(cow[i,1],cow[i,2]);
  for i:=1 to m do
    readln(seat[i,1],seat[i,2]);
  for i:=1 to m do
    begin
      p:=0; min:=900000000000000000;
      for j:=1 to n do
        begin
          if f[j] then continue;
          tem:=dis(i,j);
          if min>tem then begin min:=tem; p:=j; end;
        end;
      f[p]:=true;
    end;
  for i:=1 to n do if not f[i] then writeln(i);
  close(input);
  close(output);
End.

