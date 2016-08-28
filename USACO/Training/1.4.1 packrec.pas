{
USER: Xie Zheng
TASK: packrec
LANG: PASCAL
}
Program packrec; //USACO 1.4.1
Const 
  order:array[1..6,1..3] of integer=((2,3,4),(2,4,3),(3,2,4),(3,4,2),(4,2,3),(4,3,2));
Var
  rec:array[1..4,1..2] of integer;
  i,j,k,sum,p,ord:integer; //sum:最小面积 p:可放点的个数
  ans:array[0..30] of integer;
  pts:array[1..30,1..2] of integer;
  pack:array[1..4,1..4] of integer; //已放的矩形坐标
  procedure qs(h,t:integer);
    var i,j,x,c:integer;
    begin
      i:=h; j:=t; x:=ans[(h+t) shr 1];
      while i<=j do
        begin
          while x<ans[j] do dec(j);
          while x>ans[i] do inc(i);
          if i<=j then
            begin
              c:=ans[i]; ans[i]:=ans[j]; ans[j]:=c;
              inc(i); dec(j);
            end;
        end;
      if h<j then qs(h,j);
      if i<t then qs(i,t);
    end;
  procedure check;
    var maxx,maxy,s,t,i:integer;
    begin
      maxx:=0; maxy:=0;
      for i:=1 to 4 do
        begin
          if pack[i,3]>maxx then maxx:=pack[i,3];
          if pack[i,4]>maxy then maxy:=pack[i,4];
        end;
      s:=maxx*maxy;
      if s>sum then exit;
      if maxx>maxy then t:=maxy else t:=maxx;
      if s<sum then
        begin sum:=s; ans[0]:=1; ans[1]:=t; exit; end;
      for i:=1 to ans[0] do
        if t=ans[i] then exit;
      inc(ans[0]); ans[ans[0]]:=t;
    end;
  procedure add_pts(k:integer); //已放第k+1个 增加两个点 (x,py) (px,y) 。(x,y)是k+1矩形右下角。 当已放置3个，可增加（maxx,xaxy）作为最后矩形的右下点。
    var px,py,x,y,i:integer;
    begin
      x:=pack[k+1,3]; y:=pack[k+1,4];
      px:=0; py:=0;
      for i:=1 to k do
        begin
          if (x>=pack[i,1]) and (x<pack[i,3]) and (py<pack[i,4]) then py:=pack[i,4];
          if (y>=pack[i,2]) and (y<pack[i,4]) and (px<pack[i,3]) then px:=pack[1,3];
        end;
      inc(p,2);
      pts[p-1,1]:=x; pts[p-1,2]:=py;
      pts[p,1]:=px; pts[p,2]:=y;
      if k=2 then 
        begin
          inc(p);
          for i:=1 to 3 do
            begin
              if pack[i,3]>px then px:=pack[i,3];
              if pack[i,4]>py then py:=pack[i,4];
            end;         
          pts[p,1]:=px-rec[order[ord,3],1];
          pts[p,2]:=py-rec[order[ord,3],2];
          if (pts[p,1]<1) or (pts[p,2]<1) then dec(p);
        end;
    end;
  function  can(k,pn:integer):boolean;
    var cx1,cy1,cx,cy,ex,ey:real;
        i:integer;
    begin
      cx:=pts[pn,1]+rec[order[ord,k],1]/2;
      cy:=pts[pn,2]+rec[order[ord,k],2]/2;
      
      for i:=1 to k do
        begin
          cx1:=(pack[i,1]+pack[i,3])/2;
          cy1:=(pack[i,2]+pack[i,4])/2;
          ex:=pack[i,3]-pack[i,1];
          ey:=pack[i,4]-pack[i,2];
          if (abs(cx-cx1)<((ex+rec[order[ord,k],1])/2)) and (abs(cy-cy1)<((ey+rec[order[ord,k],2])/2)) then exit(false);
        end;
      exit(true);
    end;
  procedure dfs(ord,k:integer);
    var i,j,pt,t:integer;
    begin
      if k=4 then begin check;{include inc(ans) or not} exit; end;
      pt:=p;
      for i:=1 to pt do
        begin
          if can(k,i) and ((pts[i,1]+rec[order[ord,k],1])*(pts[i,2]+rec[order[ord,k],2])<=sum) then
            begin
              pack[k+1,1]:=pts[i,1]; pack[k+1,2]:=pts[i,2]; pack[k+1,3]:=pts[i,1]+rec[order[ord,k],1]; pack[k+1,4]:=pts[i,2]+rec[order[ord,k],2];
              add_pts(k);
              dfs(ord,k+1);
              p:=pt;
            end;
        end;
      if rec[order[ord,k],1]<>rec[order[ord,k],2] then 
        begin t:=rec[order[ord,k],1]; rec[order[ord,k],1]:=rec[order[ord,k],2]; rec[order[ord,k],2]:=t; end
        else exit;
      for i:=1 to pt do
        begin
          if can(k,i) and ((pts[i,1]+rec[order[ord,k],1])*(pts[i,2]+rec[order[ord,k],2])<=sum) then
            begin
              pack[k+1,1]:=pts[i,1]; pack[k+1,2]:=pts[i,2]; pack[k+1,3]:=pts[i,1]+rec[order[ord,k],1]; pack[k+1,4]:=pts[i,2]+rec[order[ord,k],2];
              add_pts(k);
              dfs(ord,k+1);
              p:=pt;
            end;
        end;
    end;
Begin
  assign(input,'packrec.in'); reset(input);
  assign(output,'packrec.out'); rewrite(output);
  for i:=1 to 4 do readln(rec[i,1],rec[i,2]);
  sum:=10000; ans[0]:=0;
  pack[1,1]:=0; pack[1,2]:=0; pack[1,3]:=rec[1,1]; pack[1,4]:=rec[1,2];
  pts[1,1]:=rec[1,1]; pts[1,2]:=0; pts[2,1]:=0; pts[2,2]:=rec[1,2]; p:=2;
  for ord:=1 to 6 do
    dfs(ord,1);
  qs(1,ans[0]);
  writeln(sum);
  for i:=1 to ans[0] do writeln(ans[i],' ',sum div ans[i]);
  close(input);
  close(output);
End.