Program Ural_1083;
Var
  i,ans,n,k:longint;
  s:string;
Begin
  read(n);
  readln(s);
  k:=length(s)-1;
  ans:=1;
  repeat
    ans:=ans*n;
    dec(n,k);
  until n<=0;
  writeln(ans);
End.