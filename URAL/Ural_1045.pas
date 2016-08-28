Program Ural_1045;
Const
  maxN=1000;
Var
  e:array[1..maxN*2,1..2] of longint;
  i,j,k,n:longint;
  v:array[1..maxN] of boolean;
  ans:longint;
  win:boolean;

  procedure sort(h,t:longint);
    var i,j,x,c:longint;
    begin
      i:=h; j:=t; x:=e[(h+t)>>1,1];
      repeat
        while x>e[i,1] do inc(i);
        while x<e[j,1] do dec(j);
        if i<=j then
          begin
            c:=e[i,1]; e[i,1]:=e[j,1]; e[j,1]:=c;
            c:=e[i,2]; e[i,2]:=e[j,2]; e[j,2]:=c;
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j);
      if i<t then sort(i,t);
    end;
  function find(k:longint):longint;
    var l,r,m:longint;
    begin
      l:=1; r:=n<<1-2;
      repeat
        m:=(l+r)>>1;
        if e[m,1]<k then l:=m+1 else r:=m;
      until l=r;
      exit(l);
    end;
  function dfs(t:longint):boolean;
    var flag:boolean;
        i:longint;
    begin
      v[t]:=true;
      flag:=false;
      i:=find(t);
      while e[i,1]=t do
        begin
          if v[e[i,2]] then
            begin inc(i); continue; end;
          if not dfs(e[i,2]) then
            begin
              flag:=true;
              if k=t then
                begin
                  win:=true;
                  //writeln(i,' ',e[i,1],' ',e[i,2]);
                  if ans>e[i,2] then ans:=e[i,2];
                end;
            end;
          inc(i);
        end;
      exit(flag);
    end;
Begin
  readln(n,k);
  for i:=1 to n-1 do
    begin
      readln(e[i,1],e[i,2]);
      e[i+n-1,1]:=e[i,2];
      e[i+n-1,2]:=e[i,1];
    end;
  sort(1,n<<1-2);
  //for i:=1 to n<<1-2 do writeln(e[i,1],' ',e[i,2]);
  win:=false;
  ans:=maxlongint;
  dfs(k);
  if win then writeln('First player wins flying to airport ',ans) else writeln('First player loses');
End.
