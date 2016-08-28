{
USER: Xie Zheng
TASK: prefix
LANG: PASCAL
}
Program prefix; //USACO 2.3.1
Const
  maxLen=200000;
  maxN=200;
Var
  HT:array[0..4326] of boolean;
  s:ansistring;
  st:string;
  f:array[0..maxLen+1] of boolean;
  i,j,len,n:longint;
  p:array[1..maxN] of string;
  function hash(s:string):qword;
    var i:integer;
    begin
      hash:=0;
      for i:=1 to length(s) do
        hash:=(hash*29+ord(s[i])-64);
      hash:=hash mod 4327;
    end;
  procedure init;
    var ch:char;
    begin
      i:=1;
      read(ch);
      while ch<>'.' do
        begin
          if ch in ['A'..'Z'] then p[i]:=p[i]+ch
            else begin HT[hash(p[i])]:=true; inc(i); end;
          if eoln then
            begin
              readln;
              if ord(p[i][0])>0 then begin HT[hash(p[i])]:=true; inc(i); end;
            end;
          read(ch);
        end;
      n:=i-1;
      readln;
    end;
Begin
  assign(input,'prefix.in'); reset(input);
  assign(output,'prefix.out'); rewrite(output);
  init;
  while not eof do
    begin
      readln(st);
      s:=s+st;
  end;
  len:=length(s);
  f[0]:=true;
  for i:=1 to len do
    begin
      for j:=i-1 downto i-10 do
        if (j>=0) and f[j] then
          if HT[hash(copy(s,j+1,i-j))] then
            begin f[i]:=true; break; end;
    end;
  for i:=len downto 0 do if f[i] then begin writeln(i); break; end;
  close(input);
  close(output);
End.
