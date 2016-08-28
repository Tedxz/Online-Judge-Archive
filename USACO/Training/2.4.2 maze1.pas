{
USER: Xie Zheng
TASK: maze1
LANG: PASCAL
}
Program maze1; //USACO 2.4.2
Const
  dx:array[1..4] of integer=(0,1,0,-1);
  dy:array[1..4] of integer=(1,0,-1,0);
Var
  w,h,i,j,k:integer;
  ans:longint;
  a:array[0..203,0..83] of char;
  door:array[1..2,1..2] of integer;
  f:array[0..101,0..39,1..2] of longint;
  v:array[0..101,0..39] of boolean;
  function min(a,b:longint):longint;
    begin
      if a<b then exit(a) else exit(b);
    end;
  procedure floodfill(x,y,k:integer);
    var h,t,i:integer;
        q:array[1..3900,1..2] of integer;
    begin
      h:=0; t:=1;
      q[1,1]:=x; q[1,2]:=y; f[x,y,k]:=1;
      v[x,y]:=true;
      while h<t do
        begin
          inc(h);
          for i:=1 to 4 do
            begin
              if not v[q[h,1]+dx[i],q[h,2]+dy[i]] then
                if (a[q[h,1]<<1+dx[i],q[h,2]<<1]=' ') and (a[q[h,1]<<1,q[h,2]<<1+dy[i]]=' ') then
                  begin
                    inc(t);
                    q[t,1]:=q[h,1]+dx[i]; q[t,2]:=q[h,2]+dy[i];
                    v[q[t,1],q[t,2]]:=true;
                    {writeln(f[q[t,1],q[t,2],k]+1);}
                    f[q[t,1],q[t,2],k]:=f[q[h,1],q[h,2],k]+1;
                  end;
            end;
        end;
    end;
Begin
  assign(input,'maze1.in'); reset(input);
  assign(output,'maze1.out'); rewrite(output);
  readln(w,h);
  k:=1;
  for i:=1 to h << 1 + 1 do
    begin
      for j:=1 to w << 1 + 1 do
        begin
          read(a[i,j]);
          if ((i=1) or (i=(h << 1 + 1)) or (j=1) or (j=(w << 1 + 1))) and (a[i,j]=' ') then
            begin door[k,1]:=i; door[k,2]:=j; inc(k); end;
        end;
      readln;
    end;
  for i:=1 to 2 do
    for j:=1 to 2 do
      begin
        if door[i,j]=1 then door[i,j]:=2
          else if ((j=1) and (door[i,j]=h<<1+1)) or ((j=2) and (door[i,j]=w<<1+1)) then dec(door[i,j]);
        door[i,j]:=door[i,j]>>1;
      end;
  fillchar(v,sizeof(v),false);
  floodfill(door[1,1],door[1,2],1);
  fillchar(v,sizeof(v),false);
  floodfill(door[2,1],door[2,2],2);
  for i:=1 to h do
    for j:=1 to w do
      if min(f[i,j,1],f[i,j,2])>ans then ans:=min(f[i,j,1],f[i,j,2]);
  writeln(ans);
  close(input);
  close(output);
End.

