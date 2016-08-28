//TYVJ P1055
Const
  maxN=300;
  INF=$10000000;
Var
  a:array[0..maxN] of longint;
  f,g:array[1..maxN,1..maxN] of longint;
  n,m,i,j,k,len,max_rp,min_rp:longint;
  function min(a,b:longint):longint;
    begin
      if a<b then exit(a) else exit(b);
    end;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
Begin
  readln(n,m);
  for i:=1 to n do
    begin
      read(a[i]);
      a[n+i]:=a[i];
    end;
  for i:=1 to n<<1-1 do
    begin
      f[i,i+1]:=a[i]+a[i+1]; g[i,i+1]:=f[i,i+1];
    end;
  for i:=2 to n<<1 do inc(a[i],a[i-1]);
  for len:=3 to n do
    for i:=1 to n do
      begin
       j:=i+len-1;
       f[i,j]:=INF;
       g[i,j]:=0;
       for k:=i to j-1 do
         begin
           f[i,j]:=min(f[i,j],f[i,k]+f[k+1,j]);
           g[i,j]:=max(g[i,j],g[i,k]+g[k+1,j]);
         end;
       g[i,j]:=g[i,j]-a[i-1]+a[j];
       f[i,j]:=f[i,j]-a[i-1]+a[j];
      end;
   min_rp:=INF;
   max_rp:=0;
   for i:=1 to n do
     begin
       if f[i,i-1+n]<min_rp then min_rp:=f[i,i-1+n];
       if g[i,i-1+n]>max_rp then max_rp:=g[i,i-1+n];
     end;
   if m>max_rp then writeln('It is easy')
     else if m<min_rp then writeln('I am..Sha...X')
       else writeln('I will go to play WarIII');
End.
