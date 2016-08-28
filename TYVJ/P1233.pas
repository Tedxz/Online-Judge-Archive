//TYVJ P1233
Const
  maxN=1000;
Var
  a,f,g:array[1..maxN] of integer;
  i,j,n,ans:integer;
  function max(a,b:integer):integer ;
    begin
      if a>b then exit(a) else exit(b);
    end;
Begin
  readln(n);
  for i:=1 to n do read(a[i]);
  if a[1]=1 then f[1]:=1 else f[1]:=0;
  for i:=2 to n do
    begin
      if i<a[i] then begin f[i]:=-1; continue; end;
      f[i]:=1; g[i]:=i-a[i];
      for j:=i-1 downto 1 do
        begin
          if f[i]>j then break;
          if (g[j]<=g[i]) and (g[j]+i-j>g[i]) then f[i]:=max(f[i],f[j]+1);
        end;
      if f[i]>ans then ans:=f[i];
    end;
  writeln(ans);
End.
