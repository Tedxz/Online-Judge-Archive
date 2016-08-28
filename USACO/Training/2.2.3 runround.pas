{
USER: Xie Zheng
TASK: runround
LANG: PASCAL
}
Program runround; //USACO 2.2.3
Var
  ans:longint;
  function same_bit(k:longint):boolean;
    var i,s:longint;
    begin
      s:=0;
      while k>0 do
        if (s and (1 << (k mod 10)))>0 then exit(true)
          else
            begin
              s:=s or (1 << (k mod 10));
              k:=k div 10;
            end;
      if s and 1=1 then exit(true);
      exit(false);
    end;
  function round(k:longint):boolean;
    var len,p,i:integer;
        s:string;
        f:longint;
    begin
      if same_bit(k) then exit(false);
      str(k,s);
      len:=length(s);
      p:=1; f:=2;
      for i:=1 to len-1 do
        begin
          p:=(p+ord(s[p])-48) mod len;
          if p=0 then p:=len;
          if ((1 << p) and f)>0 then exit(false);
          f:=f or (1 << p);
        end;
      p:=(p+ord(s[p])-48) mod len;
      if p=0 then p:=len;
      if p>1 then exit(false);
      exit(true);
    end;
Begin
  assign(input,'runround.in'); reset(input);
  assign(output,'runround.out'); rewrite(output);
  readln(ans);
  while TRUE do
    begin
      inc(ans);
      if round(ans) then break;
    end;
  writeln(ans);
  close(input);
  close(output);
End.
