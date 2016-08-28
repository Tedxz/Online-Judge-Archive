//TYVJ P1027
Const
  dx:array[1..4] of integer=(0,0,1,-1);
  dy:array[1..4] of integer=(1,-1,0,0);
Var
  a:array[0..41,0..41] of longint;
  i,j,k,r,c,d,max,ans:longint;
Begin
  readln(r,c);
  fillword(a,sizeof(a) shr 1,-32768);
  for i:=1 to r do
    for j:=1 to c do
      read(a[i,j]);
  ans:=a[1,1];
  a[1,1]:=0;
  i:=1; j:=1;
  while (i<>r) or (j<>c) do
    begin
      max:=0; d:=0;
      for k:=1 to 4 do
        if a[i+dx[k],j+dy[k]]>max then begin max:=a[i+dx[k],j+dy[k]]; d:=k; end;
      inc(ans,max); a[i+dx[d],j+dy[d]]:=0;
      inc(i,dx[d]); inc(j,dy[d]);
    end;
  writeln(ans);
End.
