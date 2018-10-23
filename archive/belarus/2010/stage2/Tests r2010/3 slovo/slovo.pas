Program slovo;
var
  st:string;
  s:array[0..1000] of string[20];
  c:char;
  n,i,j,k,t,i1,i2,error:integer;
  f1,f2:text;
begin
  assign(f1,'slovo.in');
  reset(f1);
  assign(f2,'slovo.out');
  rewrite(f2);
  readln(f1,st);
  readln(f1,n);
  for i:=1 to n do
    readln(f1,s[i]);
  {sort}  
  for j:=1 to Length(st)-1 do
    for k:=1 to Length(st)-j do
      if st[k]>st[k+1]
         then begin
                c:=st[k];
                st[k]:=st[k+1];
                st[k+1]:=c;
              end;
  for i:=1 to n do
    for j:=1 to Length(s[i])-1 do
      for k:=1 to Length(s[i])-j do
        if s[i][k]>s[i][k+1]
           then begin
                  c:=s[i][k];
                  s[i][k]:=s[i][k+1];
                  s[i][k+1]:=c;
                end;
  k:=0;
  for i:=1 to n do
    begin
      t:=1;
      i1:=1;
      i2:=1;
      error:=0;
      repeat
        if st[i1]=s[i][i2]
           then begin
                  i1:=i1+1;
                  i2:=i2+1;
                end
           else if st[i1]<s[i][i2]
                   then i1:=i1+1  
                   else begin
                          i1:=Length(st)+1;
                          i2:=Length(s[i])+1;
                          error:=1;
                        end;
      until (i2=Length(s[i])+1) or (i1=Length(st)+1);
      if (error=0) and (i2=Length(s[i])+1)
         then k:=k+1;
    end; 
  write(f2,k);
  close(f1);
  close(f2);
end.