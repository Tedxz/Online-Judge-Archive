Program Ural_1282;
Const
  maxN=1100;
Var
  f,g:array[1..maxN] of shortint;
  anc:array[1..maxN] of integer;
  leaf:array[1..maxN] of boolean;
  n,i,j,k:longint;
  ch:char;
  function max(a,b:longint):longint;
    begin if a>b then exit(a) else exit(b); end;
  function min(a,b:longint):longint;
    begin if a<b then exit(a) else exit(b); end;
Begin
  readln(n);
  for i:=2 to n do
    begin
      read(ch);
      read(anc[i]);
      if ch='L' then
        begin
          readln(f[i]);
          g[i]:=f[i];
          leaf[i]:=true;
        end
      else
        begin
          readln;
          g[i]:=1;
          f[i]:=-1;
        end;
    end;
  for i:=2 to n do
    if leaf[i]<>0 then
      begin
        k:=i;
        while k>1 do
          begin
            f[anc[k]]:=max(f[anc[k]],g[k]);
            g[anc[k]]:=min(g[anc[k]],f[k]);
            k:=anc[k];
          end;
      end;
  writeln(f[1]);
  for i:=1 to n do writeln(i,' ',f[i],' ',g[i]);
End.
