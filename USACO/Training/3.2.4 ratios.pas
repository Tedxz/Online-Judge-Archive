{
USER: Xie Zheng
TASK: ratios
LANG: PASCAL
}
Program ratios; //USACO 3.2.4
Var
  g:array[1..3] of word;
  mix:array[1..3,1..3] of dword;
  i,j:dword;
  function check(i,j,k:dword):boolean;
    var a,b,c,t:dword;
    begin
      a:=mix[1,1]*i+mix[2,1]*j+mix[3,1]*k;
      if not(a+g[1]=0) and ((g[1]=0) or (a mod g[1]>0)) then exit(false);

      b:=mix[1,2]*i+mix[2,2]*j+mix[3,2]*k;
      if not(b+g[2]=0) and ((g[2]=0) or (b mod g[2]>0)) then exit(false);


      c:=mix[1,3]*i+mix[2,3]*j+mix[3,3]*k;
      if not(c+g[3]=0) and ((g[3]=0) or (c mod g[3]>0)) then exit(false);

      if g[1]>0 then t:=a div g[1] else t:=b div g[2];
      if (g[1]*t=a) and (g[2]*t=b) and (g[3]*t=c) then
        begin writeln(i,' ',j,' ',k,' ',t); exit(true); end
        else exit(false);
    end;
  procedure work;
    var i,j,tot:dword;
    begin
      for tot:=3 to 300 do
        for i:=0 to tot do
          for j:=0 to tot-i do
            if check(i,j,tot-i-j) then exit;
      writeln('NONE');
    end;
Begin
  assign(input,'ratios.in'); reset(input);
  assign(output,'ratios.out'); rewrite(output);
  readln(g[1],g[2],g[3]);
  for i:=1 to 3 do
    for j:=1 to 3 do read(mix[i,j]);
  close(input);
  work;
  close(output);
End.
