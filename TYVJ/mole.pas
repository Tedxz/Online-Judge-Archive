Const
  maxN=1000;
  maxM=10000;
Var
  a:array[1..maxN,1..3] of longint;
  f:array[1..maxM] of longint;
Begin
  assign(input,'input.txt'); reset(input);
  assign(output,'output.txt'); rewrite(output);
  readln(n,m);
  for i:=1 to m do readln(a,[i,1],a[i,2],a[i,3]);
  close(input);
  for i:=m downto 1 do
    begin
      for j:=i+1 to n do
        begin
          if (abs(a[i,2]-a[j,2])+abs(a[i,3]-a[j,3])<=a[j,1]-a[i,1]) and (f[i]<=f[j]) then
            f[i]:=f[j]+1;
          if n-j+2<f[i] then break;
        end;
      if ans<f[i] then ans:=f[i];
    end;
  writeln(ans);
  close(output);
End.