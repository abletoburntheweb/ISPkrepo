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
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }




procedure TForm1.Button1Click(Sender: TObject);
var a,b,c,y:integer;
    S,side,P:real;
begin
    a:=strtoint(edit1.text);
    b:=strtoint(edit2.text);
    c:=strtoint(edit3.text);
    y:=strtoint(edit6.text);
    side:=sqrt((sqr(a-c))+(sqr(b-y)))/sqrt(2);
    edit4.text:=floattostr(side*4);
    edit5.text:=floattostr(side*side);

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    edit1.clear;
    edit2.clear;
    edit3.clear;
    edit6.clear;
    edit4.clear;
    edit5.clear;
end;

end.

