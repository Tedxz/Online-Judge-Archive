//TYVJ P1266
Const
  maxDEP=6;
  maxSTAT=33554432;
Var
  dep:array[0..maxSTAT] of shortint;
  i,j,k,h,t,s,step:longint;
  q:array[1..500000] of longint;
  ch:char;
  procedure BFS;
    begin
      h:=0; t:=1; q[1]:=33554431; dep[q[1]]:=1;
      while h<>t do
        begin
          h:=h mod 100000+1;
          for i:=1 to 25 do
            begin
              if dep[q[h]]>maxDEP then exit;
              s:=q[h];
              s:=s xor (1<<(i-1));
              if i mod 5<>1 then s:=s xor (1<<(i-2));
              if i mod 5<>0 then s:=s xor (1<<i);
              if i>5 then s:=s xor (1<<(i-6));
              if i<21 then s:=s xor (1<<(i+4));
              if dep[s]>0 then continue;
              t:=t mod 500000+1; q[t]:=s; dep[s]:=dep[q[h]]+1;
            end;
        end;
    end;
Begin
  BFS;
  repeat
    s:=0;
    readln;
    for i:=1 to 5 do
      begin
        for j:=1 to 5 do begin read(ch); s:=s<<1; s:=(s or ord(ch='1')); end;
        readln;
      end;
    if dep[s]=0 then writeln(-1) else writeln(dep[s]-1);
  until eof;
End.

