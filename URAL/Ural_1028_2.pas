Program Ural_1028; //Segment Tree Verson
Const
  maxN=15000;
  maxX=32768;
Type
  segment_tree=record
    l,r,sum:array[1..maxX*2] of longint;
  end;
Var
  tree:segment_tree;
  pos:array[1..maxX] of longint;
  ans:array[0..maxN] of longint;
  i,j,x,n:longint;
  procedure build(k,s,t:longint);
    begin
      with tree do
        begin
          l[k]:=s; r[k]:=t; sum[k]:=0;
          if s=t then
            begin
              pos[s]:=k;
              exit;
            end;
          build(k<<1,s,(s+t)>>1);
          build(k<<1+1,(s+t)>>1+1,t);
        end;
    end;
  procedure modify(pos,key:longint);
    begin
      with tree do
        begin
          while pos>0 do
            begin
              sum[pos]:=sum[pos]+key;
              pos:=pos>>1;
            end;
        end;
    end;
  function query(k,s,t:longint):longint;
    begin
      with tree do
        begin
          if (l[k]>t) or (r[k]<s) then exit(0);
          if (l[k]>=s) and (r[k]<=t) then exit(sum[k]);
          exit(query(k<<1,s,t)+query(k<<1+1,s,t));
        end;
    end;
Begin
  readln(n);
  build(1,1,maxX);
  for i:=1 to n do
    begin
      readln(x);
      inc(x);
      inc(ans[query(1,1,x)]);
      modify(pos[x],1);
    end;
  for i:=0 to n-1 do writeln(ans[i]);
End.
