{
USER: Xie Zheng
TASK: transform
LANG: PASCAL
}
Program transform; //USACO 1.2.2
Type
  square=array[1..10,1..10] of char;
Var
  a,b,c,d,e,f:square;
  i,j,n,ans:integer;

  function trans1(k:square):square;
    var i,j:integer;
    begin
      for i:=1 to n do
        for j:=1 to n do
          trans1[j,n-i+1]:=k[i,j];
    end;

  function trans4(k:square):square;
    var i,j:integer;
    begin
      for i:=1 to n do
        for j:=1 to n do
          trans4[i,n-j+1]:=k[i,j];
    end;
  function compare(a,b:square):boolean;
    var i,j:integer;
    begin
      for i:=1 to n do
        for j:=1 to n do
          if not (a[i,j]=b[i,j]) then exit(false);
      exit(true);
    end;

Begin
  assign(input,'transform.in'); reset(input);
  assign(output,'transform.out'); rewrite(output);
  readln(n);
  for i:=1 to n do
    begin
      for j:=1 to n do
        read(a[i,j]);
      readln;
    end;
  for i:=1 to n do
    begin
      for j:=1 to n do
        read(b[i,j]);
      readln;
    end;
  close(input);
  c:=trans1(a);
  if compare(b,c) then begin writeln(1); close(output); halt; end;
  c:=trans1(c);
  if compare(b,c) then begin writeln(2); close(output); halt; end;
  c:=trans1(c);
  if compare(b,c) then begin writeln(3); close(output); halt; end;
  c:=trans4(a);
  if compare(b,c) then begin writeln(4); close(output); halt; end;
  c:=trans1(c);
  if compare(b,c) then begin writeln(5); close(output); halt; end;
  c:=trans1(c);
  if compare(b,c) then begin writeln(5); close(output); halt; end;
  c:=trans1(c);
  if compare(b,c) then begin writeln(5); close(output); halt; end;
  c:=trans4(a);
  if compare(b,a) then begin writeln(6); close(output); halt; end;
  writeln(7);
  close(output);
End.
