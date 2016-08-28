Program PKU_3468;
Const
  maxN=800000;
Type
  node=record
    l,r:longint;
    sum,add:int64;
  end;
Var
  tree:array[1..maxN] of node;
  i,k,n,m,left,right:longint;
  j:int64;
  ch:char;
  a:array[1..maxN] of int64;
  procedure build(k,left,right:longint);
    begin
      tree[k].l:=left; tree[k].r:=right; tree[k].add:=0;
      if left=right then
        begin
          tree[k].sum:=a[left];
          exit;
        end;
      build(k<<1,left,(left+right)>>1);
      build(k<<1+1,(left+right)>>1+1,right);
      tree[k].sum:=tree[k<<1].sum+tree[k<<1+1].sum;
    end;
  procedure down(k:longint);
    begin
      inc(tree[k<<1].add,tree[k].add);
      inc(tree[k<<1].sum,tree[k].add*(tree[k<<1].r-tree[k<<1].l+1));
      inc(tree[k<<1+1].add,tree[k].add);
      inc(tree[k<<1+1].sum,tree[k].add*(tree[k<<1+1].r-tree[k<<1+1].l+1));
      tree[k].add:=0;
    end;
  procedure modify(k,left,right:longint; delta:int64);
    begin
      if tree[k].add<>0 then down(k);
      if (tree[k].l>right) or (tree[k].r<left) then exit;
      if (tree[k].l>=left) and (tree[k].r<=right) then
        begin
          inc(tree[k].add,delta);
          inc(tree[k].sum,delta*(tree[k].r-tree[k].l+1));
          exit;
        end;
      modify(k<<1,left,right,delta);
      modify(k<<1+1,left,right,delta);
      tree[k].sum:=tree[k<<1].sum+tree[k<<1+1].sum;
    end;
  function query(k,left,right:longint):int64;
    begin
      if tree[k].add<>0 then down(k);
      if (left>tree[k].r) or (right<tree[k].l) then exit(0);
      if (left<=tree[k].l) and (tree[k].r<=right) then exit(tree[k].sum);
      exit( query(k<<1,left,right) + query(k<<1+1,left,right)  );
    end;
Begin
  readln(n,m);
  for i:=1 to n do read(a[i]);
  readln;
  build(1,1,n);
  for i:=1 to m do
    begin
      read(ch);
      case ch of
        'Q':begin
              readln(left,right);
              writeln(query(1,left,right));
            end;
        'C':begin
              readln(left,right,j);
              modify(1,left,right,j);
            end;
        end;
    end;
End.
