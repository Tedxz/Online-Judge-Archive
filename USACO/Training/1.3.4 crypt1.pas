{
USER: Xie Zheng
TASK: crypt1
LANG: PASCAL
}
Program crypt1; //USACO 1.3.4
Var
  n,i,j,ans:integer;
  a:array[0..9] of boolean;
  sol:array[1..5] of integer;

  function chk(k,b:longint):boolean;
    var i:integer;
    begin
      for i:=1 to b do
        begin
          if (not a[k mod 10]) then exit(false);
          k:=k div 10;
        end;
      if k>0 then exit(false);
      exit(true);
    end;
  function check:boolean;
    var a,b:integer;
    begin
      //for a:=1 to 5 do write(sol[a]); writeln;
      a:=sol[1]*100+sol[2]*10+sol[3]; b:=sol[4]*10+sol[5];
      check:=chk(a*sol[4],3) and chk(a*sol[5],3) and chk(a*b,4);
    end;
  procedure dfs(k:integer);
    var i:integer;
    begin
      if k=6 then begin if check then inc(ans); exit; end;
      for i:=1 to 9 do
        if a[i] then begin sol[k]:=i; dfs(k+1); end;
    end;
Begin
  assign(input,'crypt1.in'); reset(input);
  assign(output,'crypt1.out'); rewrite(output);
  readln(n);
  for i:=1 to n do begin read(j); a[j]:=true; end;
  ans:=0;
  dfs(1);
  writeln(ans);
  close(input);
  close(output);
End.

