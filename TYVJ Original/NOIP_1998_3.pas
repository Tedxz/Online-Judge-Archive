Program NOIP_1998_3;
Type
  node=record
    ch:char;
    num:integer;
  end;
Var
  t:array[1..9,1..9] of string[4];
  i,j,k,n,ans:integer;
  ch:char;
  s:string;
  f:array[1..9] of node;
  procedure sort(h,t:integer);
    var i,j,x:integer;
        c:node;
    begin
      i:=h; j:=t; x:=f[(i+j)>>1].num;
      while i<=j do
        begin
          while f[j].num>x do dec(j);
          while f[i].num<x do inc(i);
          if i<=j then
            begin
              c:=f[i]; f[i]:=f[j]; f[j]:=c;
              inc(i); dec(j);
            end;
        end;
      if i<t then sort(i,t);
      if h<j then sort(h,j);
    end;
Begin
  readln(n);
  for i:=1 to n do
    begin
      readln(s);
      k:=1;
      for j:=1 to length(s) do
        if s[j]=' ' then inc(k)
          else t[i,k]:=t[i,k]+s[j];
    end;
  ans:=0;
  for i:=2 to n do
    if length(t[1,i])=1 then
      begin
        inc(ans);
        f[ans].ch:=t[1,i,1];
        f[ans].num:=0;
      end;
  for i:=2 to n do
    for j:=2 to n do
      if length(t[i,j])=1 then
        for k:=1 to ans do if f[k].ch=t[i,j] then begin inc(f[k].num); break; end;
  sort(1,ans);
  for i:=1 to ans do
    write(f[i].ch,'=',f[i].num-1,' ');
  writeln(ans);
End.
