{
USER: Xie Zheng
TASK: heritage
LANG: PASCAL
}
Program heritage; //USACO 3.4.2
Var
  pre,mid:string;
  procedure post(pre,mid:string);
    var len,k:word;
    begin
      if pre='' then exit;
      len:=length(pre);
      k:=pos(pre[1],mid);
      post(copy(pre,2,k-1),copy(mid,1,k-1));
      post(copy(pre,k+1,len-k),copy(mid,k+1,len-k));
      write(pre[1]);
    end;
Begin
  assign(input,'heritage.in'); reset(input);
  assign(output,'heritage.out'); rewrite(output);
  readln(mid);
  readln(pre);
  close(input);
  post(pre,mid);
  writeln;
  close(output);
End.
