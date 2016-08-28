//TYVJ P1051
Const
  maxN=300;
Var
  v,left,right:array[0..maxN] of integer;
  n,m,i,j,k:integer;
  f:array[0..maxN,0..maxN+1] of longint;
  function max(a,b:longint):longint;
    begin
      if a>b then exit(a) else exit(b);
    end;
  procedure DP(k,x:integer);
    var i:integer;
    begin
      if x=0 then exit;
      if f[k,x]>0 then exit;
      if left[k]+right[k]=0 then begin f[k,x]:=v[k]; exit; end;
      if (right[k]=0) then
        begin
          DP(left[k],x-1);
          f[k,x]:=v[k]+f[left[k],x-1];
          exit;
        end;
      if (left[k]=0) then
        begin
          DP(right[k],x);
          DP(right[k],x-1);
          f[k,x]:=max(f[right[k],x],f[right[k],x-1]+v[k]);
          exit;
        end;
      for i:=1 to x-1 do DP(left[k],i);
      for i:=1 to x do DP(right[k],i);
      f[k,x]:=max(f[right[k],x-1]+v[k],f[right[k],x]);
      for i:=0 to x-1 do
        f[k,x]:=max( f[left[k],i] + f[right[k],x-i-1] + v[k] ,f[k,x]);
    end;
Begin
  readln(n,m);
  for i:=1 to n do
    begin
      readln(j,v[i]);
      if left[j]=0 then left[j]:=i
        else
          begin
            right[i]:=left[j];
            left[j]:=i;
          end;
    end;
  DP(0,m+1);
  writeln(f[0,m+1]);
End.
