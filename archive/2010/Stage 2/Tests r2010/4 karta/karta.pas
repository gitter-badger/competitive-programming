Program Karta;
var
  n,m,i,j:integer;
  a:array [1..1000] of integer;
  v:array[1..1000] of integer;
  k,x:integer;
  f1,f2:text;
begin
  assign(f1,'karta.in');
  reset(f1);
  assign(f2,'karta.out');
  rewrite(f2);
  read(f1,n,m);
  for j:=1 to m do
    read(f1,a[j]);
  for i:=1 to m do
    v[i]:=0;
  k:=0;
  for i:=2 to n do
    begin
      read(f1,a[1]);
      for j:=2 to m-1 do
        begin
          read(f1,x);
          if x=1
             then begin
                    a[j]:=a[j-1]+1;
                    v[j]:=v[j]+1
                  end
             else begin
                    if v[j]>0
                       then begin
                              if (a[j+1]=0) and (a[j]=v[j])
                                 then k:=k+1;
                              v[j]:=0;
                            end;
                    a[j]:=0;
                  end;
        end;
      read(f1,a[m]);  
    end;
  write(f2,k);
  close(f1);
  close(f2);
end.