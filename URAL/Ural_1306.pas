Program Ural_1306;
Const
  maxN=250000;
Var
  heap:array[1..125100] of longint;
  i,j,n,mid,size:longint;
  procedure swap(var a,b:longint);
    var t:longint;
    begin
      t:=a; a:=b; b:=t;
    end;
  procedure sift_up(pos:longint);
    begin
      while pos>1 do
        begin
          if heap[pos>>1]>heap[pos] then swap(heap[pos],heap[pos>>1])
          else break;
          pos:=pos>>1;
        end;
    end;
  procedure sift_down(pos:longint);
    var k:longint;
    begin
      while (pos<<1)<=size do
        begin
          k:=pos<<1;
          if (heap[k]>heap[k+1]) and (size>k) then inc(k);
          if heap[pos]>heap[k] then swap(heap[pos],heap[k])
          else break;
          pos:=k;
        end;
    end;
  procedure push(x:longint);
    begin
      inc(size);
      heap[size]:=x;
      sift_up(size);
    end;
  function pop:longint;
    begin
      pop:=heap[1];
      heap[1]:=heap[size];
      heap[size]:=0;
      dec(size);
      sift_down(1);
    end;
Begin
  readln(n);
  mid:=(n+2)>>1;
  size:=0;
  for i:=1 to mid do
    begin
      readln(j);
      push(j);
    end;
  for i:=mid+1 to n do
    begin
      readln(j);
      push(j);
      pop;
    end;
  if (n and 1=1) then writeln(pop)
  else writeln(((int64(pop)+pop)/2):0:1);
End.
