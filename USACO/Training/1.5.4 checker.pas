{
USER: Xie Zheng
TASK: checker
LANG: PASCAL
}
Program checker; //USACO 1.5.4
Var
  n,cl,du,dd,ans,t,half:longint;
  s:array[1..13] of longint;
  procedure count;
    var i:longint;
    begin
      inc(ans);
      if (s[1]=(n shr 1+1)) and (half=0) then half:=ans-1;
      if ans<4 then
        begin
          write(s[1]);
          for i:=2 to n do write(' ',s[i]);
          writeln;
        end;
      if (ans>=3) and (half>0) and (n and 1=0) then begin writeln(half*2); close(output); halt; end;
      if (ans>=3) and (s[1]=(n shr 1+2)) and (half>0) and (n and 1=1) then begin writeln(half+ans-1); close(output); halt; end;
    end;
  procedure dfs(k:longint);
    var i:longint;
        tem,cl_,du_,dd_:longint;
    begin
      if k=n+1 then begin count; exit; end;
      tem:=t;
      for i:=1 to n do
        begin
          tem:=tem shr 1;
          if ((cl and tem)=0) and ((du and (tem shl (n-k)))=0) and ((dd and (tem shl k))=0) then
            begin
              cl_:=cl; dd_:=dd; du_:=du;
              cl:=(cl or tem); du:=(du or (tem shl (n-k))); dd:=(dd or (tem shl k));
              s[k]:=i;
              dfs(k+1);
              cl:=cl_; dd:=dd_; du:=du_;
            end;
        end;
    end;
Begin
  assign(input,'checker.in'); reset(input);
  assign(output,'checker.out'); rewrite(output);
  readln(n);
  close(input);
  half:=0;
  t:=1 shl n;
  ans:=0;
  cl:=0; du:=0; dd:=0;
  dfs(1);
  writeln(ans);
  close(output);
End.
