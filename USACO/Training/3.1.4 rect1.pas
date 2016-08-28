{
USER: Xie Zheng
TASK: rect1
LANG: PASCAL
}
Program rect1; //USACO 3.1.4
Const
  maxN=1000;
  maxC=2500;
Var
  x1,x2,y1,y2,color:array[0..maxN] of word;
  i,n,col:word;
  ans:array[1..maxC] of dword;
  procedure cal(l,d,r,u,k:word);
    begin
      if (l>=x1[k]) and (r<x2[k]) and (d>y1[k]) and (u<y2[k]) then exit;
      while (k<=n) and ((l>=x2[k]) or (r<x1[k]) or (u<y1[k]) or (d>y2[k])) do inc(k);
      if (l>=x1[k]) and (r<x2[k]) and (d>y1[k]) and (u<y2[k]) then exit;
      if k=n+1 then
        begin inc(ans[col],(r-l)*(u-d)); exit; end;
      if l<x1[k] then begin cal(l,d,x1[k],u,k+1); l:=x1[k]; end;
      if r>x2[k] then begin cal(x2[k],d,r,u,k+1); r:=x2[k]; end;
      if u>y2[k] then cal(l,y2[k],r,u,k+1);
      if d<y1[k] then cal(l,d,r,y1[k],k+1);
    end;
Begin
  assign(input,'rect1.in'); reset(input);
  assign(output,'rect1.out'); rewrite(output);
  readln(x2[0],y2[0],n);
  x1[0]:=0; y1[0]:=0; color[0]:=1;
  for i:=1 to n do
    read(x1[i],y1[i],x2[i],y2[i],color[i]);
  close(input);
  for i:=n downto 0 do
    begin
      col:=color[i];
      cal(x1[i],y1[i],x2[i],y2[i],i+1);
    end;
  for i:=1 to maxC do
    if ans[i]>0 then writeln(i,' ',ans[i]);
  close(output);
End.
