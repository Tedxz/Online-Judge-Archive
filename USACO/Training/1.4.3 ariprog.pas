{
USER: Xie Zheng
TASK: ariprog
LANG: PASCAL
}
Program ariprog; //USACO 1.4.3
Var
  b:array[0..125000] of boolean;
  bis:array[0..80000] of longint;
  i,j,k,m,n,max,t,num:longint;
  procedure Bisquare;
    var i,j,k:longint;
    begin
      max:=2*sqr(m);
      for i:=0 to m do
        begin
          k:=sqr(i);
          for j:=0 to m do
            b[k+sqr(j)]:=true;
        end;
      j:=0;
      bis[0]:=0;
      for i:=1 to max do
        begin
          if b[i] then begin inc(j); bis[j]:=i; end;
        end;
      t:=j;
    end;
Begin
  assign(input,'ariprog.in'); reset(input);
  assign(output,'ariprog.out'); rewrite(output);
  readln(n);
  readln(m);
  Bisquare;
  num:=0;
  for j:=1 to max div (n-1)+1 do
    for i:=0 to t do
      begin
        if bis[i]+(n-1)*j>max then break;
        for k:=n-1 downto 0 do
          if not b[bis[i]+j*k] then break;
        if k=0 then
          begin
            inc(num);
            writeln(bis[i],' ',j);
          end;
      end;
  if num=0 then writeln('NONE');
  close(input);
  close(output);
End.
