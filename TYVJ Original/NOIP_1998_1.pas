Program NOIP_1998_1;
Var
  a,x,n,m,i,j,k:longint;
  u,d,p:array[0..20] of int64;
  procedure print(k:integer);
    begin
      writeln(p[x]);
      halt;
    end;
  procedure find;
    begin
      p[1]:=a; p[2]:=a; u[1]:=a; d[1]:=0;
      for k:=0 to a+100 do
        begin
          u[2]:=k; d[2]:=k;
          for i:=3 to n-1 do
            begin
              u[i]:=u[i-1]+u[i-2];
              d[i]:=u[i-1];
              p[i]:=p[i-1]+u[i]-d[i];
              //if p[i-1]-d[i]<0 then break;
            end;
          if p[n-1]=m then begin print(k); exit; end;
          if p[n-1]>m then break;
        end;
      writeln('No answer.');
    end;
Begin
  readln(a,n,m,x);
  p[1]:=a; p[2]:=a; u[1]:=0;
  find;
End.
