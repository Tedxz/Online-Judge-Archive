{
USER: Xie Zheng
TASK: contact
LANG: PASCAL
}
Program contact; //USACO 3.1.5
Const
  mm:array[1..12]of integer=(1,2,4,8,16,32,64,128,256,512,1024,2048);
  ch:array[1..12]of integer=(2,4,8,16,32,64,128,256,512,1024,2048,4096);
Var
  f:array[1..12,1..4096]of string; z:char;
  g:array[1..12,1..4096]of longint;
  ans:array[1..9000]of string;
  len,ci:array[1..9000]of longint;
  i,j,k,l,m,n,a,b,c,shu,tot,cha,chang:longint;
  s,ss:ansistring;
  p,q:boolean;
  procedure qsort(l,r:longint);
  var
    tl,tr,mid,tmp,mid2:longint; tm:string; mid3:string;
  begin
    tl:=l; tr:=r; mid:=ci[(l+r)div 2]; mid2:=len[(l+r)div 2];
    mid3:=ans[(l+r)div 2];
    repeat
      while (ci[tl]>mid)or
            ((ci[tl]=mid) and (len[tl]<mid2))or
            ((ci[tl]=mid) and (len[tl]=mid2)and(ans[tl]<mid3))
            do inc(tl);
      while (ci[tr]<mid)or
            ((ci[tr]=mid) and (len[tr]>mid2))or
            ((ci[tr]=mid) and (len[tr]=mid2)and(ans[tr]>mid3))
            do dec(tr);
      if tl<=tr then begin
        tm:=ans[tl]; ans[tl]:=ans[tr]; ans[tr]:=tm;
        tmp:=ci[tl]; ci[tl]:=ci[tr]; ci[tr]:=tmp;
        tmp:=len[tl]; len[tl]:=len[tr]; len[tr]:=tmp;
        inc(tl); dec(tr);
        end;
      until tl>tr;
    if tl<r then qsort(tl,r);
    if tr>l then qsort(l,tr);
  end;
Begin
  assign(input,'contact.in'); reset(input);
  assign(output,'contact.out'); rewrite(output);
  readln(a,b,n);
  f[1,1]:='0'; f[1,2]:='1';
  l:=0; s:='';
  while not eof do
    begin
      inc(l);
      read(z);
      if z='9' then break;
      if z<>#13 then s:=s+z;
      if l=80 then begin l:=0; readln; end;
    end;
  cha:=length(s);
  if b>cha then b:=cha;
  chang:=cha-a+1;
  if a<>1 then begin
    for i:=1 to a do f[a,1]:=f[a,1]+'0';
    shu:=1;
    ss:=f[a,1];
    repeat
      i:=1;
      while ss[i]='1' do begin ss[i]:='0'; inc(i); end;
      ss[i]:='1';
      inc(shu);
      f[a,shu]:=ss;
    until shu=ch[a];
  end;
  for j:=a+1 to b do
    begin
    shu:=0;
    for i:=1 to 2 do
      for k:=1 to ch[j-1] do
        begin
          inc(shu);
          f[j,shu]:=f[j-1,k]+f[1,i];
        end;
    end;
  for i:=1 to chang do
    begin
      l:=0; k:=0;
      for j:=i to i+a-2 do
        begin
          inc(k);
          inc(l,(ord(s[j])-ord('0'))*mm[k]);
        end;
      for j:=a to b do
        begin
          if i+j-1>cha then break;
          l:=l+(ord(s[i+j-1])-ord('0'))*mm[j];
          inc(g[j,l+1]);
        end;
    end;
  tot:=0; shu:=0;
  for i:=a to b do
    for j:=1 to ch[i] do
      begin
        inc(shu);
        ans[shu]:=f[i,j];
          len[shu]:=length(f[i,j]);
          ci[shu]:=g[i,j];
        end;
  qsort(1,shu);
  l:=ci[1];
  for i:=1 to n do
    begin
      if l=0 then begin close(input); close(output); halt; end;
      writeln(l);
      k:=0;
      repeat
        inc(k);
        p:=true;
        inc(tot);
        write(ans[tot]);
        if tot<>shu then begin
        if ci[tot+1]=l then begin p:=false; if k<>6 then write(' ') else begin k:=0; writeln; end; end else begin
          l:=ci[tot+1]; writeln; end end else writeln;
        until (p=true)or(tot=shu);
      if tot=shu then break;
    end;
  close(input); close(output);
End.