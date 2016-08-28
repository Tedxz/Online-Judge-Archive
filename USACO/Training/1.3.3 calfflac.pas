{
USER: Xie Zheng
TASK: calfflac
LANG: PASCAL
}
Program calfflac; //USACO 1.3.3
Var
  dic:array[1..1000] of string[80];
  s:ansistring;
  i,j,k,r,l,lens,lt,rt,len,maxlen,x1,y1,x2,y2:longint;
Begin
  assign(input,'calfflac.in'); reset(input);
  assign(output,'calfflac.out'); rewrite(output);
  for i:=1 to 1000 do
    begin
      readln(dic[i]);
      for j:=1 to length(dic[i]) do
        begin
          if dic[i,j] in ['A'..'Z'] then begin s:=s+dic[i,j]; continue; end;
          if dic[i,j] in ['a'..'z'] then begin s:=s+upcase(dic[i,j]); end;
        end;
      if eof then break;
    end;
  lens:=length(s);
  writeln(s);
  maxlen:=1;
  for i:=1 to lens do
    begin
      lt:=i; rt:=i;

      while ((lt>1) and (rt<lens)) do
        if s[lt-1]=s[rt+1] then begin inc(rt); dec(lt); end
          else break;

      len:=rt-lt+1;

      if len>maxlen then begin l:=lt; r:=rt; maxlen:=len; end;
      if (i<lens) and (s[i]=s[i+1]) then
        begin
          lt:=i; rt:=i+1;
          while (lt>1) and (rt<lens) do
            if s[lt-1]=s[rt+1] then begin inc(rt); dec(lt); end
              else break;
          len:=rt-lt+1;
          if len>maxlen then begin l:=lt; r:=rt; maxlen:=len; end;
        end;
    end;
  k:=0;
  y2:=0;
  for i:=1 to 1000 do
    begin
      for j:=1 to length(dic[i]) do
        if (dic[i,j] in ['a'..'z']) or (dic[i,j] in ['A'..'Z']) then
          begin
            inc(k);
            if k=l then begin x1:=i; y1:=j; end;
            if k=r then begin x2:=i; y2:=j; break; end;
          end;
      if y2>0 then break;
    end;
  delete(dic[x2],y2+1,length(dic[x2])-y2);
  delete(dic[x1],1,y1-1);
  writeln(maxlen);
  for i:=x1 to x2 do
    writeln(dic[i]);
  close(input);
  close(output);
End.