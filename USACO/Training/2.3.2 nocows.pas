{
USER: Xie Zheng
TASK: nocows
LANG: PASCAL
}
Program nocows; //USACO 2.3.2
Var
  n,k,i,j,q,x:longint;
  f:array[0..100,0..200] of qword;
Begin
  assign(input,'nocows.in'); reset(input);
  assign(output,'nocows.out'); rewrite(output);
  readln(n,k);
  if n and 1=1 then
    begin
      f[1,1]:=1;
      for i:=1 to k do //层数
        for j:=i << 1 - 1 to n do //节点数
          if (1 and j=1) then
            for x:=1 to j-2 do
              begin
                inc(f[i,j],f[i-1,x]*f[i-1,j-x-1]);
                if f[i-1,x]+f[i-1,j-x-1]=0 then continue;
                for q:=1 to i-2 do
                  inc(f[i,j],f[i-1,x]*f[q,j-x-1] << 1);
                if f[i,j]>9901000 then f[i,j]:=f[i,j] mod 9901;
              end;
      while f[k,n]<0 do inc(f[k,n],9901);
      writeln(f[k,n] mod 9901);
    end
    else writeln(0);
  close(input);
  close(output);
End.

