//TYVJ P1007
Const
  maxN=1000;
Var
  f:array[boolean,1..maxN,boolean] of integer;
  m,n,k,l,d,i,j,x1,x2,y1,y2:integer;
  function min(a,b:integer):integer;
    begin
      if a<b then exit(a) else exit(b);
    end;
  procedure sort(h,t:integer; b1,b2:boolean);
    var i,j,x,c:integer;
    begin
      i:=h; j:=t; x:=f[b1,(h+t)>>1,b2];
      repeat
        while x>f[b1,j,b2] do dec(j);
        while f[b1,i,b2]>x do inc(i);
        if i<=j then
          begin
            c:=f[b1,i,true]; f[b1,i,true]:=f[b1,j,true]; f[b1,j,true]:=c;
            c:=f[b1,i,false]; f[b1,i,false]:=f[b1,j,false]; f[b1,j,false]:=c;
            inc(i); dec(j);
          end;
      until i>j;
      if h<j then sort(h,j,b1,b2);
      if i<t then sort(i,t,b1,b2);
    end;
Begin
  readln(m,n,k,l,d);
  for i:=1 to m do f[true,i,false]:=i;
  for j:=1 to n do f[false,j,false]:=j;
  for i:=1 to d do
    begin
      readln(x1,y1,x2,y2);
      if x1=x2 then inc(f[false,min(y1,y2),true])
        else inc(f[true,min(x1,x2),true]);
    end;
  sort(1,m,true,true);
  sort(1,n,false,true);
  sort(1,k,true,false);
  sort(1,l,false,false);
  for i:=k downto 2 do write(f[true,i,false],' ');
  writeln(f[true,1,false]);
  for j:=l downto 2 do write(f[false,j,false],' ');
  writeln(f[false,1,false]);
end.
