Program Ural_1330;
Const
  maxN=11000;
Var
  sum:array[0..maxN] of longint;
  n,q,i,l,r:longint;
Begin
  readln(n);
  for i:=1 to n do
    begin
      read(sum[i]);
      inc(sum[i],sum[i-1]);
    end;
  readln(q);
  for i:=1 to q do
    begin
      readln(l,r);
      writeln(sum[r]-sum[l-1]);
    end;
End.