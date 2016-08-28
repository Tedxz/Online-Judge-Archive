Program Ural_1060;
Const
  move:array[1..16] of word=
      (51200,58368,29184,12544,
       35968,20032,10016,04880,
       02248,01252,00626,00305,
       00140,00078,00039,00019);
Var
  q:array[1..10000] of word;
  depth:array[1..10000] of integer;
  start:word;
  i,j,ans:integer;
  ch:char;
  procedure BFS;
    var h,t:integer;
    begin
      h:=0; t:=1; q[t]:=start; depth[t]:=0;
      while h<t do
        begin
          inc(h);
          for i:=1 to 16 do
            begin
              inc(t);
              q[t]:=q[h] xor move[i];
              depth[t]:=depth[h]+1;
              for j:=t-1 downto 1 do
                if q[t]=q[j] then
                  begin
                    dec(t);
                    break;
                  end;
              if (q[t]=65535) or (q[t]=0) then
                begin ans:=depth[t]; exit; end;
            end;
        end;
    end;
Begin
  start:=0;
  for i:=1 to 4 do
    begin
      for j:=1 to 4 do
        begin
          read(ch);
          if ch='b' then start:=start or 1<<((i-1)*4+j-1);
        end;
      readln;
    end;
  if (start=65535) or (start=0) then begin writeln(0); halt; end;
  ans:=0;
  BFS;
  if ans=0 then writeln('Impossible') else writeln(ans);
End.

