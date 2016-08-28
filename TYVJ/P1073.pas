//TYVJ P1073
Var
  a:array[1..30] of integer;
  f,r:array[1..30,0..30] of longint;
  n,i,j,l,s:longint;
  procedure inord(i,l:longint);
    var rt:longint;
    begin
      rt:=r[i,l];
      write(rt,' ');
      if rt-i>0 then inord(i,rt-i);
      if i+l-rt-1>0 then inord(rt+1,i+l-rt-1);      //i to rt-1      rt+1 to i+l-1
    end;
Begin
  readln(n);
  for i:=1 to n do read(a[i]);
  for i:=1 to 30 do f[i,0]:=1;
  for i:=1 to n do begin f[i,1]:=a[i]; r[i,1]:=i; end;
  for i:=1 to n-1 do begin f[i,2]:=a[i]+a[i+1]; r[i,2]:=i; end;
  for l:=3 to n do
    for i:=1 to n-l+1 do
      begin
        f[i,l]:=0;
        for j:=i+1 to i+l-1 do
          begin
            s:=f[i,j-i]*f[j+1,i+l-1-j]+a[j];
            if s>f[i,l] then begin f[i,l]:=s; r[i,l]:=j; end;
          end;
      end;
  writeln(f[1,n]);
  inord(1,n);
End.