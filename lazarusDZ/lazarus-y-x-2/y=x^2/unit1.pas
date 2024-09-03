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
    Edit3: TEdit;
    Edit4: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Label2Click(Sender: TObject);
begin

end;

procedure TForm1.Button1Click(Sender: TObject);
var
  a,b,h,y,x:integer;
begin
    if (Edit1.Text = '') or (Edit2.Text = '') or (Edit3.Text = '') then
    begin
      ShowMessage('Заполните все поля')
    end
    else if (not TryStrToInt(Edit1.Text,a)) or (not TryStrToInt(Edit2.Text,b)) or (not TryStrToInt(Edit3.Text,h)) then
    begin
      ShowMessage('Ошибка ввода')
    end
    else if (a > b) or (a = b)then
    begin
      ShowMessage('Не верные параметры области (a,b)')
    end
    else if (h < 1)then
    begin
      ShowMessage('Шаг не может быть меньше 1')
    end
    else
    begin
      x:=a;
      while x<=b do
      begin
        y:=x*x;
        Edit4.Text:= Edit4.Text + IntToStr(y) + ', ';
        x+=h;
      end;
    end;
end;

end.

