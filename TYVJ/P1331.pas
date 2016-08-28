//TYVJ P1331
Const
  maxN=40000;
Type
  edge=record
    goal,num,delta,next:longint;
  end;
Var
  head:array[1..maxN] of longint;
  e:array[1..maxN*2] of edge;
  v:array[1..maxN] of boolean;
  n,i,j,k,tem:longint;
  procedure sort(h,t:longint);
    var i,j,x,y:longint;
        tem:edge;
    begin
      i:=h; j:=t; x:=e[(h+t)>>1].delta; y:=e[(h+t)>>1].num;
      repeat
        while (x<e[j].delta) or ((x=e[j].delta) and (y<e[j].num)) do dec(j);
        while (x>e[i].delta) or ((x=e[i].delta) and (y>e[i].num)) do inc(i);
        if i<=j then
          begin
            tem:=e[i]; e[i]:=e[j]; e[j]:=tem;
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j);
      if i<t then sort(i,t);
    end;
  function dfs(k:longint):longint;
    var p:longint;
    begin
      v[k]:=true;
      if head[k]=0 then exit(1);
      dfs:=1;
      p:=head[k];
      while p<>0 do
        begin
          if not v[e[p].goal] then
            begin
              e[p].delta:=dfs(e[p].goal);
              dfs:=dfs+e[p].delta;
              e[p].delta:=abs(n-e[p].delta<<1);
            end;
          p:=e[p].next;
        end;
    end;
Begin
  readln(n);
  for i:=1 to n-1 do
    begin
      readln(j,k); //i<<1-1  i<<1
      with e[i<<1-1] do
        begin goal:=k; num:=i; next:=head[j]; head[j]:=i<<1-1; delta:=$10000000 end;
      with e[i<<1] do
        begin goal:=j; num:=i; next:=head[k]; head[k]:=i<<1; delta:=$10000000 end;
    end;
  tem:=dfs(1);
  sort(1,n<<1-2);
  writeln(e[1].num);
  for i:=2 to n-1 do
    if e[i].delta=e[i-1].delta then writeln(e[i].num) else break;
End.