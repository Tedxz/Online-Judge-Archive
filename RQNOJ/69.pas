Program RQNOJ_69;
Var
  f:array[-2..22,-2..22] of int64;
  i,j,k,m,n,x,y:longint;
Begin
  readln(n,m,x,y);
  fillchar(f,sizeof(f),0);
  for i:=0 to n do
    for j:=0 to m do
      f[i,j]:=32767;
  f[n,m+1]:=32767; f[n+1,m]:=32767; f[0,0]:=1;
  f[x,y]:=0;       //horse
  for i:=-2 to 2 do
    for j:=-2 to 2 do
      if abs(i*j)=2 then f[x+i,y+j]:=0;
  for i:=0 to n do
    for j:=0 to m do
      if f[i,j]=maxint then f[i,j]:=f[i-1,j]+f[i,j-1];
  writeln(f[n,m]);
End.