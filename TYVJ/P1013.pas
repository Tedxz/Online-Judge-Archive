//TYVJ P1013
Const
  maxN=100;
  maxRMB=100;
  maxRP=100;
Var
  rp,time,rmb:array[1..maxN] of integer;
  f,g:array[0..maxN,0..maxN] of integer;
  i,j,k,n,r,m:integer;
Begin
  readln(n);
  for i:=1 to n do readln(rmb[i],rp[i],time[i]);
  readln(m,r);
  for i:=1 to n do
    for j:=m downto rmb[i] do
      for k:=r downto rp[i] do
        if (f[j,k]<f[j-rmb[i],k-rp[i]]+1) or ((f[j,k]=f[j-rmb[i],k-rp[i]]+1) and (g[j,k]>g[j-rmb[i],k-rp[i]]+time[i])) then
          begin
            f[j,k]:=f[j-rmb[i],k-rp[i]]+1;
            g[j,k]:=g[j-rmb[i],k-rp[i]]+time[i];
          end;
  writeln(g[m,r]);
End