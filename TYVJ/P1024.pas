//TYVJ P1024
Var
  t:array[char] of integer;
  i,j:integer;
  ch:char;
  s:string;
  procedure cal(s:string);
    var l,ans,i:integer;
        f:array[1..255] of integer;
    begin
      fillword(f,sizeof(f) shr 1,maxint);
      ans:=0;
      for i:=1 to length(s) do
        begin
          for j:=1 to ans+1 do
            if f[j]>t[s[i]] then begin f[j]:=t[s[i]]; break; end;
          if j>ans then inc(ans);
        end;
      write(ans);
    end;
Begin
  i:=0;
  while not eoln do
    begin
      inc(i);
      read(ch);
      t[ch]:=i;
    end;
  readln;
  s[0]:=chr(0);
  while not eoln do
    begin
      read(ch);
      if ch<>' ' then begin inc(s[0]); s[length(s)]:=ch; end;
      if eoln or (ch=' ') then begin cal(s); s[0]:=chr(0); end;
    end;
  writeln;
End.