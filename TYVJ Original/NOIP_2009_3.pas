Program NOIP_2009_3;
Const
  maxN=1e5;
  maxM=5e5;
Var
  e1,e2,t:array[1..maxE<<1] of integer;
  p:array[1..maxN] of integer;
  a,b,s:array[1..maxN] of longint;
  n,m,i,ans,x,y,z:longint;
  procedure sort(1,m:longint);
    var 
  
  procedure make_forward_star;
    begin
      sort(1,m);
      //
    end;
    
Begin
  readln(n,m);
  for i:=1 to n do read(p[i]);
  readln;
  j:=0;
  for i:=1 to m do
    begin
      readln(x,y,z);
      inc(j);
      e1[j]:=x; e2[j]:=y;
      if z=2 then begin inc(j); e1[j]:=y; e2[j]:=x; end;
    end;
  make_forward_star;
  spfa;
  t:=e1; e1:=e2; e2:=t;
  make_forward_star;
  b:=s;
  spfa;
  for i:=1 to n do if s[i]>b[i] then ans:=s[i]-b[i];
  if ans<0 then ans:=0;
  writeln(ans);
End.