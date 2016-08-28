Program Ural_1126;
Const
  maxM=14000;
  maxN=25010;
Var
  post,a:array[0..maxN] of longint;
  m,i,j,n,p:longint;
Begin
  readln(m);
  n:=0;
  repeat
    inc(n);
    read(a[n]);
  until a[n]=-1;
  dec(n);
  a[n+1]:=maxlongint;
  post[n]:=n+1;
  for i:=n-1 downto 1 do
    begin
      post[i]:=i+1;
      while a[post[i]]<a[i] do post[i]:=post[post[i]];
    end;
  p:=1;
  for i:=1 to n-m+1 do
    begin
      if p<i then inc(p);
      while post[p]<i+m do p:=post[p];
      writeln(a[p]);
    end;
End.
