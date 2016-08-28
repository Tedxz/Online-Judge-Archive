{
USER: Xie Zheng
TASK: lamps
LANG: PASCAL
}
Program lamps; //USACO 2.2.4
Const
  stat:array[1..8] of byte=(0{1},14{34},21{2},27{4},36{14},42{3},49{24},63{0});
  psb:array[0..3] of byte=(1{00000001},180{10110100},239{11101111},255{11111111});
Var
  i,j,c,n,x:longint;
  on_l,off_l,can:byte;
  flag:boolean;
Begin
  assign(input,'lamps.in'); reset(input);
  assign(output,'lamps.out'); rewrite(output);
  readln(n,c);
  if c<4 then can:=psb[c] else can:=psb[3];
  on_l:=0; off_l:=0;
  while true do
    begin
      read(x);
      if x=-1 then break;
      on_l:=on_l or (1 << (5-((x-1) mod 6)));
    end;
  while true do
    begin
      read(x);
      if x=-1 then break;
      off_l:=off_l or (1 << (5-((x-1) mod 6)));
    end;
  flag:=true;
  if on_l and off_l=0 then
    for i:=1 to 8 do
      if ((can >> (8-i)) and 1=1) and (stat[i] and on_l=on_l) and (stat[i] and off_l=0) then
        begin
          for j:=1 to n do
            write((stat[i] >> (5-((j-1) mod 6))) and 1);
          writeln;
          flag:=false;
        end;
  if flag then writeln('IMPOSSIBLE');
  close(input);
  close(output);
End.
