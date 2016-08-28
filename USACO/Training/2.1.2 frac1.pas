{
USER: Xie Zheng
TASK: frac1
LANG: PASCAL
}
Program frac1; //USACO 2.1.2
Var
  a:array[1..8000,1..2] of integer;
  v:array[1..160,1..160] of boolean;
  i,j,k,n,num:integer;
  procedure qs(h,t:integer);
    var i,j,c:integer;
        x:extended;
    begin
      i:=h; j:=t; x:=a[(h+t) shr 1,1]/a[(h+t) shr 1,2];
      //if (h=3) and (t=4) then writeln('##',a[3,1],' ',a[3,2],' ',a[4,1],' ',a[4,2],' ',x);
      while i<=j do
        begin
          while x<extended(a[j,1])/extended(a[j,2]) do dec(j);
          while x>extended(a[i,1])/extended(a[i,2]) do inc(i);
          if i<=j then
            begin
              c:=a[i,1]; a[i,1]:=a[j,1]; a[j,1]:=c;
              c:=a[i,2]; a[i,2]:=a[j,2]; a[j,2]:=c;
              inc(i); dec(j);
            end;
        end;
      if h<j then qs(h,j);
      if i<t then qs(i,t);
    end;
Begin
  assign(input,'frac1.in'); reset(input);
  assign(output,'frac1.out'); rewrite(output);
  readln(n);
  writeln('0/1');
  fillchar(v,sizeof(v),true);
  num:=0;
  for i:=1 to n do
    for j:=1 to i do
      if v[i,j] then
        begin
          inc(num);
          a[num,1]:=j; a[num,2]:=i;
          k:=2;
          while i*k<=n do begin v[i*k,j*k]:=false; inc(k); end;
        end;
  qs(1,num);
  for i:=1 to num do writeln(a[i,1],'/',a[i,2]);
  close(input);
  close(output);
End.

