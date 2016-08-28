//TYVJ P1286
Uses math;
Const
  maxN=20010;
Var
  l,r:array[1..maxN] of longint;
  i,ans,s,t,n,len:longint;
  procedure swap(var a,b:longint);
    var t:longint;
    begin t:=a; a:=b; b:=t; end;
  procedure sort(h,t:longint);
    var i,j,x:longint;
    begin
      i:=h; j:=t; x:=l[(h+t)>>1];
      repeat
        while l[i]<x do inc(i);
        while l[j]>x do dec(j);
        if i<=j then
          begin
            swap(l[i],l[j]);
            swap(r[i],r[j]);
            inc(i); dec(j);
          end;
      until i>j;
      if i<t then sort(i,t);
      if h<j then sort(h,j);
    end;
Begin
  readln(len,n);
  for i:=1 to n do
    begin
     readln(l[i],r[i]);
     if l[i]>r[i] then swap(l[i],r[i]);
    end;
  sort(1,n);
  inc(n); l[n]:=1000000010; r[n]:=l[n]-1;
  ans:=len+1;
  s:=l[1]; t:=r[1];
  for i:=2 to n do
    if l[i]<=t then t:=max(r[i],t)
    else
      begin
        ans:=ans-t+s-1;
        s:=l[i]; t:=r[i];
      end;
  writeln(ans);
End.
