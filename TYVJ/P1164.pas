//TYVJ P1164
Const
  maxN=800000;
Var
  q:array[1..maxN,1..2] of longint;
  i,j,n,h,t:longint;
  procedure push;
    var j:longint;
    begin
      inc(t);
      readln(q[t,1]);
      j:=t-1;
      while (j>0) and (q[j,1]<=q[t,1]) do j:=q[j,2];
      q[t,2]:=j;
    end;
  procedure pop;
    begin inc(h); end;
  procedure ask_num;
    begin writeln(t-h); end;
  procedure ask_height;
    var j:longint;
    begin
      if (t-h)=0 then begin writeln(0); exit; end;
      j:=t;
      while q[j,2]>h do j:=q[j,2];
      writeln(q[j,1]);
    end;
Begin
  readln(n);
  h:=0; t:=0;
  for i:=1 to n do
    begin
      read(j);
      case j of
        1:ask_num;
        2:pop;
        3:push;
        4:ask_height;
      end;
    end;
End.
