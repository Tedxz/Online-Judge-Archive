{
USER: Xie Zheng
TASK: butter
LANG: PASCAL
}
Program butter; //USACO 3.2.6
Const
  maxE=1450;
  maxN=800;
Var
  e:array[1..maxN,1..maxE,1..2] of word;
  num:array[1..maxN] of word;
  cow:array[1..maxN] of word;
  i,j,k,ans,tem,min,now,n,m,c,l:dword;
  procedure SPFA;
    var q:array[1..maxN] of word;
        v:array[1..maxN] of boolean;
        d:array[1..maxN] of dword;
        h,t,i,j:dword;
    begin
      h:=0; t:=1; q[t]:=now;
      fillchar(v,sizeof(v),false); v[now]:=true;
      for i:=1 to n do d[i]:=$1000000;
      d[now]:=0;
      while h<>t do
        begin
          h:=h mod 800 +1; //q[h]
          v[q[h]]:=false;
          for i:=1 to num[q[h]] do
            if d[e[q[h],i,1]]>d[q[h]]+e[q[h],i,2] then
              begin
                d[e[q[h],i,1]]:=d[q[h]]+e[q[h],i,2];
                if not v[e[q[h],i,1]] then begin t:=t mod 800 +1; q[t]:=e[q[h],i,1]; v[e[q[h],i,1]]:=true; end;
              end;
        end;
      tem:=0;
      for i:=1 to n do if cow[i]>0 then inc(tem,d[i]*cow[i]);
      if min>tem then min:=tem;
    end;
Begin
  assign(input,'butter.in'); reset(input);
  assign(output,'butter.out'); rewrite(output);
  readln(c,n,m); //cow,number of farm,number of ways
  for i:=1 to c do begin readln(j); inc(cow[j]); end;
  for i:=1 to m do
    begin
      read(j,k,l);
      inc(num[j]); inc(num[k]);
      e[j,num[j],1]:=k; e[k,num[k],1]:=j;
      e[j,num[j],2]:=l; e[k,num[k],2]:=l;
    end;
  close(input);
  min:=maxlongint;
  for now:=1 to n do
    SPFA;
  writeln(min);
  close(output);
End.

