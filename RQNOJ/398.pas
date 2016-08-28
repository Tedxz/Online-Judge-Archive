Program RQNOJ_398; //Êý¾ÝÓÐÎó WA:80
Const
  maxN=100000;
  maxM=100000;
Type
  edge=record
    a,next:longint;
    w:longint;
  end;
Var
  pos,heap,head:array[1..maxN] of longint;
  dis:array[1..maxN] of longint;
  e:array[1..maxM] of edge;
  i,j,k,n,m,p,heap_size,x,t:longint;
  ans:int64;
  procedure swap(var a,b:longint);
    var t:longint;
    begin t:=a; a:=b; b:=t; end;
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
  procedure siftdown(k:longint);
    var i:longint;
    begin
      while k<<1<heap_size do
        begin
          if dis[heap[k<<1]]>dis[heap[k<<1+1]] then i:=k<<1+1 else i:=k<<1;
          if dis[heap[k]]>dis[heap[i]] then
            begin swap(heap[k],heap[i]); swap(pos[heap[i]],pos[heap[k]]); end
          else break;
          k:=i;
        end;
      if (heap_size=k<<1) and (dis[heap[heap_size]]<dis[heap[k]]) then begin swap(heap[k],heap[k<<1]); swap(pos[heap[k]],pos[heap[k<<1]]); end;
    end;
  function pop:longint;
    begin
      pop:=heap[1];
      heap[1]:=heap[heap_size]; pos[heap[heap_size]]:=1;
      dec(heap_size);
      siftdown(1);
    end;
  procedure Dijkstra;
    begin
      filldword(heap,sizeof(heap)>>2,$20000000);
      filldword(dis,sizeof(dis)>>2,$20000000);
      p:=head[1];
      dis[1]:=0;
      while p>0 do
        begin
          if e[p].w<dis[e[p].a] then dis[e[p].a]:=e[p].w;
          p:=e[p].next;
        end;
      for i:=2 to n do
        begin heap[i-1]:=i; pos[i]:=i-1; end;
      heap_size:=n-1;
      for i:=n downto 1 do siftdown(i);

      for i:=1 to n-1 do
        begin
          j:=pop;
          inc(ans,dis[j]);
          p:=head[j];
          while p>0 do
            begin
              if dis[e[p].a]>dis[j]+e[p].w then
                begin dis[e[p].a]:=dis[j]+e[p].w; siftup(pos[e[p].a]); end;
              p:=e[p].next;
            end;
        end;
    end;

Begin
  readln(n,m,t);
  for i:=1 to m do
    begin
      readln(j,k,x);
      with e[i<<1-1] do
        begin a:=k; w:=x; next:=head[j]; head[j]:=i<<1-1; end;
      with e[i<<1] do
        begin a:=j; w:=x; next:=head[k]; head[k]:=i<<1; end;
    end;
  Dijkstra;
  writeln(ans*2);
  if ans*2>t then writeln('escape') else writeln('run');
End.
