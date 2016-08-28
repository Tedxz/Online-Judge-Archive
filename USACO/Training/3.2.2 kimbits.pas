{
USER: Xie Zheng
TASK: kimbits
LANG: PASCAL
}
Program kimbits; //USACO 3.2.2
Var
  f:array[0..31,0..31] of dword;
  i,j,k,l,n:dword;
  function min(a,b:dword):dword;
    begin
      if a<b then exit(a) else exit(b);
    end;
Begin
  assign(input,'kimbits.in'); reset(input);
  assign(output,'kimbits.out'); rewrite(output);
  readln(n,l,k);
  close(input);
  //DP f[i,j]=f[i-1,j]+f[i-1,j-1]
  for i:=0 to n do begin f[i,0]:=1; f[0,i]:=1; end;
  for i:=1 to n do
    for j:=1 to l do
      if j<=i then f[i,j]:=f[i-1,j]+f[i-1,j-1]
        else f[i,j]:=f[i,j-1];
  for i:=n-1 downto 0 do
    if f[i,l]<k then begin write(1); dec(k,f[i,l]); l:=l-1; end
      else write(0);
  writeln;
  close(output);
End.
