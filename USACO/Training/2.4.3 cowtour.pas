{
USER: Xie Zheng
TASK: cowtour
LANG: PASCAL
}
Program cowtour; //USACO 2.4.3
Type
  pt=record
    x,y:longint;
    end;
Const
  maxN=150;
Var
  f:array[1..maxN] of pt;
  r:array[1..maxN] of extended;
  road:array[1..maxN,1..maxN] of boolean;
  n,i,j,k:longint;
  ans,t,mr:extended;
  ch:char;
  dis:array[1..maxN,1..maxN] of extended;
  function max(a,b:extended):extended;
    begin
      if a>b then exit(a) else exit(b);
    end;

  function distance(i,j:integer):extended;
    begin
      exit(sqrt(sqr(f[i].x-f[j].x)+sqr(f[i].y-f[j].y)));
    end;
Begin
  assign(input,'cowtour.in'); reset(input);
  assign(output,'cowtour.out'); rewrite(output);
  readln(n);
  for i:=1 to n do readln(f[i].x,f[i].y);
  for i:=1 to n do
    begin
      for j:=1 to n do
        begin
          read(ch);
          if i=j then begin road[i,j]:=true; dis[i,i]:=0; continue; end;
          if ch='1' then
            begin road[i,j]:=true; dis[i,j]:=distance(i,j); end
            else dis[i,j]:=1e12;
        end;
      readln;
    end;
  close(input);
  for k:=1 to n do
    for i:=1 to n do
      for j:=1 to n do
        if dis[i,k]+dis[k,j]<dis[i,j] then
          begin
            dis[i,j]:=dis[i,k]+dis[k,j];
          end;
  mr:=0;
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if (dis[i,j]<1e11) and (i<>j) then
        begin
          if dis[i,j]>r[i] then r[i]:=dis[i,j];
          if dis[i,j]>r[j] then r[j]:=dis[i,j];
        end;
  for i:=1 to n do if r[i]>mr then mr:=r[i];
  ans:=1e1000;
  for i:=1 to n-1 do
    for j:=i+1 to n do
      if dis[i,j]>1e11 then
      begin
        t:=r[i]+r[j]+distance(i,j);
        if t<ans then begin ans:=t; end;
      end;
  writeln(max(mr,ans):0:6);
  close(output);
End.