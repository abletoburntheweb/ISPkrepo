unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var x:integer;
f:real;
begin
x:=strtoint(edit1.text);
f:=1/(sqr(x+1)+2)+exp(5*ln(x))-sqrt(x);
edit2.text:=floattostr(f);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
   edit1.text:='';
   edit2.text:='';
   Mouse.CursorPos:= ClientToScreen(edit1.BoundsRect.TopLeft);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

end;




end.

