{
USER: Xie Zheng
TASK: sprime
LANG: PASCAL
}
Program sprime; //USACO 1.5.3
Const
  sp:array[1..83] of longint=(2,3,5,7,23,29,31,37,53,59,71,73,79,233,239,293,
                              311,313,317,373,379,593,599,719,733,739,797,2333,
                              2339,2393,2399,2939,3119,3137,3733,3739,3793,3797,
                              5939,7193,7331,7333,7393,23333,23339,23399,23993,
                              29399,31193,31379,37337,37339,37397,59393,59399,71933,
                              73331,73939,233993,239933,293999,373379,373393,593933,
                              593993,719333,739391,739393,739397,739399,2339933,2399333,
                              2939999,3733799,5939333,7393913,7393931,7393933,23399339,
                              29399999,37337999,59393339,73939133);
Var
  i:integer;
  n,m:longint;
Begin
  assign(input,'sprime.in'); reset(input);
  assign(output,'sprime.out'); rewrite(output);
  readln(n);
  m:=1;
  for i:=1 to n do
    m:=m*10;
  n:=m div 10;
  for i:=1 to 83 do
    if (sp[i]>=n) and (sp[i]<m) then
      writeln(sp[i]);
  close(input);
  close(output);
End.
