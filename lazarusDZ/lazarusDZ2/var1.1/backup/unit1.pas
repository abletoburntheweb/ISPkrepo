unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  a: integer;
  f,x,y: real;
  begin
    if (Edit1.Text = '') then
    begin
      ShowMessage('Заполните поле')
   end
    else if (not TryStrToInt(Edit1.Text,a)) then
    begin
      ShowMessage('Ошибка ввода')
      end
      else
      begin
        x:=strtoint(edit1.text);
        f:= sqr(x+1/x-1) + 18*x*sqr(y);
        edit2.text:=floattostr(f);
      end;
    end;

end.

