{
USER: Xie Zheng
TASK: humble
LANG: PASCAL
}
Program humble; //USACO 3.1.3
Const
  maxN=100000;
  maxK=100;
Var
  hum:array[1..maxN+1] of longint;
  s:array[1..maxK] of longint;
  f:array[1..maxK] of longint;
  i,j,k,n,num,min,minf:longint;
Begin
  assign(input,'humble.in'); reset(input);
  assign(output,'humble.out'); rewrite(output);
  readln(k,n);
  for i:=1 to k do read(s[i]);
  close(input);
  hum[1]:=1;
  num:=1;
  filldword(f,sizeof(f)>>2,0);
  while num<n+1 do
    begin
      min:=maxlongint;
      minf:=-1;
      for i:=1 to k do
        begin
          while s[i]*hum[f[i]]<=hum[num] do inc(f[i]);
          if min>s[i]*hum[f[i]] then begin min:=s[i]*hum[f[i]]; minf:=i; end;
        end;
      inc(num); hum[num]:=min;
      inc(f[minf]);
    end;
  writeln(hum[n+1]);
  close(output);
End.
