Program Ural_1557;
Const
  maxN=2001;
Var
  a,b:ansistring;
  f,g:array[0..maxN,0..maxN] of longint;
  i,j,n,m:longint;
Begin
  readln(a);
  readln(b);
  n:=length(a); m:=length(b);
  for i:=0 to n do begin f[i,0]:=i; g[i,0]:=1; end;
  for j:=0 to m do begin f[0,j]:=j; g[0,j]:=1; end;
  f[0,0]:=0; g[0,0]:=1;
  for i:=1 to n do
    for j:=1 to m do
      begin
        if a[i]=b[j] then
          begin f[i,j]:=f[i-1,j-1]+1; g[i,j]:=g[i-1,j-1]; end
        else
          begin
            f[i,j]:=f[i-1,j]+1; g[i,j]:=g[i-1,j];
            if f[i,j-1]+1<f[i,j] then
              begin f[i,j]:=f[i,j-1]+1; g[i,j]:=g[i,j-1]; end
            else
              if  f[i,j-1]+1=f[i,j] then inc(g[i,j],g[i,j-1]);
          end;
        if g[i,j]>1000000007 then dec(g[i,j],1000000007);
      end;
  writeln(g[n,m]);
End.
