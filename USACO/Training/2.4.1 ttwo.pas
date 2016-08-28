{
USER: Xie Zheng
TASK: ttwo
LANG: PASCAL
}
Program ttwo; //USACO 2.4.1
Const
  dx:array[1..4] of integer=(-1,0,1,0);
  dy:array[1..4] of integer=(0,1,0,-1);
Var
  m:array[0..11,0..11] of boolean;
  i,j,k,ans:longint;
  ch:char;
  cx,cy,cf,px,py,pf:integer;
  vis:array[1..10,1..10,1..4,1..10,1..10,1..4] of boolean;
  procedure move(var x,y,f:integer);
    begin
      if m[x+dx[f],y+dy[f]] then begin inc(x,dx[f]); inc(y,dy[f]); exit; end;
      f:=f mod 4 +1;
    end;
Begin
  assign(input,'ttwo.in'); reset(input);
  assign(output,'ttwo.out'); rewrite(output);
  for i:=1 to 10 do
    begin
      for j:=1 to 10 do
        begin
          read(ch);
          case ch of
            '.':m[i,j]:=true;
            'C':begin cx:=i; cy:=j; cf:=1; m[i,j]:=true; end;
            'F':begin px:=i; py:=j; pf:=1; m[i,j]:=true; end;
            end;
        end;
      readln;
    end;
  vis[px,py,pf,cx,cy,cf]:=true;
  ans:=0;
  while true do
    begin
      inc(ans);
      move(px,py,pf);
      move(cx,cy,cf);
      if (px=cx) and (py=cy) then begin writeln(ans); break; end;
      if vis[px,py,pf,cx,cy,cf] then begin writeln(0); break; end;
      vis[px,py,pf,cx,cy,cf]:=true;
    end;
  close(input);
  close(output);
End.