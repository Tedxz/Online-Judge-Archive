{
USER: Xie Zheng
TASK: milk2
LANG: PASCAL
}
Program milk2; //USACO 1.2.1
Var
  a:array[0..1000000] of boolean;
  n,h,t,i,j,ans1,ans2,min,max,tem1,tem2:longint;
Begin
  assign(input,'milk2.in'); reset(input);
  assign(output,'milk2.out'); rewrite(output);
  min:=1000000; max:=0;
  readln(n);
  for i:=1 to n do
    begin
      read(h,t);
      if min>h then min:=h;
      if max<t then max:=t;
      for j:=h to t-1 do a[j]:=true;
    end;
  tem1:=0; tem2:=0; ans1:=0; ans2:=0;
  for i:=min to max-1 do
    if a[i] then begin inc(tem1); if tem1>ans1 then ans1:=tem1; tem2:=0; end
      else begin inc(tem2); if tem2>ans2 then ans2:=tem2; tem1:=0; end;
  writeln(ans1,' ',ans2);
  close(input);
  close(output);
End.
