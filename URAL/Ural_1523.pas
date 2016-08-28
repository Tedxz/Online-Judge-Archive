Program Ural_1523;
Const
  maxN=20000;
  P=1000000000;
Var
  tree:array[1..maxN] of int64;
  f:array[boolean,1..maxN] of int64;
  i,j,k,n,m:longint;
  a:array[1..maxN] of longint;
  flag:boolean;
  ans:int64;
  function lowbit(k:longint):longint;
    begin exit(k and -k); end;
  function sum(pos:longint):int64;
    var tem:int64;
    begin
      tem:=0;
      repeat
        inc(tem,tree[pos]);
        dec(pos,lowbit(pos));
      until pos<=0;
      exit(tem);
    end;
  procedure modify(pos:longint; key:int64);
    begin
      repeat
        inc(tree[pos],key);
        inc(pos,lowbit(pos));
      until pos>n;
    end;
Begin
  readln(n,k);
  flag:=true;
  for i:=1 to n do f[true,i]:=1;
  for i:=n downto 1 do read(a[i]);
  for i:=1 to k-1 do
    begin
      filldword(tree,sizeof(tree)>>2,0);
      flag:=not flag;
      for j:=1 to n do
        begin
          f[flag,j]:=sum(a[j]) mod P;
          modify(a[j],f[not flag,j]);
        end;
    end;
  for i:=1 to n do ans:=(ans+f[flag,i]) mod P;
  writeln(ans);
End.

