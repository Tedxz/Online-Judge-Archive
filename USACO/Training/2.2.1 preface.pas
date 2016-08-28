{
USER: Xie Zheng
TASK: preface
LANG: PASCAL
}
Program preface //USACO 2.2.1
Const
  filename='preface';
  ch='IVXLCDM';
  arr:array[1..3,0..9]of longint=((0,1,2,3,1,0,1,2,3,1),
                                  (0,0,0,0,1,1,1,1,1,0),
                                  (0,0,0,0,0,0,0,0,0,1));
Var
  ans:array[1..12]of longint;
  n,i,j,t:longint;
Begin
  assign(input,'preface.in');reset(input);
  assign(output,'preface.out');rewrite(output);
  readln(n);
  for n:=1 to n do
    begin
      t:=n;
      for i:=0 to 3 do
        begin
          for j:=1 to 3 do
            inc(ans[i*2+j],arr[j,t mod 10]);
          t:=t div 10;
          if t=0 then break;
        end;
    end;
  for i:=1 to 7 do
    if ans[i]<>0
      then writeln(ch[i],' ',ans[i]);
  close(input);
  close(output);
End.