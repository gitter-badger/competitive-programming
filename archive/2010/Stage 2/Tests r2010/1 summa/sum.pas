Program Summ;
var
  n,i,a,b,c:longint;
  sum,max:int64; 
  f1,f2:text;
begin
  assign(f1,'sum.in');
  reset(f1);
  assign(f2,'sum.out');
  rewrite(f2);
  read(f1,n);
  read(f1,a,b,c);
  sum:=a+b+c;
  max:=sum;
  for i:=4 to n do
    begin
      sum:=sum-a;
      a:=b;
      b:=c;
      read(f1,c);
      sum:=sum+c;
      if sum>max
         then max:=sum;
    end;
  write(f2,max);
  close(f1);
  close(f2);
end.