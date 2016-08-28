//TYVJ P1001
Var
  a:array[1..10000] of longint;
  n,i,k,ans:longint;
  f:boolean;
  procedure qs(h,t:longint);
    var i,j,x,c:longint;
    begin
      i:=h; j:=t; x:=a[(h+t) shr 1];
      while i<=j do
        begin
          while x<a[j] do dec(j);
          while x>a[i] do inc(i);
          if i<=j then
            begin
              c:=a[j]; a[j]:=a[i]; a[i]:=c;
              inc(i); dec(j);
            end;
        end;
      if i<t then qs(i,t);
      if h<j then qs(h,j);
    end;
Begin
  readln(n,k);
  for i:=1 to n do read(a[i]);
  qs(1,n);
  ans:=a[n-k+1]-a[k];
  if ans<2 then writeln('NO')
    else
      begin
        f:=true;
        for i:=2 to trunc(sqrt(ans)) do if ans mod i=0 then begin f:=false; break; end;
        if f then writeln('YES') else writeln('NO');
      end;
  writeln(ans);
End.

