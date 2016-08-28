{
USER: Xie Zheng
TASK: satpix
LANG: PASCAL
}
Program satpix; //USACO Demo Bronze Competition
Const
  maxH=1000;
  maxW=80;
  dx:array[1..4] of shortint=(1,0,-1,0);
  dy:array[1..4] of shortint=(0,1,0,-1);
Var
  a:array[0..maxH+1,0..maxW+1] of boolean;
  i,j,k,n,h,w,ans:longint;
  ch:char;
  procedure dfs(x,y:integer);
    var i:shortint;
    begin
      inc(k);
      a[x,y]:=false;
      for i:=1 to 4 do
        if a[x+dx[i],y+dy[i]] then dfs(x+dx[i],y+dy[i]);
    end;
Begin
  assign(input,'satpix.in'); reset(input);
  assign(output,'satpix.out'); rewrite(output);
  readln(w,h);
  for i:=1 to h do
    begin
      for j:=1 to w do
        begin
          read(ch);
          case ch of
            '*':a[i,j]:=true;
            '.':a[i,j]:=false;
          end;
        end;
      readln;
    end;
  close(input);
  for i:=1 to h do
    for j:=1 to w do
      if a[i,j] then
        begin
          k:=0;
          dfs(i,j);
          if k>ans then ans:=k;
        end;
  writeln(ans);
  close(output);
End.


