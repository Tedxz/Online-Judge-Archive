{
USER: Xie Zheng
TASK: fracdec
LANG: PASCAL
}
Program fracdec; //USACO 2.4.5
Const
  m=100000;
Var
  a,b,i,j,k,t,l:longint;
  ans,st:ansistring;
  d:array[1..3000000] of longint;
Begin
  assign(input,'fracdec.in'); reset(input);
  assign(output,'fracdec.out'); rewrite(output);
  readln(a,b);
  close(input);
  if (a mod b)=0 then
    begin writeln(a div b,'.0'); close(output); halt; end;
  fillchar(d,sizeof(d),0);
  ans:='';
  str(a div b,st);
  ans:=st+'.';
  t:=0;
  a:=(a mod b)*10;
  d[a]:=1;
  k:=(a div b);
  str(k,st);
  ans:=ans+chr(k+48);
  a:=(a-k*b)*10;
  for i:=2 to m+1 do
    begin
      if a=0 then break;  //·ÀÖ¹ÔÚµÚm+1Î»³ý¾¡
      if d[a]>0 then
        begin t:=d[a]; ans:=ans+')'; break; end;
      d[a]:=i;
      k:=a div b;
      str(k,st);
      ans:=ans+chr(k+48);
      a:=(a-k*b)*10;
    end;
  if t>0 then insert('(',ans,pos('.',ans)+t)
    else
      if (a>0) or (i=m+1) then
        begin
          i:=length(ans);
          if ord(ans[i])>52 then
            while i>1 do
              begin
                dec(i);
                if ans[i] in ['0'..'8'] then begin inc(ans[i]); break; end;
                if ans[i]='9' then begin ans[i]:='0'; end;
              end;
          setlength(ans,length(ans)-1);
        end;
  for i:=1 to length(ans) do
    begin
      write(ans[i]);
      if i mod 76=0 then writeln;
    end;
  if i mod 76<>0 then writeln;
  close(output);
End.
