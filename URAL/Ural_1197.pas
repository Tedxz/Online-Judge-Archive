Program Ural_1197;
Var
  n,x,y,col,i,j:longint;
  a:array[1..8,1..8] of integer;
  b:array[1..20] of integer;
  ch:char;
  function check(x,y:longint):integer;
    begin
      if not ((x in [1..8]) and (y in [1..8])) then exit(0);
      exit(1);
    end;
Begin
  readln(n);
  for i:=1 to n do
    begin
      read(ch);
      x:=ord(ch)-ord('a')+1;
      readln(y);
      writeln(check(x+2,y+1)+check(x+2,y-1)+check(x-2,y+1)+check(x-2,y-1)+check(x+1,y+2)+check(x+1,y-2)+check(x-1,y+2)+check(x-1,y-2));
    end;
End.
