unit cod_2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, math;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2Click: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Label1: TLabel;
    Label10: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2ClickClick(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Edit1Change(Sender: TObject);
begin

end;

procedure TForm1.Button2ClickClick(Sender: TObject);
begin
edit1.clear;
edit2.clear;
edit3.clear;
edit4.clear;
edit5.clear;
Label7.caption:='alfa=';
Label8.caption:='betta=';
Label9.caption:='gamma=';
Mouse.CursorPos:= ClientToScreen(edit1.BoundsRect.TopLeft);

end;

procedure TForm1.Button1Click(Sender: TObject);
var a,b,c,P:integer;
alfa,betta,gamma,S,r:real;
begin

a:=strtoint(edit1.text);
b:=strtoint(edit2.text);
c:=strtoint(edit3.text);
P:= a+b+c;
r:=P/2;
S:=sqrt(r*(r-a)*(r-b)*(r-c));
alfa:=arccos((sqr(b)+sqr(a)-sqr(a))/(2*b*c));
betta:=arcsin(b/a*sin(alfa));
gamma:=pi-(alfa+betta);
alfa:=alfa*180/pi;
betta:=betta*180/pi;
gamma:=gamma*180/pi;
Label7.caption:='alfa='+floattostr(alfa);
Label8.caption:='betta='+floattostr(betta);
Label9.caption:='gamma='+floattostr(gamma);
Edit4.text:=inttostr(P);
Edit5.text:=floattostr(S);
end;



end.


