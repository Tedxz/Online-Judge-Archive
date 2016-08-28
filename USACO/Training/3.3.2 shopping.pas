{
USER: Xie Zheng
TASK: shopping
LANG: PASCAL
}
Program shopping; //USACO 3.3.2
Var
  name:array[1..999] of word;
  a:array[1..5] of word;
  sale:array[1..104,0..5] of word;
  s,b:word;
  n,c,k,p,i,j,t:integer;
  function min(a,b:integer):integer;
    begin
      if a<b then exit(a) else exit(b);
    end;
  procedure DP;
    var f:array[0..5,0..5,0..5,0..5,0..5] of word;
        i,j,k,l,m,n:integer;
    begin
      f[0,0,0,0,0]:=0;
      for i:=0 to a[1] do
        for j:=0 to a[2] do
          for k:=0 to a[3] do
            for l:=0 to a[4] do
              for m:=0 to a[5] do
                if i+j+k+l+m<>0 then
                  begin
                    f[i,j,k,l,m]:=maxint;
                    for n:=1 to s+b do
                      if (i>=sale[n,1]) and (j>=sale[n,2]) and (k>=sale[n,3]) and (l>=sale[n,4]) and (m>=sale[n,5]) then
                        f[i,j,k,l,m]:=min(f[i,j,k,l,m],f[i-sale[n,1],j-sale[n,2],k-sale[n,3],l-sale[n,4],m-sale[n,5]]+sale[n,0]);
                  end;
      writeln(f[a[1],a[2],a[3],a[4],a[5]]);
    end;
begin
  assign(input,'shopping.in'); reset(input);
  assign(output,'shopping.out'); rewrite(output);
  //fillchar(name,sizeof(name),0);
  //fillchar(sale,sizeof(sale),0);
  t:=0;
  readln(s);
  for i:=1 to s do
    begin
      read(n);
      for j:=1 to n do
        begin
          read(c,k);
          if name[c]=0 then begin t:=t+1; name[c]:=t; end;
          sale[i,name[c]]:=k;
        end;
      readln(sale[i,0]);
    end;
  readln(b);
  for i:=1 to b do
    begin
      readln(c,a[i],p);
      if name[c]=0 then begin t:=t+1; name[c]:=t; end;
      sale[s+i,name[c]]:=1;
      sale[s+i,0]:=p;
    end;
  close(input);
  DP;
  close(output);
end.
