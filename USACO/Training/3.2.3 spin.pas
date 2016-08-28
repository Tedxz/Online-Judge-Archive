{
USER: Xie Zheng
TASK: spin
LANG: PASCAL
}
Program spin; //USACO 3.2.3
Var
  cut:array[1..5,0..359] of boolean;
  omg:array[1..5] of dword;
  phi:array[1..5] of dword;
  i,j,k,n,h,t:integer;
  function work:string;
    begin
      for i:=0 to 359 do
        begin
          for j:=360+0 to 360+359 do
            if (cut[1,(-phi[1]+j) mod 360] and cut[2,(-phi[2]+j) mod 360] and cut[3,(-phi[3]+j) mod 360] and cut[4,(-phi[4]+j) mod 360] and cut[5,(-phi[5]+j) mod 360]) then
              begin str(i,work); exit; end;
          for j:=1 to 5 do phi[j]:=(phi[j]+omg[j]) mod 360;
        end;
      exit('none');
    end;
Begin
  assign(input,'spin.in'); reset(input);
  assign(output,'spin.out'); rewrite(output);
  fillchar(cut,sizeof(cut),false);
  fillchar(phi,sizeof(phi),0);
  for i:=1 to 5 do
    begin
      read(omg[i],n);
      for j:=1 to n do
        begin
          read(h,t);
          for k:=h to h+t do cut[i,k mod 360]:=true;
        end;
      readln;
    end;
  close(input);
  //for i:=0 to 359 do write(ord(cut[2,i]));
  writeln(work);
  close(output);
End.

