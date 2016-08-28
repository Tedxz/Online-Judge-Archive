//TYVJ P1329
Const
  maxN_limN=20000;
  maxN_limL=100;
Var
  w:array[1..maxN_limN] of longint;
  len:array[1..maxN_limL] of longint;
  i,j,k,n,ans,lim:longint;
  ch:char;
  st:string;
  procedure DIY;
    begin
      writeln('DIY');
      halt;
    end;
  procedure sort(h,t:longint);
    var i,j,x,c:longint;
    begin
      i:=h; j:=t; x:=w[(h+t)>>1];
      repeat
        while x<w[j] do dec(j);
        while x>w[i] do inc(i);
        if i<=j then
          begin
            c:=w[i]; w[i]:=w[j]; w[j]:=c;
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j);
      if i<t then sort(i,t);
    end;
  procedure number_limited;
    begin
      if n<lim then DIY;
      for i:=1 to n do
        readln(w[i]);
      sort(1,n);
      ans:=0;
      for i:=1 to lim do inc(ans,w[i]);
      writeln(ans);
    end;
  procedure length_limited;
    var f:array[0..maxN_limL*10] of longint;
    begin
      if lim>maxN_limL*10 then DIY;
      for i:=1 to n do
        begin
          read(w[i]); read(ch);
          readln(st);
          len[i]:=length(st);
        end;
      filldword(f,sizeof(f)>>2,$10000000);
      f[0]:=0;
      for i:=1 to n do
        for j:=lim downto len[i] do
          if (f[j-len[i]]<$10000000) and (f[j]>f[j-len[i]]+w[i]) then f[j]:=f[j-len[i]]+w[i];
      if f[lim]=$10000000 then DIY else writeln(f[lim]);
    end;
Begin
  readln(n);
  readln(ch);
  readln(lim);
  if ch='L' then length_limited else number_limited;
End.
