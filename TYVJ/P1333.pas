//TYVJ P1333
Const
  maxN=100;
  maxT=1000;
Var
  ta,tc:array[1..maxN] of longint;
  f:array[0..maxT,0..maxT] of longint;
  n,i,j,ans,k,t,time,tem:longint;
  function max(a,b:longint):longint;
    begin if a>b then exit(a) else exit(b); end;
Begin
  readln(n,t);
  for i:=1 to n  do readln(ta[i],tc[i]);
  filldword(f,sizeof(f)>>2,0);
  ans:=-1; time:=0;
  for k:=1 to n do
    begin
      if ta[k]*tc[k]=0 then begin inc(tem); continue; end;
      for i:=t downto 0 do
        for j:=t downto 0 do
          begin
            if (i-ta[k]>=0) and (f[i-ta[k],j]+1>f[i,j]) then f[i,j]:=f[i-ta[k],j]+1;
            if (j-tc[k]>=0) and (f[i,j-tc[k]]+1>f[i,j]) then f[i,j]:=f[i,j-tc[k]]+1;
            if (f[i,j]>ans) or ((f[i,j]=ans) and (time>max(i,j))) then
              begin ans:=f[i,j]; time:=max(i,j); end;
          end;
    end;
  if ans+tem<=0 then writeln(-1) else writeln(ans+tem);
  if ans>0 then writeln(time);
End.
