//TYVJ P1264
Const
  maxL=8000;
  maxW=1000;
Var
  a,f:array[0..maxL+1,0..maxW+1] of longint;
  i,j,k,l,w,ans:longint;
  function max(a,b,c:longint):longint;
    begin
      if a<b then a:=b;
      if a>c then exit(a) else exit(c);
    end;
Begin
  readln(w,l);
  filldword(a,sizeof(a)>>2,-maxlongint);
  for i:=1 to l do
    begin
      for j:=1 to w do
        read(a[i,j]);
      readln;
    end;
  for i:=1 to w do f[1,i]:=a[1,i];
  for i:=2 to l do
    for j:=1 to w do
      begin
        if (a[i,j]<0) or (max(f[i-1,j-1],f[i-1,j],f[i-1,j+1])<0) then
          begin f[i,j]:=-1; continue; end;
        f[i,j]:=a[i,j]+max(f[i-1,j-1],f[i-1,j],f[i-1,j+1]);
      end;
  for j:=1 to w do if f[l,j]>ans then ans:=f[l,j];
  writeln(ans);
End.
