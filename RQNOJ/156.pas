Program RQNOJ_156;
Var
  a,f:array[1..10000] of integer;
  i,j,max,n,k,l,r,m:integer;
Begin
  readln(n);
  max:=1;
  for i:=2 to n do f[i]:=maxint;
  read(f[1]);
  for i:=2 to n do
    begin
      read(k);
      l:=1; r:=max+1;
      while l<r do
        begin
          m:=(l+r) shr 1;
          if f[m]<k then l:=m+1
          else if f[m]>k then r:=m
               else begin l:=m; r:=m; end;
        end;
      f[r]:=k;
      if max<r then max:=r;
    end;
  writeln(max);
End.
