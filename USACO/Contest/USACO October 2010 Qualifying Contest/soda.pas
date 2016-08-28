{
USER: Xie Zheng
TASK: soda
LANG: PASCAL
}
Program soda; //USACO October 2010 Gold Qualifying Contest
Const
  maxN=50000;
Var
  a:array[1..maxN,boolean] of longint;
  f:array[1..maxN] of boolean;
  i,j,ans,tem,h1,h2,t1,t2,n:longint;
  b:boolean;
  procedure sort(h,t:longint; b:boolean);
    var i,j,x,c:longint;
    begin
      i:=h; j:=t; x:=a[(h+t)>>1,b];
      repeat
        while x<a[j,b] do dec(j);
        while x>a[i,b] do inc(i);
        if i<=j then
          begin
            c:=a[i,b]; a[i,b]:=a[j,b]; a[j,b]:=c;
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j,b);
      if i<t then sort(i,t,b);
    end;
Begin
  assign(input,'soda.in'); reset(input);
  assign(output,'soda.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      readln(a[i,true],a[i,false]);
    end;
  close(input);
  sort(1,n,true);
  sort(1,n,false);
  j:=0;
  for i:=1 to n do
    begin
      //inc(tem);
      while a[j+1,false]<a[i,true] do inc(j);
      if i-j>ans then ans:=i-j;
    end;
  writeln(ans);
  close(output);
End.
