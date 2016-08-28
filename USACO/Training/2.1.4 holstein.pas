{
USER: Xie Zheng
TASK: holstein
LANG: PASCAL
}
Program hostein; //USACO 2.1.3
Const
  bin:array[1..15] of integer=(1,3,7,15,31,63,127,255,511,1023,2047,4095,8191,16383,32767);
Var
  m,n,i,j,k,ans,s,sum:integer;
  a,v:array[1..25] of integer;
  g:array[1..15,1..25] of integer;
  can:boolean;
Begin
  assign(input,'holstein.in'); reset(input);
  assign(output,'holstein.out'); rewrite(output);
  readln(m);
  for i:=1 to m do
    read(v[i]);
  readln;
  readln(n);
  for i:=1 to n do
    for j:=1 to m do
      read(g[i,j]);
  ans:=25;
  for i:=1 to bin[n] do
    begin
      fillchar(a,sizeof(a),0);
      s:=0;
      for j:=1 to n do
        if ((1 shl (j-1)) and i)>0 then
          begin
            for k:=1 to m do
              inc(a[k],g[j,k]);
            inc(s);
          end;
      can:=true;
      for j:=1 to m do if a[j]<v[j] then begin can:=false; break; end;
      if can and (s<ans) then begin ans:=s; sum:=i; end;
    end;
  write(ans);
  for i:=1 to n do if ((1 shl (i-1)) and sum)>0 then write(' ',i);
  writeln;
  close(input);
  close(output);
End.





