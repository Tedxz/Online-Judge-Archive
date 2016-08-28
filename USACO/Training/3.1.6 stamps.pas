{
USER: Xie Zheng
TASK: stamps
LANG: PASCAL
}
Program stamps; //USACO 3.1.6
Const
  maxN=50;
  maxK=200;
  maxV=10000;
Var
  v:array[1..maxN] of word;
  f:array[0..maxV*maxK] of byte;
  i,j,n,k:dword;
  procedure sort;
    var i,j,t:integer;
    begin
      for i:=1 to n do
        for j:=1 to n-i do
          if v[j]>v[j+1] then
            begin t:=v[j]; v[j]:=v[j+1]; v[j+1]:=t; end;
    end;
Begin
  assign(input,'stamps.in'); reset(input);
  assign(output,'stamps.out'); rewrite(output);
  readln(k,n);
  for i:=1 to n do read(v[i]);
  close(input);
  sort;
  fillchar(f,sizeof(f),$E0);
  f[0]:=0;
  for i:=1 to v[n]*k+1 do
    begin
      for j:=1 to n do
        begin
          if v[j]=i then begin f[i]:=1; break; end;
          if v[j]>i then break;
          if f[i-v[j]]+1<f[i] then f[i]:=f[i-v[j]]+1;
        end;
      if f[i]>k then begin writeln(i-1); break; end;
    end;
  close(output);
End.
