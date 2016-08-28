Program Ural_1078;
Const
  maxN=510;
Type
  seg=record
    l,r,num:longint;
  end;
Var
  a:array[1..maxN] of seg;
  f:array[1..maxN] of longint;
  pre:array[1..maxN] of longint;
  i,j,ans,n:longint;
  procedure sort(h,t:longint);
    var x,i,j:longint;
        tem:seg;
    begin
      i:=h; j:=t; x:=a[(h+t)>>1].l;
      repeat
        while a[i].l>x do inc(i);
        while a[j].l<x do dec(j);
        if i<=j then
          begin
            tem:=a[i]; a[i]:=a[j]; a[j]:=tem;
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j);
      if i<t then sort(i,t);
    end;
  procedure dfs(k:longint);
    begin
      if k=0 then exit;
      dfs(pre[k]);
      write(a[k].num,' ');
    end;
Begin
  readln(n);
  if n=0 then begin writeln(0); writeln; halt; end;
  ans:=0;
  for i:=1 to n do
    begin
      readln(a[i].l,a[i].r);
      a[i].num:=i;
    end;
  sort(1,n);
  inc(n); a[n].l:=-1000001; a[n].r:=1000001; a[n].num:=n;
  filldword(f,sizeof(f)>>2,1);
  fillchar(pre,sizeof(pre),0);
  for i:=2 to n do
    for j:=i-1 downto 1 do
      begin
        if a[j].l=a[i].l then continue;
        if a[j].l>=a[i].r then break;
        if (a[j].r<a[i].r) and (f[j]>=f[i]) then
          begin f[i]:=f[j]+1; pre[i]:=j; end;
      end;
  writeln(f[n]-1);
  dfs(pre[pre[n]]);
  writeln(a[pre[n]].num);
End.
