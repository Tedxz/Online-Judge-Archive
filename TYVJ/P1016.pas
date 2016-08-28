//TYVJ P1016
Const
  maxN=30;
  maxV=20000;
Var
  a:array[1..maxN] of longint;
  v,i,n,j,max:longint;
  f:array[0..maxV] of boolean;
Begin
  readln(v); readln(n);
  for i:=1 to n do readln(a[i]);
  max:=0;
  f[0]:=true;
  for i:=1 to n do
    for j:=max downto 0 do
      begin
        if f[j] and (j+a[i]<=maxV) then f[j+a[i]]:=true;
        if (j+a[i]>max) and (j+a[i]<v) then max:=j+a[i];
      end;
  for i:=v downto 0 do
    if f[i] then begin writeln(v-i); break; end;
End.
