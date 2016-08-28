{
USER: Xie Zheng
TASK: milk3
LANG: PASCAL
}
Program milk3; //USACO i.4.4
Var
  v:array[0..20,0..20] of boolean;
  ans:array[0..20] of boolean;
  bk:array[1..3] of integer;
  t:array[1..3] of integer;
  i,j:integer;
  function min(a,b:integer):integer;
    begin
      if a<b then exit(a) else exit(b);
    end;

  procedure dfs(k:integer);
    var i,j,a,b,c,s:integer;
    begin
      if k=25 then exit;
      a:=t[1]; b:=t[2]; c:=t[3];
      for i:=1 to 3 do
        for j:=1 to 3 do
          if i<>j then
            begin
              s:=min(t[i],bk[j]-t[j]);
              t[i]:=t[i]-s; t[j]:=t[j]+s;
              if not v[t[1],t[2]] then
                begin
                  v[t[1],t[2]]:=true;
                  if t[1]=0 then ans[t[3]]:=true;
                  dfs(k+1);
                end;
              t[1]:=a; t[2]:=b; t[3]:=c;
            end;
    end;

Begin
  assign(input,'milk3.in'); reset(input);
  assign(output,'milk3.out'); rewrite(output);
  readln(bk[1],bk[2],bk[3]);
  t[1]:=0; t[2]:=0; t[3]:=bk[3];
  dfs(1);
  for j:=20 downto 0 do if ans[j] then break;
  for i:=0 to 20 do
    if ans[i] then
      begin
        write(i);
        if i<>j then write(' ');
      end;
  writeln;
  close(input);
  close(output);
End.
