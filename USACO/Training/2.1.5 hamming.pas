{
USER: Xie Zheng
TASK: hamming
LANG: PASCAL
}
Program hamming; //USACO 2.1.4
Var
  a:array[1..64] of integer;
  n,b,d,i,k,j:integer;
  function popcount(x:integer):integer;
    begin
      x:=(x and $55555555)+((x>>1) and $55555555);
      x:=(x and $33333333)+((x>>2) and $33333333);
      x:=(x and $0F0F0F0F)+((x>>4) and $0F0F0F0F);
      exit(x);
    end;
  procedure dfs(num,k:integer);
    var i,j,t:integer;
        can:boolean;
    begin
      if num=n+1 then exit;
      for i:=k to 1 shl b do
        begin
          can:=true;
          for j:=1 to num-1 do
            begin
              t:=i xor a[j];
              if popcount(t)<d then begin can:=false; break; end;
            end;
          if can then
            begin a[num]:=i; dfs(num+1,i+1); exit; end;
        end;
    end;
Begin
  assign(input,'hamming.in'); reset(input);
  assign(output,'hamming.out'); rewrite(output);
  readln(n,b,d);
  a[1]:=0;
  dfs(2,1);
  for i:=1 to n do
    begin
      write(a[i]);
      if i<>n then if (i mod 10=0) then writeln else write(' ');
    end;
  writeln;
  close(input);
  close(output);
End.

