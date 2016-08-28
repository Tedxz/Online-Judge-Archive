{
USER: Xie Zheng
TASK: comehome
LANG: PASCAL
}
Program comehome; //USACO 2.4.4
Var
  n,i,j,k,a,b,ans:longint;
  e:array[1..52,1..52] of longint;
  dis:array[1..52] of longint;
  c1,c2:char;
  procedure SPFA;
    var h,t:integer;
        q:array[1..200] of integer;
        v:array[1..52] of boolean;
        i,j:integer;
    begin
      h:=0; t:=1; q[t]:=52;
      for i:=1 to 51 do dis[i]:=maxlongint;
      dis[52]:=0;
      v[52]:=true;
      while h<t do
        begin
          h:=h+1;
          v[q[h]]:=false;
          for i:=1 to 52 do
            if e[q[h],i]<maxlongint then
              if dis[q[h]]+e[q[h],i]<dis[i] then
                begin
                  dis[i]:=dis[q[h]]+e[q[h],i];
                  if not v[i] then begin t:=t+1; q[t]:=i; v[i]:=true; end;
                end;
        end;
    end;
Begin
  assign(input,'comehome.in'); reset(input);
  assign(output,'comehome.out'); rewrite(output);
  readln(n);
  filldword(e,sizeof(e)>>2,maxlongint);
  for i:=1 to 52 do e[i,i]:=0;
  for i:=1 to n do
    begin
      readln(c1,c2,c2,j);
      if c1 in ['a'..'z'] then a:=ord(c1)-96 else a:=ord(c1)-38;
      if c2 in ['a'..'z'] then b:=ord(c2)-96 else b:=ord(c2)-38;
      if e[a,b]>j then begin e[a,b]:=j; e[b,a]:=j; end;
    end;
  close(input);
  SPFA;
  ans:=27;
  for i:=28 to 51 do
    if dis[i]<dis[ans] then ans:=i;
  writeln(chr(ans+38),' ',dis[ans]);
  close(output);
End.

