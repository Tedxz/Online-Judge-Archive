{
USER: Xie Zheng
TASK: castle
LANG: PASCAL
}
Program castle; //USACO 2.1.1
Var
  a,v:array[0..51,0..51] of integer;
  room:array[-1..2500] of integer;
  i,j,k,q,ans1,ans2,ans3,m,n,sum,rx,ry:integer;
  w:char;
  procedure floodfill(x,y:integer);
    begin
      inc(sum);
      v[x,y]:=ans1;
      if (v[x,y-1]=-1) and (a[x,y] and 1=0) then floodfill(x,y-1);
      if (v[x-1,y]=-1) and (a[x,y] and 2=0) then floodfill(x-1,y);
      if (v[x,y+1]=-1) and (a[x,y] and 4=0) then floodfill(x,y+1);
      if (v[x+1,y]=-1) and (a[x,y] and 8=0) then floodfill(x+1,y);
    end;
Begin
  assign(input,'castle.in'); reset(input);
  assign(output,'castle.out'); rewrite(output);
  readln(m,n);
  room[-1]:=-1;
  for i:=1 to n do
    for j:=1 to m do
      read(a[i,j]);
  for i:=0 to n+1 do
    for j:=0 to m+1 do
      v[i,j]:=-1;
  ans1:=0;
  for i:=1 to n do
    for j:=1 to m do
      if v[i,j]=-1 then
        begin
          sum:=0;
          inc(ans1);
          floodfill(i,j);
          room[ans1]:=sum;
          if sum>ans2 then ans2:=sum;
        end;
  ans3:=0;
  for j:=1 to m do
    for i:=n downto 1 do
      begin
        if ((a[i,j] and 2)=2) and (room[v[i,j]]+room[v[i-1,j]]>ans3) and (v[i,j]<>v[i-1,j]) then
          begin ans3:=room[v[i,j]]+room[v[i-1,j]]; rx:=i; ry:=j; w:='N' end;
        if ((a[i,j] and 4)=4) and (room[v[i,j]]+room[v[i,j+1]]>ans3) and (v[i,j]<>v[i,j+1]) then
          begin ans3:=room[v[i,j]]+room[v[i,j+1]]; rx:=i; ry:=j; w:='E' end;
      end;
  writeln(ans1);
  writeln(ans2);
  writeln(ans3);
  writeln(rx,' ',ry,' ',w);
  close(input);
  close(output);
End.
