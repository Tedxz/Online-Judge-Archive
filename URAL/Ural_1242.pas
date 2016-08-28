Program Ural_1242;
Const
  maxN=1000;
  maxM=2000;
Type
  edge=record
    a,next:longint;
  end;
Var
  hp_anc,hp_des:array[1..maxN] of longint;
  e_anc,e_des:array[1..maxM] of edge;
  i,j,k,n,x,y,ma,md:longint;
  s:string;
tem:variant;
  flag:boolean;
  v1,v2:array[1..maxN] of boolean;
  procedure add_edge(x,y:longint);
    begin
      inc(ma);
      e_anc[ma].a:=y; e_anc[ma].next:=hp_anc[x]; hp_anc[x]:=ma;
      inc(md);
      e_des[md].a:=x; e_des[md].next:=hp_des[y]; hp_des[y]:=md;
    end;
  procedure DFS_A(k:longint);
    var p:longint;
    begin
      if v1[k] then exit;
      v1[k]:=true;
      p:=hp_anc[k];
      while p>0 do
        begin
          DFS_A(e_anc[p].a);
          p:=e_anc[p].next;
        end;;
    end;
  procedure DFS_D(k:longint);
    var p:longint;
    begin
      if v2[k] then exit;
      v2[k]:=true;
      p:=hp_des[k];
      while p>0 do
        begin
          DFS_D(e_des[p].a);
          p:=e_des[p].next;
        end;;
    end;
Begin
  readln(n);
  readln(s);
  while s<>'BLOOD' do
    begin
      val(copy(s,1,pos(' ',s)-1),x);
      val(copy(s,pos(' ',s)+1,length(s)-pos(' ',s)),y);
      add_edge(x,y);
      readln(s);
    end;
  while not eof do
    begin
      read(x);
      DFS_D(x);
      DFS_A(x);
    end;
  for i:=1 to n do if not (v1[i] or v2[i]) then
    begin write(i); flag:=true; break; end;
  for j:=i+1 to n do if not (v1[j] or v2[j]) then write(' ',j);
  if not flag then write(0);
  writeln;
End.
Program Ural_1242;
Const
  maxN=1000;
  maxM=2000;
Type
  edge=record
    a,next:longint;
  end;
Var
  hp_anc,hp_des:array[1..maxN] of longint;
  e_anc,e_des:array[1..maxM] of edge;
  i,j,k,n,x,y,ma,md:longint;
  s:string;
tem:variant;
  flag:boolean;
  v1,v2:array[1..maxN] of boolean;
  procedure add_edge(x,y:longint);
    begin
      inc(ma);
      e_anc[ma].a:=y; e_anc[ma].next:=hp_anc[x]; hp_anc[x]:=ma;
      inc(md);
      e_des[md].a:=x; e_des[md].next:=hp_des[y]; hp_des[y]:=md;
    end;
  procedure DFS_A(k:longint);
    var p:longint;
    begin
      if v1[k] then exit;
      v1[k]:=true;
      p:=hp_anc[k];
      while p>0 do
        begin
          DFS_A(e_anc[p].a);
          p:=e_anc[p].next;
        end;;
    end;
  procedure DFS_D(k:longint);
    var p:longint;
    begin
      if v2[k] then exit;
      v2[k]:=true;
      p:=hp_des[k];
      while p>0 do
        begin
          DFS_D(e_des[p].a);
          p:=e_des[p].next;
        end;;
    end;
Begin
  readln(n);
  readln(s);
  while s<>'BLOOD' do
    begin
      val(copy(s,1,pos(' ',s)-1),x);
      val(copy(s,pos(' ',s)+1,length(s)-pos(' ',s)),y);
      add_edge(x,y);
      readln(s);
    end;
  while not eof do
    begin
      read(x);
      DFS_D(x);
      DFS_A(x);
    end;
  for i:=1 to n do if not (v1[i] or v2[i]) then
    begin write(i); flag:=true; break; end;
  for j:=i+1 to n do if not (v1[j] or v2[j]) then write(' ',j);
  if not flag then write(0);
  writeln;
End.
