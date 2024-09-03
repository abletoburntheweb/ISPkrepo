Uses  GraphABC, DrawFraq;
var (m,wx,wy,g) := (100,300,300,10);
 
Procedure KeyDown(k: integer);
begin
case K of
VK_Down: wy -= 10;
VK_Up: wy += 10; 
VK_Left: wx += 10;  
VK_Right: wx -= 10;
VK_Escape: halt(1);
VK_X: if m < 500 then m+=10;
VK_Z: if m > 20 then m-=10;
VK_S: if g < 15 then g+=1;
VK_A: if g > 2 then g -=1;
end;
Window.Clear; 
paint(wx-m,wy,wx+m,wy,g);
Redraw;
end; 
 
Begin
SetWindowSize(700,512);
LockDrawing;
KeyDown(0);
OnkeyDown += KeyDown;
End.