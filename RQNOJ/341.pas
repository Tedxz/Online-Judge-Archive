Program RQNOJ_341;
Const
  maxN=30000;
  maxM=150000;
Type
  edge=record
    a,w,next:longint;
  end;
Var
  head:array[1..maxN] of longint;
  e:array[1..maxM*2] of edge;
  dis:array[0..maxN] of longint;
  v:array[1..maxN] of boolean;
  i,j,k,n,m,min,p,x:longint;
  heap,pos:array[1..maxN] of longint;
  heap_size:longint;
  procedure swap(var a,b:longint);
    var tem:longint;
    begin tem:=a; a:=b; b:=tem; end;
  procedure siftdown(k:longint);
    var i:longint;
    begin
      while k<<1<heap_size do
        begin
          if dis[heap[k<<1]]>dis[heap[k<<1+1]] then i:=k<<1+1 else i:=k<<1;
          if dis[heap[i]]<dis[heap[k]] then
            begin swap(heap[k],heap[i]); swap(pos[heap[k]],pos[heap[i]]); end
          else break;
          k:=i;
        end;
      if (k<<1=heap_size) and (dis[heap[k]]>dis[heap[heap_size]]) then
        begin swap(heap[k],heap[heap_size]); swap(pos[heap[k]],pos[heap[heap_size]]); end;
    end;
  function pop:longint;
    begin
      if heap_size=0 then exit(0);
      pop:=heap[1];
      heap[1]:=heap[heap_size];
      dec(heap_size);
      siftdown(1);
    end;
  procedure siftup(k:longint);
    begin
      while k>1 do
        begin
          if dis[heap[k]]<dis[heap[k>>1]] then
            begin swap(heap[k],heap[k>>1]); swap(pos[heap[k]],pos[heap[k>>1]]); end
          else exit;
          k:=k>>1;
        end;
    end;
  procedure Dijkstra;
    begin
      v[1]:=true;
      filldword(dis,sizeof(dis)>>2,$20000000);
      dis[1]:=0;
      k:=head[1];
      while k>0 do
        begin if dis[e[k].a]>e[k].w then dis[e[k].a]:=e[k].w; k:=e[k].next; end;
      //INIT Heap
      //dis[0]:=INF heap中多余节点赋为正无穷
      for i:=2 to n do begin heap[i-1]:=i; pos[i]:=i-1; end;
      heap_size:=n-1;
      for i:=n downto 1 do siftdown(i);

      for i:=2 to n do
        begin
          {min:=$20000000; p:=0;
          for j:=1 to n do
            if (not v[j]) and (dis[j]<min) then
              begin min:=dis[j]; p:=j; end;
          if p=0 then exit;}
          p:=pop;
          v[p]:=true;
          if p=n then exit;
          k:=head[p];
          while k>0 do
            begin
              if dis[e[k].a]>dis[p]+e[k].w then
                begin dis[e[k].a]:=dis[p]+e[k].w; siftup(pos[e[k].a]); end;
              k:=e[k].next;
            end;
        end;
    end;
Begin
  readln(n,m);
  for i:=1 to m do
    begin
      readln(j,k,x);
      with e[i<<1-1] do
        begin a:=k; w:=x; next:=head[j]; head[j]:=i<<1-1; end;
      with e[i<<1] do
        begin a:=j; w:=x; next:=head[k]; head[k]:=i<<1; end;
    end;
  Dijkstra;
  writeln(dis[n]);
End.
