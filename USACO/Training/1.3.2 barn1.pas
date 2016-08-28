{
USER: Xie Zheng
TASK: barn1
LANG: PASCAL
}
Program barn1; //USACO 1.3.2
Var
  b:array[1..200] of boolean;
  a:array[1..100] of integer;
  m,s,c,i,j,max,min,ans:integer;
  procedure qs(h,t:integer);
    var i,j,x,c:integer;
    begin
      i:=h; j:=t; x:=a[(h+t) shr 1];
      while i<=j do
        begin
          while x>a[j] do dec(j);
          while x<a[i] do inc(i);
          if i<=j then
            begin
              c:=a[i]; a[i]:=a[j]; a[j]:=c;
              inc(i); dec(j);
            end;
        end;
      if h<=j then qs(h,j);
      if i<=t then qs(i,t);
    end;
Begin
  assign(input,'barn1.in'); reset(input);
  assign(output,'barn1.out'); rewrite(output);
  fillchar(a,sizeof(a),0);
  fillchar(b,sizeof(b),false);
  readln(m,s,c);
  max:=0; min:=maxint;
  for i:=1 to c do
    begin read(j); b[j]:=true; if min>j then min:=j; if max<j then max:=j; end;
  j:=1;
  for i:=min to max do
    if not b[i] then inc(a[j])
      else if a[j]>0 then inc(j);
  qs(1,j);
  ans:=max-min+1;
  for i:=1 to m-1 do
    dec(ans,a[i]);
  writeln(ans);
  writeln(max,' ',min);
  close(input);
  close(output);
End.