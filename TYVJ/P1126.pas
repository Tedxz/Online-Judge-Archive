//TYVJ P1126
Const
  maxH=9999;
  maxN=1000;
Var
  f:array[0..10,0..maxH] of longint;
  i,j,k,h,n:longint;
  function min(a,b:longint):longint;
    begin
      if a<b then exit(a) else exit(b);
    end;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
  function DP:longint;
    begin
      if h+1<=(1<<n) then exit(round(ln(h)/ln(2)+0.5));
      if n>round(ln(h)/ln(2)+0.5) then n:=round(ln(h)/ln(2)+0.5);
      for j:=1 to h do f[1,j]:=j;
      for i:=1 to n do f[i,0]:=0;
      for i:=2 to n do
        for j:=1 to h do
          begin
            if j+1<=(1<<i-1) then
              begin f[i,j]:=round(ln(j+1)/ln(2)+0.5); continue; end;
            f[i,j]:=$1000000;
            for k:=1 to j do
              f[i,j]:=min(f[i,j],max(f[i-1,k-1],f[i,j-k])+1);
          end;
      exit(f[n,h]);
    end;
Begin
  readln(n,h);
  writeln(DP);
End.
