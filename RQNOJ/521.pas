//undone
Program RQNOJ_521;  //sudoku
Const
  v:array[0..8,0..8] of integer=((6,6,6,6,6,6,6,6,6),
                                 (6,7,7,7,7,7,7,7,6),
                                 (6,7,8,8,8,8,8,7,6),
                                 (6,7,8,9,9,9,8,7,6),
                                 (6,7,8,9,10,9,8,7,6),
                                 (6,7,8,9,9,9,8,7,6),
                                 (6,7,8,8,8,8,8,7,6),
                                 (6,7,7,7,7,7,7,7,6),
                                 (6,6,6,6,6,6,6,6,6));
  m:array[1..81,1..2] of integer=((4,4),(3,3),(3,4),(3,5),(4,3),(4,5),(5,3),(5,4),(5,5),(2,2),(2,3),(2,4),(2,5),(2,6),
                                  (3,2),(3,6),(4,2),(4,6),(5,2),(5,6),(6,2),(6,3),(6,4),(6,5),(6,6),(1,1),(1,2),(1,3),
                                  (1,4),(1,5),(1,6),(1,7),(2,1),(2,7),(3,1),(3,7),(4,1),
                                  (4,7),(5,1),(5,7),(6,1),(6,7),(7,1),(7,2),(7,3),(7,4),(7,5),(7,6),(7,7),
                                  (0,0),(0,1),(0,2),(0,3),(0,4),(0,5),(0,6),(0,7),(0,8),(1,0),(1,8),
                                  (2,0),(2,8),(3,0),(3,8),(4,0),(4,8),(5,0),(5,8),(6,0),(6,8),(7,0),(7,8),
                                  (8,0),(8,1),(8,2),(8,3),(8,4),(8,5),(8,6),(8,7),(8,8));
Var
  a:array[0..8,0..8] of integer;
  i,j,sum,max:integer;
  x,y,z:array[0..8,1..9] of boolean;
  function can(k,i:integer):boolean;
    begin
      if x[m[k,1],i] then exit(false);
      if y[m[k,2],i] then exit(false);
      if z[(m[k,1] div 3)*3+(m[k,2] div 3),i] then exit(false);
      exit(true);
    end;
  procedure score;
    begin
      sum:=0;
      for i:=0 to 8 do
        for j:=0 to 8 do
          sum:=sum+a[i,j]*v[i,j];
      if max<sum then max:=sum;
    end;
  procedure dfs(k:integer);
    var i:integer;
    begin
      if k=82 then begin score; exit; end;
      if a[m[k,1],m[k,2]]>0 then begin dfs(k+1); exit; end;
      for i:=9 downto 1 do
        if can(k,i) then
          begin
            a[m[k,1],m[k,2]]:=i;
            x[m[k,1],i]:=true;
            y[m[k,2],i]:=true;
            z[(m[k,1] div 3)*3+(m[k,2] div 3),i]:=true;
            dfs(k+1);
            a[m[k,1],m[k,2]]:=0;
            x[m[k,1],i]:=false;
            y[m[k,2],i]:=false;
            z[(m[k,1] div 3)*3+(m[k,2] div 3),i]:=false;
          end;
    end;
Begin
  fillchar(x,sizeof(x),0);
  fillchar(y,sizeof(y),0);
  fillchar(z,sizeof(z),0);
  for i:=0 to 8 do
    for j:=0 to 8 do
      begin
        read(a[i,j]);
        if a[i,j]=0 then continue;
        x[i,a[i,j]]:=true;
        y[j,a[i,j]]:=true;
        z[(i div 3)*3+(j div 3),a[i,j]]:=true;
      end;
  max:=-1;
  dfs(1);
  writeln(max);
End.
