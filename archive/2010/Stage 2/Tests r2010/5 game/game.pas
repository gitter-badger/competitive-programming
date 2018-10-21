Program Game;
const inf=101;
var
  a:array[1..100,1..100] of integer;
  x,l,p,pr:array[0..100] of integer;
  n,k,i,j,lmax:integer;
  f1,f2:text;
function min(a,b:integer):integer;
  begin
    if a<b
       then min:=a
       else min:=b;
  end;
function max(a,b:integer):integer;
  begin
    if a>b
       then max:=a
       else max:=b;
  end;
begin
  assign(f1,'game.in');
  reset(f1);
  assign(f2,'game.out');
  rewrite(f2);
  read(f1,n,k);
  for i:=1 to n do
    read(f1,x[i]);
  for i:=1 to n do
    for j:=1 to n do
      a[i,j]:=inf;
  for i:=1 to n do
    if x[i]=0
       then begin
              for j:=max(1,i-k) to min(i+k,n) do
                a[i,j]:=1; {move}
              a[i,i]:=inf;  
            end
       else a[i,i+x[i]]:=0; {automove}
{  for i:=1 to n do
    begin
      for j:=1 to n do
        write(f2,a[i,j]:4);
      writeln(f2);  
    end;}
  for i:=1 to n do
    begin
      l[i]:=inf;
      p[i]:=0;
      pr[i]:=0;
    end;
  l[1]:=0;
  i:=1;
  repeat
    p[i]:=1;
    for j:=1 to n do
      if (p[j]=0) and (a[i,j]<>inf) and (l[j]>l[i]+a[i,j])
         then begin
                l[j]:=l[i]+a[i,j];
                pr[j]:=i;
              end;
    lmax:=inf;
    for j:=1 to n do
      if (p[j]=0) and (l[j]<lmax)
         then begin
                lmax:=l[j];
                i:=j;
              end;
  until lmax=inf;
  if l[n]<inf
     then begin
            writeln(f2,l[n]);
            for i:=1 to n do
              l[i]:=0;
            j:=0;  
            i:=n;
            while i<>0 do
              begin
                j:=j+1;
                l[j]:=i;
                i:=pr[i];
              end;
              
            for i:=j-1 downto 1 do
              if x[l[i+1]]=0
                 then write(f2,l[i]-l[i+1],' ');
              {write(f2,l[i],' ');}   
          end
     else write(f2,'NO');
  close(f1);
  close(f2);
end.