{
USER: Xie Zheng
TASK: fence4
LANG: PASCAL
}
Program fence4; //USACO 3.4.1
Const
  w:array[1..4,1..2] of real=((0.000754,0.00000012),(0.000000000012,0.00034234),(-0.0002936487,0.000000213),(0.0000000000213,-0.000623984692));
Type
  node=record
    x1,y1,x2,y2:real;
   end;
  node2=record
    x,y:real;
  end;
Var
  n,i,j,k,minp,num,o:longint;
  line:array[1..200] of node;
  ok:array[1..200] of boolean;
  v:array[1..200] of node2;
  min,dis,dis0,xx,yy,a,b,c,d,mm,nn,k1,k2,d0,dx,dy,x,y,x0,y0,x1,y1,x2,y2:real;
  t:node;
  function cross(x1,y1,x2,y2:real; k:node):boolean;
    var f:boolean;
        s1,s2:real;
    begin
      f:=true;
      s1:=(x1-x2)*(y1-k.y1)-(y1-y2)*(x1-k.x1);
      s2:=(x1-x2)*(y1-k.y2)-(y1-y2)*(x1-k.x2);
      f:=f and (s1*s2<=0);
      s1:=(k.x1-k.x2)*(k.y1-y1)-(k.y1-k.y2)*(k.x1-x1);
      s2:=(k.x1-k.x2)*(k.y1-y2)-(k.y1-k.y2)*(k.x1-x2);
      f:=f and (s1*s2<=0);
      cross:=f;
    end;
Begin
  assign(input,'fence4.in');
  assign(output,'fence4.out');
  reset(input);
  rewrite(output);
  readln(n);
  readln(x0,y0);
  readln(x,y);
  v[1].x:=x; v[1].y:=y;
  line[n].x1:=x; line[n].y1:=y;
  line[1].x1:=x; line[1].y1:=y;
  for i:=1 to n-1 do
    begin
      readln(x,y);
      v[i+1].x:=x; v[i+1].y:=y;
      line[i].x2:=x; line[i].y2:=y;
      if i<>n-1 then begin
         line[i+1].x1:=x; line[i+1].y1:=y; end else begin
         line[i+1].x2:=x; line[i+1].y2:=y; end;
    end;
  t:=line[n-1]; line[n-1]:=line[n]; line[n]:=t;
  fillchar(ok,sizeof(ok),false);
  for i:=1 to n do
    for o:=1 to 4 do
    begin
      x:=v[i].x+w[o,1]; y:=v[i].y+w[o,2];
      dis0:=sqrt(sqr(x0-v[i].x)+sqr(y0-v[i].y));
      min:=1000000; minp:=0;
      for j:=1 to n do
        if cross(x0,y0,x,y,line[j]) then
           begin
             a:=x-x0; b:=line[j].x1-line[j].x2;                        
             c:=y-y0; d:=line[j].y1-line[j].y2;
             mm:=line[j].x1-x0; nn:=line[j].y1-y0;
             d0:=a*d-c*b; dx:=mm*d-nn*b; dy:=a*nn-c*mm;
             k1:=dx/d0; k2:=dy/d0;
             xx:=x0+(x-x0)*k1; yy:=y0+(y-y0)*k1;
             dis:=sqrt(sqr(x0-xx)+sqr(y0-yy));
             if dis<min then begin
                min:=dis;
                minp:=j;end;
           end;
      if minp<>0 then ok[minp]:=true;
    end;
  for i:=1 to n do
    if ok[i] then inc(num);
  writeln(num);
  for i:=1 to n do
    if ok[i] then
       writeln(line[i].x1:0:0,' ',line[i].y1:0:0,' ',line[i].x2:0:0,' ',line[i].y2:0:0);
  close(input);
  close(output);
End.