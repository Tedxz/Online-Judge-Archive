{
USER: Xie Zheng
TASK: fence
LANG: PASCAL
}
Program fence; //USACO 3.3.1
Const
  maxE=2014;
  maxV=500;
Var
  ans:array[1..maxE+1] of word;
  num,i,j,k,n,start,min,max:dword;
  e:array[1..maxV,1..maxV] of dword;
  deg:array[1..maxV] of word;
  procedure DFS(k:word);
    var i:word;
    begin
      for i:=min to max do
        if e[k,i]>0 then
          begin
            dec(e[k,i]); dec(e[i,k]);
            DFS(i);
          end;
      inc(num);
      ans[num]:=k;
    end;
  procedure print;
    var i:word;
    begin
      for i:=num downto 1 do writeln(ans[i]);
    end;
Begin
  assign(input,'fence.in'); reset(input);
  assign(output,'fence.out'); rewrite(output);
  readln(n);
  min:=500; max:=1;
  for i:=1 to n do
    begin
      readln(j,k);
      if min>j then min:=j; if min>k then min:=k;
      if max<j then max:=j; if max<k then max:=k;
      inc(e[j,k]); inc(e[k,j]);
      inc(deg[j]); dec(deg[k]);
    end;
  close(input);
  start:=min;
  for i:=min to max do
    if deg[i] and 1=1 then begin start:=i; break; end;
  num:=0;
  DFS(start);
  print;
  close(output);
End.


