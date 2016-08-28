{
USER: Xie Zheng
TASK: zerosum
LANG: PASCAL
}
Program zerosum; //USACO 2.3.3
Const
  code:array[0..2] of char=(' ','+','-');
Var
  sol:array[1..9] of byte;
  n:byte;
  procedure print;
    var i:byte;
    begin
      write(1);
      for i:=2 to n do write(code[sol[i]],i);
      writeln;
    end;
  procedure dfs(sum,k,last:longint);
    begin
      if k=n+1 then begin if sum+last=0 then print; exit; end;
      sol[k]:=0;
      if last>0 then dfs(sum,k+1,last*10+k)
        else dfs(sum,k+1,last*10-k);
      sol[k]:=1;
      dfs(sum+last,k+1,k);
      sol[k]:=2;
      dfs(sum+last,k+1,-k);
    end;
Begin
  assign(input,'zerosum.in'); reset(input);
  assign(output,'zerosum.out'); rewrite(output);
  readln(n);
  sol[1]:=1;
  dfs(0,2,1); //sum,k,last
  close(input);
  close(output);
End.
