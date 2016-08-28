{
USER: Xie Zheng
TASK: nuggets
LANG: PASCAL
}
Program nuggets; //USACO 4.1.1
Const
  maxN=10;
  maxP=256;
Var
  f:array[0..maxP*maxP] of boolean;
  p:array[1..maxN] of integer;
  n,i,j,last,max,min,t:longint;
  procedure sort;
    begin
      for i:=1 to n-1 do
        for j:=n downto i+1 do
          if p[j]<p[j-1] then begin t:=p[j-1]; p[j-1]:=p[j]; p[j]:=t; end;
    end;
Begin
  assign(input,'nuggets.in'); reset(input);
  assign(output,'nuggets.out'); rewrite(output);
  readln(n);
  min:=0; max:=300;
  for i:=1 to n do
    readln(p[i]);
  close(input);
  sort;
  if p[1]=1 then begin writeln(0); close(output); halt; end;
  fillchar(f,sizeof(f),false);
  f[0]:=true;
  last:=0;
  for i:=2 to p[n]*p[n-1] do
    begin
      for j:=1 to n do
        begin
          if p[j]>i then break;
          if f[(i-p[j])] then begin f[i]:=true; break; end;
        end;
      if f[i] then inc(last) else last:=0;
      if last=p[1] then begin writeln(i-last); close(output); halt; end;
    end;
  writeln(0);
  close(output);
End.

