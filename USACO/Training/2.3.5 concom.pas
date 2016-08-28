{
USER: Xie Zheng
TASK: concom
LANG: PASCAL
}
Program concom; //USACO 2.3.5
Const
  maxN=100;
Var
  used:array[1..maxn] of boolean;
  ctrl:array[1..maxN] of integer;
  own:array[1..maxN,1..maxn] of integer;
  i,j,k,n,m,p:integer;
  procedure dfs(k:integer);
    var i:integer;
    begin
      used[k]:=true;
      for i:=1 to m do
        begin
          inc(ctrl[i],own[k,i]);
          if (ctrl[i]>50) and (not used[i]) then dfs(i);
        end;
    end;
Begin
  assign(input,'concom.in'); reset(input);
  assign(output,'concom.out'); rewrite(output);
  readln(n);
  m:=1;
  for k:=1 to n do
    begin
      readln(i,j,p);
      inc(own[i,j],p);
      if m<i then m:=i;
      if m<j then m:=j;
    end;
  for i:=1 to m do
    begin
      fillchar(used,sizeof(used),false);
      fillchar(ctrl,sizeof(ctrl),0);
      dfs(i);
      for j:=1 to m do if (ctrl[j]>50) and (i<>j) then writeln(i,' ',j);
    end;
  close(input);
  close(output);
End.












