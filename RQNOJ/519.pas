Program RQNOJ_519;  //NOIP2009 son AC 50% ONLY
Var
  a1,a0,b1,b0,x,b2:longint;
  s:longint;
  i,n:integer;
  function gcd(a,b,k:longint):boolean;
    var t:longint;
    begin
      while b>0 do
        begin
          t:=b;
          b:=a mod b;
          a:=t;
          if (a<k) and (b<k) then exit(false);
        end;
      if a=k then exit(true) else exit(false);
    end;
Begin
  readln(n);
  for i:=1 to n do
    begin
      readln(a0,a1,b0,b1);
      s:=0;
      x:=a1;
      while x<=b1 do
        begin
          if (b1 mod x>0) then begin x:=x+a1; continue; end;
          if not gcd(x,b0,(b0*x) div b1) then begin x:=x+a1; continue; end;
          if not gcd(x,a0,a1) then begin x:=x+a1; continue; end;
          x:=x+a1;
          inc(s);
        end;
      writeln(s);
    end;
End.

