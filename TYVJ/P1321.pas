//TYVJ P1321
Const
  maxN=10000;
  maxM=30000;
Var
  peach,head,last:array[1..maxN] of longint;
  e:array[1..maxM,1..3] of longint;
  q:array[1..maxN] of longint;
  v:array[1..maxN] of boolean;
  i,j,k,m,n,h,t,l,r,mid:longint;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
  function SPFA(lim:longint):boolean;
    begin
      h:=0; t:=1; q[1]:=1;
      v[1]:=true;
      filldword(last,sizeof(last)>>2,$10000000);
      last[1]:=peach[1];
      while h<>t do
        begin
          h:=h mod maxN+1;
          v[q[h]]:=false;
          k:=head[q[h]];
          while k>0 do
            begin
              if max(last[q[h]]-e[k,2],0)+peach[e[k,1]]<=lim then
                if max(last[q[h]]-e[k,2],0)+peach[e[k,1]]<last[e[k,1]] then
                  begin
                    last[e[k,1]]:=max(last[q[h]]-e[k,2],0)+peach[e[k,1]];
                    if not v[e[k,1]] then
                      begin t:=t mod maxN+1; q[t]:=e[k,1]; v[q[t]]:=true; end;
                  end;
              k:=e[k,3];
            end;
        end;
      if last[n]>lim then exit(false) else exit(true);
    end;
Begin
  readln(n,m);
  for i:=1 to n do read(peach[i]); readln;
  for i:=1 to m do
    begin
      readln(j,e[i,1],e[i,2]);
      e[i,3]:=head[j]; head[j]:=i;
    end;
  l:=max(peach[1],peach[n]); r:=$20000000;
  while l<r do
    begin
      mid:=(l+r)>>1;
      if SPFA(mid) then r:=mid else l:=mid+1;
    end;
  writeln(l);
End.