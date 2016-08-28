//NOIP_2008_1
Var
  f:array['a'..'z'] of integer;
  s:string;
  min,max,i,l,ans:longint;
  ch:char;
Begin
  readln(s);
  l:=length(s);
  for i:=1 to l do inc(f[s[i]]);
  max:=0; min:=100;
  for ch:='a' to 'z' do
    begin
      if f[ch]>max then max:=f[ch];
      if (f[ch]>0) and (min>f[ch]) then min:=f[ch];
    end;
  ans:=max-min;
  if ans=1 then ans:=0;
  for i:=2 to trunc(sqrt(ans)) do if ans mod i=0 then begin ans:=0; break; end;
  if ans<2 then writeln('No Answer')
    else writeln('Lucky Word');
  writeln(ans);
End.