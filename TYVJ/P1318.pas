Const
  P=22222223;
  maxL=310;
Type
  HDint=record
    v:array[1..maxL] of shortint;
    len:longint;
  end;
Var
  ans:qword;
  s:ansistring;
  a:HDint;
  tem,i,l:longint;
  function f(k:HDint):integer;
    var i:longint;
    begin
      f:=0;
      while true do
        begin
          if k.len=0 then exit;
          for i:=k.len downto 2 do
            begin
              inc(k.v[i-1],(k.v[i] and 1)*10);
              k.v[i]:=k.v[i]>>1;
            end;
          inc(f,k.v[1] and 1);
          k.v[1]:=k.v[1]>>1;
          if k.v[k.len]=0 then dec(k.len);
        end;
    end;
Begin
  while not eof do
    begin
      readln(s);
      l:=length(s);
      for i:=1 to l do a.v[i]:=ord(s[l-i+1])-48;
      a.len:=l;
      tem:=f(a);
      ans:=1;
      while tem>31 do
        begin
          ans:=ans<<32 mod P;
          dec(tem,32);
        end;
      ans:=ans<<tem mod P;
      writeln(ans);
    end;
End.