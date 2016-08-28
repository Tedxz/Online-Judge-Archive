//TYVJ P1323
Const
  maxN=10000;
Var
  num,fa:array[1..maxN] of longint;
  poison:array[1..maxN] of boolean;
  dict:array['a'..'z'] of char;
  s1,s2,st:string;
  ans,i,j,k,m,n,p:longint;
  ch:char;
  function find(x:longint):longint;
    begin
      if fa[fa[x]]=fa[x] then exit(fa[x])
      else begin find:=find(fa[x]); fa[x]:=find; end;
    end;
  procedure union(x,y:longint);
    var fx,fy:longint;
    begin
      fx:=find(x);
      fy:=find(y);
      if fx<>fy then
        begin
          fa[fy]:=fx;
          inc(num[fx],num[fy]);
          poison[fx]:=poison[fx] or poison[fy];
        end;
    end;
Begin
  readln(s1); readln(s2);
  for i:=1 to 26 do
    dict[s1[i]]:=s2[i];
  readln(n,m);
  for i:=1 to n do
    begin fa[i]:=i; num[i]:=1; end;
  for i:=1 to m do
    begin
      read(k);
      readln(st);
      for j:=1 to length(st) do st[j]:=dict[st[j]];
      if pos('poison',st)<>0 then poison[k]:=true;
    end;
  readln(p);
  for i:=1 to p do
    begin
      readln(j,k);
      union(j,k);
    end;
  for i:=1 to n do
    if (i=fa[i]) and (not poison[i]) then inc(ans,num[i]);
  writeln(ans);
End.
