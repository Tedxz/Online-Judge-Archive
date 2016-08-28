{
USER: Xie Zheng
TASK: beads
LANG: PASCAL
}
Program beads; //USACO 1.1.4
Var
  s,st:ansistring;
  n,i,j,ans:longint;
  f,g:array[1..2000] of integer;
Begin
  assign(input,'beads.in'); reset(input);
  assign(output,'beads.out'); rewrite(output);
  readln(n);
  n:=n shl 1;
  readln(s);
  st:=s+s;
  f[1]:=1;
  for i:=2 to n do
    begin
      f[i]:=i;
      if (st[i]=st[i-1]) or (st[i]='w') then begin f[i]:=f[i-1]+1; continue; end;
      if not (st[i-1]='w') then begin f[i]:=1; continue; end;
      for j:=i-1 downto 1 do
        if not (st[j]='w') then
          begin
            if st[j]=st[i] then f[i]:=f[j]-j+i
              else f[i]:=i-j;
            break;
          end;
    end;
  g[n]:=1;
  for i:=n-1 downto 1 do
   begin
      g[i]:=n-i+1;
      if (st[i]=st[i+1]) or (st[i]='w') then begin g[i]:=g[i+1]+1; continue; end;
      if not (st[i+1]='w') then begin g[i]:=1; continue; end;
      for j:=i+1 to n do
        if not (st[j]='w') then
          begin
            if st[j]=st[i] then g[i]:=g[j]-i+j
              else g[i]:=j-i;
            break;
          end;
    end;
  for i:=1 to n-1 do if ans<f[i]+g[i+1] then ans:=f[i]+g[i+1];
  if ans>n shr 1 then ans:=n shr 1;
  writeln(ans);
End.
