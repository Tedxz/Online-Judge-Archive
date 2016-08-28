//TYVJ P1038
Uses math;
Const
  maxN=1<<17;
  maxM=100000;
Var
  tree:array[1..maxN*2] of longint;
  i,j,n,m,p,num,x,y:longint;
  flag:boolean;
  procedure modify(pos,key:longint);
    var p:longint;
    begin
      p:=pos+num-1;
      tree[p]:=key;
      while p>1 do
        begin
          p:=p>>1;
          tree[p]:=min(tree[p<<1],tree[p<<1+1]);
        end;
    end;
  function quary(l,r:longint):longint;
    var ans:longint;
    begin
      ans:=$1000000;
      quary:=$1000000;
      dec(l); inc(r);
      inc(l,num-1); inc(r,num-1);
      repeat
        if l and 1=0 then quary:=min(quary,tree[l+1]);
        if r and 1=1 then quary:=min(quary,tree[r-1]);
        l:=l>>1; r:=r>>1;
      until l xor r=1;
    end;
Begin
  readln(n,m);     //num,quary
  filldword(tree,sizeof(tree)>>2,$1000000);
  num:=2<<trunc(log2(n+2){+0.5});
  for i:=2 to n+1 do
    begin
      read(x);
      modify(i,x);
    end;
  flag:=false;
  for i:=1 to m do
    begin
      readln(x,y);
      if flag then write(' ');
      write(quary(x+1,y+1));
      flag:=true;
    end;
  writeln;
End.
