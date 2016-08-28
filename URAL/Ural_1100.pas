Program Ural_1100;
Const
  maxN=10000000;
  maxM=100;
Var
  a:array[0..maxN,1..2] of longint; //id next
  tail,head:array[0..maxN] of longint;
  v:array[0..maxN] of boolean;
  id,m,n,i,j:longint;
Begin
  readln(n);
  for i:=1 to n do
    begin
      readln(id,m);
      a[i,1]:=id;
      if not v[m] then
        begin
          head[m]:=i;
          tail[m]:=i;
          v[m]:=true;
        end
      else
        begin
          a[tail[m],2]:=i;
          tail[m]:=i;
        end
    end;
  for i:=100 downto 0 do
    begin
      j:=head[i];
      while j>0 do
        begin
          writeln(a[j,1],' ',i);
          j:=a[j,2];
        end;
    end;
End.
