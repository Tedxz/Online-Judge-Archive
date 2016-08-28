{
USER: Xie Zheng
TASK: msquare
LANG: PASCAL
}
Program msquare; //USACO 3.2.5
Type
  stat=array[1..8] of byte;
  node=record
    fa:dword;
    a:byte;
    s:stat;
  end;
Const
  fact:array[1..7] of word=(1,2,6,24,120,720,5040);
  action:array[1..3,1..8] of byte=((8,7,6,5,4,3,2,1),       //A
                                   (4,1,2,3,6,7,8,5),       //B
                                   (1,7,2,4,5,3,6,8));      //C
Var
  HT:array[1..40320] of boolean;
  start,target:stat;
  i,j,k,goal,ans:dword;
  q:array[1..40320] of node;
  function cantor(k:stat):dword;
    var i,j,t:byte;
    begin
      cantor:=1;
      for i:=1 to 7 do
        begin
          t:=0;
          for j:=i+1 to 8 do if k[j]>k[i] then inc(t);
          inc(cantor,fact[8-i]*t);
        end;
    end;
  procedure sol(k:dword);
    begin
      if q[k].fa<>0 then begin inc(ans); sol(q[k].fa); end
        else begin writeln(ans); ans:=0; exit; end;
      write(chr(64+q[k].a));
    end;
  procedure print(k:dword);
    begin
      sol(k);
      writeln;
    end;
  procedure BFS;
    var h,t,x:dword;
        temp:stat;
    begin
      h:=0; t:=1;
      q[1].fa:=0; q[1].a:=0; q[1].s:=start; HT[cantor(start)]:=true;
      while h<t do
        begin
          inc(h);
          for i:=1 to 3 do
            begin
              inc(t);
              for j:=1 to 8 do
                q[t].s[j]:=q[h].s[action[i,j]];
              x:=cantor(q[t].s);
              if HT[x] then dec(t)
                else
                  begin
                    q[t].fa:=h;
                    q[t].a:=i;
                    HT[x]:=true;
                    if x=goal then begin print(t); exit; end;
                  end;
            end;
        end;
    end;
Begin
  assign(input,'msquare.in'); reset(input);
  assign(output,'msquare.out'); rewrite(output);
  for i:=1 to 8 do begin read(target[i]); start[i]:=i; end;
  goal:=cantor(target);
  close(input);
  if cantor(start)=goal then begin writeln(0); writeln; end
    else BFS;
  close(output);
End.
