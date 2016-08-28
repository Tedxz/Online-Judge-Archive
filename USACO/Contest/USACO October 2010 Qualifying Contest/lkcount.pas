{
USER: Xie Zheng
TASK: lkcount
LANG: PASCAL
}
Program lkcount; //USACO October 2010 Silver Qualifying Contest
Const
  maxN=100;
  dx:array[1..4] of shortint=(1,0,-1,0);
  dy:array[1..4] of shortint=(0,1,0,-1);
Var
  a:array[0..maxN+1,0..maxN+1] of boolean;
  i,j,n,m,ans:longint;
  ch:char;
  procedure dfs(x,y:integer);
    var i,j:integer;
    begin
      a[x,y]:=false;
      for i:=-1 to 1 do
        for j:=-1 to 1 do
          if a[x+i,y+j] then dfs(x+i,y+j);
    end;
Begin
  assign(input,'lkcount.in'); reset(input);
  assign(output,'lkcount.out'); rewrite(output);
  readln(n,m);
  for i:=1 to n do
    begin
      for j:=1 to m do
        begin
          read(ch);
          if ch='W' then a[i,j]:=true;
        end;
      readln;
    end;
  ans:=0;
  for i:=1 to n do
    for j:=1 to m do
      if a[i,j] then begin inc(ans); dfs(i,j); end;
  writeln(ans);
  close(input);
  close(output);
End.



