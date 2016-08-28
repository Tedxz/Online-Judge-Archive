{
USER: Xie Zheng
TASK: camelot
LANG: PASCAL
}
Program camelot; //USACO 3.3.3
Const
 fx:array[1..8] of longint=(-2,-2,-1,1,2,2,1,-1);
 fy:array[1..8] of longint=(-1,1,2,2,1,-1,-2,-2);
Var
  g:array[1..1000,1..2] of longint;
  dist:array[1..30,1..26,1..30,1..26] of longint;
  sum:array[1..30,1..26] of longint;
  r,c,gk,kx,ky,avx,avy,n,i,j,k,l,m,ans:longint;
  ch:char;
  procedure spfa(i,j:longint);
    var q:array[1..780,1..2] of longint;
        f:array[1..30,1..26] of boolean;
        front,rear,k,q1,q2,tx,ty:longint;
    begin
      dist[i,j,i,j]:=0;
      fillchar(q,sizeof(q),0);
      q[1,1]:=i;
      q[1,2]:=j;
      fillchar(f,sizeof(f),true);
      f[i,j]:=false;
      front:=0;
      rear:=1;
      while front<>rear do
        begin
          front:=front mod (r*c)+1;
          q1:=q[front,1];
          q2:=q[front,2];
          f[q1,q2]:=true;
          for k:=1 to 8 do
            begin
              tx:=q1+fx[k];
              ty:=q2+fy[k];
              if (tx>=1) and (tx<=r) and (ty>=1) and (ty<=c) then
                if dist[i,j,tx,ty]>dist[i,j,q1,q2]+1 then
                  begin
                    dist[i,j,tx,ty]:=dist[i,j,q1,q2]+1;
                    if f[tx,ty] then
                      begin
                        f[tx,ty]:=false;
                        rear:=rear mod (r*c)+1;
                        q[rear,1]:=tx;
                        q[rear,2]:=ty;
                      end;
                  end;
            end;
        end;
    end;
  function max(a,b:integer):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
  function min(a,b:longint):longint;
    begin
      if a<b then exit(a) else exit(b);
    end;
Begin
  assign(input,'camelot.in'); reset(input);
  assign(output,'camelot.out'); rewrite(output);
  readln(r,c);
  read(ch);
  ky:=ord(ch)-64;
  readln(kx);
  gk:=0;
  avx:=0;
  avy:=0;
  while not(eof) do
    begin
      read(ch,n);
      inc(gk);
      g[gk,1]:=n;
      g[gk,2]:=ord(ch)-64;
      avx:=avx+g[gk,1];
      avy:=avy+g[gk,2];
      if eoln then readln else read(ch);
    end;
  if gk=0 then begin writeln(0); close(input); close(output); halt; end;
  avx:=avx div gk+1;
  avy:=avy div gk+1;
  close(input);
  fillchar(dist,sizeof(dist),$7);
  for i:=1 to r do
    for j:=1 to c do
      spfa(i,j);
  for i:=1 to r do
    for j:=1 to c do
      begin
        sum[i,j]:=0;
        for k:=1 to gk do
          sum[i,j]:=sum[i,j]+dist[i,j,g[k,1],g[k,2]];
      end;
  ans:=maxlongint;
  for i:=1 to r do
    for j:=1 to c do
      ans:=min(ans,sum[i,j]+max(abs(kx-i),abs(ky-j)));
  for m:=1 to gk do
    for i:=max(avx-3,1) to min(avx+3,r) do
      for j:=max(avy-3,1) to min(avy+3,c) do
        for k:=max(kx-3,1) to min(kx+3,r) do
          for l:=max(ky-3,1) to min(ky+3,c) do
            ans:=min(ans,dist[g[m,1],g[m,2],k,l]+max(abs(kx-k),abs(ky-l))+dist[k,l,i,j]+sum[i,j]-dist[i,j,g[m,1],g[m,2]]);
    writeln(ans);
  close(output);
End.