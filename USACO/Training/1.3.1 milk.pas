{
USER: Xie Zheng
TASK: milk
LANG: PASCAL
}
Program milk; //USACO 1.3.1
Var
  m,n,i,j,ans,p,lim:longint;
  a:array[0..1000] of longint;
Begin
  assign(input,'milk.in'); reset(input);
  assign(output,'milk.out'); rewrite(output);
  readln(n,m);
  for i:=1 to m do 
    begin readln(p,lim); inc(a[p],lim); end;
  ans:=0;
  for i:=0 to 1000 do
    if a[i]<=n then
      begin n:=n-a[i]; ans:=ans+a[i]*i; end
      else
        begin ans:=ans+n*i; break; end;
  writeln(ans);
  close(input);
  close(output);
End.
