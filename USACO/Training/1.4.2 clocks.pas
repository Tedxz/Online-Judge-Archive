{
USER: Xie Zheng
TASK: clocks
LANG: PASCAL
}
Program clocks; //USACO 1.4.2
Const
  step:array[1..9,1..5] of integer=((1,2,4,5,0),
                                    (1,2,3,0,0),
                                    (2,3,5,6,0),
                                    (1,4,7,0,0),
                                    (2,4,5,6,8),
                                    (3,6,9,0,0),
                                    (4,5,7,8,0),
                                    (7,8,9,0,0),
                                    (5,6,8,9,0));
Var
  a,ch:array[0..9] of integer;
  sol,s:array[0..9] of integer;
  i,j:integer;
  ans:string;
  st:string;
  procedure check;
    var i,j:integer;
        t:string;
    begin
      for i:=1 to 9 do if (ch[i] and 3)<>(a[i]) then exit;
      t:='';
      for i:=1 to 9 do
        for j:=1 to (sol[i] and 3) do t:=t+chr(i+48);
      if (length(t)<length(ans)) or ((length(t)=length(ans)) and (t<ans)) then
        begin
          ans:=t;
          s:=sol;
        end;
    end;

  procedure dfs(k:integer);
    var i,j:integer;
    begin
      if k=10 then begin check; exit; end;
      for i:=0 to 3 do
        begin
          sol[k]:=i;
          dfs(k+1);
          for j:=1  to 5 do ch[step[k,j]]:=(ch[step[k,j]]+1) and 3;
        end;
    end;
Begin
  assign(input,'clocks.in'); reset(input);
  assign(output,'clocks.out'); rewrite(output);
  for i:=1 to 9 do
    begin
      read(j);
      a[i]:=j and 3;
    end;
  ans:='999999999999999999999999999';
  dfs(1);
  {for i:=1 to 9 do
    begin
      if for j:=1 to s[i] do write(i,' '); }
  
  for i:=1 to length(ans)-1 do write(ans[i],' ');
  writeln(ans[length(ans)]);
  close(input);
  close(output);
End.
