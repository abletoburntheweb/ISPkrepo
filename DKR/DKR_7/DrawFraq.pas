unit DrawFraq;
interface
Procedure paint(x1,y1,x2,y2,k:integer);
implementation
uses GraphABC;
Procedure paint(x1,y1,x2,y2,k:integer);
begin
If k>0 then begin
var xn:=(x1+x2) div 2 +(y2-y1) div 2;
var yn:=(y1+y2) div 2 -(x2-x1) div 2;
paint(x1,y1,xn,yn,k-1);
paint(x2,y2,xn,yn,k-1)
end
else line(x1,y1,x2,y2)
end;
end.