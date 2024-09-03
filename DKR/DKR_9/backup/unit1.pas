unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons;

type

  { TFmain }

  TFmain = class(TForm)
    PlatformComboBox: TComboBox;
    Naimenov: TEdit;
    Nextt: TButton;
    Plat: TLabel;
    Previouss: TButton;
    Razrab: TEdit;
    Rating: TEdit;
    Rate: TLabel;
    LightCheckbox: TCheckBox;
    Naimen: TLabel;
    Razr: TLabel;
    Zvezd: TLabel;
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure NexttClick(Sender: TObject);
    procedure PrevioussClick(Sender: TObject);
    procedure NaimenClick(Sender: TObject);
    procedure NaimenovChange(Sender: TObject);
    procedure PlatClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject); // Добавляем эту процедуру
  private
    procedure GetRow(i: integer);
    procedure editdata(i: integer);
  public

  end;

var
  Fmain: TFmain;
  Data: TStringList;
  cur_row: integer;
  SelectedComboBoxItem: string; // Добавляем переменную для хранения выбранного значения комбобокса

implementation

{$R *.lfm}

{ TFmain }

procedure TFmain.FormShow(Sender: TObject);
Begin
  Data := TStringList.Create;
  cur_row := 0;
  if FileExists('data.txt') then begin
     Data.LoadFromFile('data.txt');
     GetRow(cur_row);
  end;
  // Загрузка сохраненного значения комбобокса при отображении формы
  if SelectedComboBoxItem <> '' then
    PlatformComboBox.ItemIndex := PlatformComboBox.Items.IndexOf(SelectedComboBoxItem);
end;

procedure TFmain.NexttClick(Sender: TObject);
begin
  editdata(cur_row);
  if cur_row < Data.Count - 1 then
  begin
    cur_row := cur_row + 1;
    GetRow(cur_row);
  end
  else
  begin
    Data.Add('');
    cur_row += 1;
    Naimenov.Clear;
    Razrab.Clear;
    LightCheckbox.Checked := False;
    PlatformComboBox.ItemIndex := -1;
    Rating.Clear;
  end;
end;

procedure TFmain.PrevioussClick(Sender: TObject);
begin
  editdata(cur_row);
  if cur_row > 0 then
  begin
    cur_row := cur_row - 1;
    GetRow(cur_row);
  end;
end;

procedure TFmain.NaimenClick(Sender: TObject);
begin

end;

procedure TFmain.NaimenovChange(Sender: TObject);
begin

end;

procedure TFmain.PlatClick(Sender: TObject);
begin

end;

procedure TFmain.ComboBox1Change(Sender: TObject); // Обновляем выбранное значение комбобокса
begin
  SelectedComboBoxItem := PlatformComboBox.Text;
end;

procedure TFmain.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin
  editdata(cur_row);
  Data.SaveToFile('data.txt');
end;

procedure TFmain.FormCreate(Sender: TObject);
begin

end;

procedure TFmain.GetRow(i: integer);
var
  str: string;
begin
  str := Data.Strings[i];

  Naimenov.Text := Copy(str, 1, Pos(',', str) - 1);
  Delete(str, 1, Pos(',', str));

  Razrab.Text := Copy(str, 1, Pos(',', str) - 1);
  Delete(str, 1, Pos(',', str));

  if Copy(str, 1, Pos(',', str) - 1) = 'True' then
    LightCheckbox.Checked := True
  else
    LightCheckbox.Checked := False;
  Delete(str, 1, Pos(',', str));

  PlatformComboBox.Text := Copy(str, 1, Pos(',', str) - 1);
  Delete(str, 1, Pos(',', str));

  Rating.Text := str;

  // Установка выбранного элемента ComboBox1 на основе сохраненной строки
  SelectedComboBoxItem := PlatformComboBox.Text;
end;

procedure TFmain.editdata(i: integer);
var
  str: string;
begin
  if LightCheckbox.Checked then
    str := 'True'
  else
    str := 'False';

  Data.Strings[i] := Naimenov.Text + ',' + Razrab.Text + ',' + str + ',' + PlatformComboBox.Text + ',' + Rating.Text;
end;

end.
