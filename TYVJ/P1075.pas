//TYVJ P1075
Const
  maxN=2000;
Var
  sum:array[0..maxN] of longint;
  f:array[0..maxN,0..maxN div 4] of longint;
  n,i,j:longint;
  procedure DP(i,j:longint);
    var k:longint;
    begin
      if i<=j<<1 then f[i,j]:=sum[i];
      if (f[i,j]>0) or (i*j=0) then exit;
      DP(i,j-1);
      f[i,j]:=f[i,j-1];
      for k:=j<<1-1 to j<<1 do
        begin
          DP(i-k,k);
          if sum[i]-f[i-k,k]>f[i,j] then f[i,j]:=sum[i]-f[i-k,k];
        end;
    end;
Begin
  read(n);
  for i:=n downto 1 do read(sum[i]);
  for i:=1 to n do sum[i]:=sum[i]+sum[i-1];
  DP(n,1);
  writeln(f[n,1]);
End.
