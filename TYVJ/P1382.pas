//TYVJ P1382
Type
  HPint=record
    v:array[1..1100] of integer;
    len:longint;
  end;
Var
  a,b,c:HPint;
  function max(a,b:longint):longint;
    begin if a>b then exit(a) else exit(b); end;
  operator * (a,b:HPint) c:HPint;
    var i,j:longint;
    begin
      fillchar(c,sizeof(c),0);
      with c do
        begin
          len:=a.len+b.len;
          for i:=1 to a.len do
            for j:=1 to b.len do
              inc(c.v[i+j-1],a.v[i]*b.v[j]);
          for i:=1 to len do
            if c.v[i]>9 then
              begin inc(c.v[i+1],c.v[i] div 10); c.v[i]:=c.v[i] mod 10; end;
          if v[len]=0 then dec(len);
        end;
    end;
  procedure HP_readln(var a:HPint);
    var i:longint;
        s:ansistring;
        ch:char;
    begin
      fillchar(a,sizeof(a),0);
      s:='';
      read(ch);
      while ch<>' ' do begin s:=s+ch; if eoln then break; read(ch); end;
      a.len:=length(s);
      for i:=1 to a.len do
        a.v[i]:=ord(s[a.len-i+1])-48;
    end;
  procedure HP_print(a:HPint);
    var i:longint;
    begin
      for i:=a.len downto 1 do write(a.v[i]);
      writeln;
    end;
Begin
  HP_readln(a);
  HP_readln(b);
  HP_print(a*b);
End.
