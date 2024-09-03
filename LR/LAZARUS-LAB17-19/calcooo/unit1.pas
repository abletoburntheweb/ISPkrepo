unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Math, fpexprpars;

type

  { TForm1 }

  TForm1 = class(TForm)
    ButtonKop: TButton;
    ButtonDelenie: TButton;
    ButtonKvadrat: TButton;
    ButtonYmnozhenie: TButton;
    ButtonMinus: TButton;
    Button9: TButton;
    ButtonC: TButton;
    ButtonDelenieNaX: TButton;
    ButtonRavno: TButton;
    ButtonZapytay: TButton;
    Button3: TButton;
    Button5: TButton;
    Button1: TButton;
    Button2: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button4: TButton;
    ButtonCE: TButton;
    ButtonStrelka: TButton;
    Button0: TButton;
    ButtonPlys: TButton;
    Pole: TEdit;
    procedure Button0Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure ButtonCClick(Sender: TObject);
    procedure ButtonCEClick(Sender: TObject);
    procedure ButtonDelenieClick(Sender: TObject);
    procedure ButtonDelenieNaXClick(Sender: TObject);
    procedure ButtonKopClick(Sender: TObject);
    procedure ButtonKvadratClick(Sender: TObject);
    procedure ButtonMinusClick(Sender: TObject);
    procedure ButtonPlysClick(Sender: TObject);
    procedure ButtonRavnoClick(Sender: TObject);
    procedure ButtonStrelkaClick(Sender: TObject);
    procedure ButtonYmnozhenieClick(Sender: TObject);
    procedure ButtonZapytayClick(Sender: TObject);
    procedure PoleKeyPress(Sender: TObject; var Key: Char);
    function HasCommaInLastNumber: Boolean;
    function Evaluate(Expression: String): Double;
  private
    LastInputIsOperation: Boolean;
  public

  end;

var
  Form1: TForm1;
  bls: boolean;

implementation

{$R *.lfm}

{ TForm1 }

function TForm1.HasCommaInLastNumber: Boolean;
var
  i: Integer;
begin
  Result := False;
  for i := Length(Pole.Text) downto 1 do
  begin
    if Pole.Text[i] in ['+', '-', '*', '/'] then Break;                       в
    if Pole.Text[i] = ',' then
    begin
      Result := True;
      Break;
    end;
  end;
end;

procedure TForm1.PoleKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then // Enter
  begin
    ButtonRavnoClick(Sender);
    Key := #0;
  end
  else if Key = #8 then // Backspace
  begin
    if Pole.SelLength > 0 then
    begin
      // Удаление выделенного текста
      Pole.Text := Copy(Pole.Text, 1, Pole.SelStart) + Copy(Pole.Text, Pole.SelStart + Pole.SelLength + 1, Length(Pole.Text));
      LastInputIsOperation := False;
    end
    else if Length(Pole.Text) > 0 then
    begin

      Pole.Text := Copy(Pole.Text, 1, Length(Pole.Text) - 1);
      LastInputIsOperation := False;
    end;
    Key := #0;
  end
  else if Key in ['0'..'9', #8, '+', '*', '/', ',', ')', '('] then
  begin
    if (Key in ['+', '*', '/', ',']) and ((Pole.Text = '') or not (Pole.Text[Length(Pole.Text)] in ['0'..'9', ')'])) then
       Key := #0
    else if Key = '-' then
      if (Pole.Text = '') or (Pole.Text[Length(Pole.Text)] in ['+', '-', '*', '/', ' ']) then
        LastInputIsOperation := True
      else
        Key := #0
    else if (Key = ',') and (LastInputIsOperation or HasCommaInLastNumber or (Pole.Text = '')) then
      Key := #0
    else
      LastInputIsOperation := Key in ['+', '-', '*', '/'];
  end
  else
    Key := #0;
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  if bls = False then begin
  Pole.Text:='';
  bls:=True;
  end;
 Pole.Text:=Pole.Text+'7';
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
  Pole.Text:=Pole.Text+'4';
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if bls = False then begin
  Pole.Text:='';
  bls:=True;
  end;
  // Check if the display shows an error message
  if Pos('Ошибка:', Pole.Text) = 1 then Exit;

  if Pole.Text = '0' then
    Pole.Text := '1'
  else
    Pole.Text := Pole.Text + '1';
end;

procedure TForm1.Button0Click(Sender: TObject);
begin
  if bls = False then begin
  Pole.Text:='';
  bls:=True;
  end;
  Pole.Text:=Pole.Text+'0';
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  if bls = False then begin
  Pole.Text:='';
  bls:=True;
  end;
  if Pos('Ошибка:', Pole.Text) = 1 then Exit;
  Pole.Text := Pole.Text + '2';
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  if bls = False then begin
  Pole.Text:='';
  bls:=True;
  end;
  if Pos('Ошибка:', Pole.Text) = 1 then Exit;
  Pole.Text := Pole.Text + '3';
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  if bls = False then begin
  Pole.Text:='';
  bls:=True;
  end;
  Pole.Text:=Pole.Text+'5';
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  if bls = False then begin
  Pole.Text:='';
  bls:=True;
  end;
  Pole.Text:=Pole.Text+'6';
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  if bls = False then begin
  Pole.Text:='';
  bls:=True;
  end;
  Pole.Text:=Pole.Text+'8';
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  if bls = False then begin
  Pole.Text:='';
  bls:=True;
  end;
  Pole.Text:=Pole.Text+'9';
end;

procedure TForm1.ButtonPlysClick(Sender: TObject);
begin
  if Pole.Text = 'На ноль делить нельзя' then
  begin
    Pole.Text := '0';
    LastInputIsOperation := False;
  end
  else if (Pole.Text <> '') and (Pole.Text[Length(Pole.Text)] in ['0'..'9', ')']) then
  begin
    Pole.Text := Pole.Text + '+';
    LastInputIsOperation := true;
  end;
end;

procedure TForm1.ButtonMinusClick(Sender: TObject);
var
textLength: Integer;
lastChar: Char;
begin
textLength := Length(Pole.Text);
if textLength > 0 then
begin
lastChar := Pole.Text[textLength];

if (lastChar in ['+', '-', '*', '/']) then
begin
if lastChar <> '-' then // Если последний символ не минус, добавляем минус
Pole.Text := Pole.Text + '-';
end
else
if LastInputIsOperation then // Если последний ввод был операцией, добавляем минус
Pole.Text := Pole.Text + '-';
end
else
Pole.Text := Pole.Text + '-'; // Если ввод первый, добавляем минус

LastInputIsOperation := True;
end;

procedure TForm1.ButtonDelenieClick(Sender: TObject);
begin
   if (Pole.Text <> '') and (Pole.Text[Length(Pole.Text)] in ['0'..'9', ')']) then
  begin
    Pole.Text := Pole.Text + '/';
    LastInputIsOperation := True;
  end;
end;

procedure TForm1.ButtonYmnozhenieClick(Sender: TObject);
begin
   if (Pole.Text <> '') and (Pole.Text[Length(Pole.Text)] in ['0'..'9', ')']) then
  begin
    Pole.Text := Pole.Text + '*';
    LastInputIsOperation := True;
  end;
end;

procedure TForm1.ButtonZapytayClick(Sender: TObject);
begin
   if (Pole.Text <> '') and (Pole.Text[Length(Pole.Text)] in ['0'..'9', ')']) then
  begin
    Pole.Text := Pole.Text + ',';
    LastInputIsOperation := False;
  end;
end;


procedure TForm1.ButtonStrelkaClick(Sender: TObject);
begin
  if Length(Pole.Text) > 0 then
  begin
    Pole.Text := Copy(Pole.Text, 1, Length(Pole.Text) - 1);
    LastInputIsOperation := False;
  end;
end;

procedure TForm1.ButtonKopClick(Sender: TObject);
var
  InputValue: Double;
begin
  try
    InputValue := StrToFloat(Pole.Text);
    if InputValue <= 0 then  begin
      raise Exception.Create('Корень извлечь нельзя');
      bls:=false;
    end;
    InputValue := sqrt(InputValue);
    Pole.Text := FloatToStr(InputValue);
    LastInputIsOperation := False;
  except
    on E: Exception do
    begin
      Pole.Text := 'Ошибка: ' + E.Message;
    end;
  end;
end;

procedure TForm1.ButtonKvadratClick(Sender: TObject);
var InputValue: Double;
begin
  try
    InputValue := StrToFloat(Pole.Text);
    InputValue := sqr(InputValue);
    Pole.Text := FloatToStr(InputValue);
    LastInputIsOperation := False;
  except
    on E: Exception do
    begin
      Pole.Text := 'Ошибка: ' + E.Message;
    end;
  end;
end;

procedure TForm1.ButtonDelenieNaXClick(Sender: TObject);
var
  InputValue: Double;
begin
  InputValue := StrToFloatDef(Pole.Text, 0); // Если введено не число, устанавливаем значение по умолчанию 0
  if InputValue = 0 then
    Pole.Text := 'Ошибка: На 0 делить нельзя'
  else
  begin
    InputValue := 1 / InputValue;
    Pole.Text := FloatToStr(InputValue);
    LastInputIsOperation := False;
  end;
end;

procedure TForm1.ButtonCEClick(Sender: TObject);
begin
  if LastInputIsOperation then
    Pole.Text := Copy(Pole.Text, 1, Length(Pole.Text) - 1)

  else
    while (Length(Pole.Text) > 0) and not (Pole.Text[Length(Pole.Text)] in ['+', '-', '*', '/', ' ']) do
      Pole.Text := Copy(Pole.Text, 1, Length(Pole.Text) - 1);

  if Pole.Text = '' then
    Pole.Text := '0';
  LastInputIsOperation := False;
end;
procedure TForm1.ButtonCClick(Sender: TObject);
begin
  Pole.Text := '0';
  LastInputIsOperation := False;
end;

function TForm1.Evaluate(Expression: String): Double;
var
  Scripter: TFPExpressionParser;
begin
  Expression := StringReplace(Expression, ',', '.', [rfReplaceAll]);
  Scripter := TFPExpressionParser.Create(nil);
  try
    Scripter.Expression := Expression;
    try
      Result := ArgToFloat(Scripter.Evaluate);
    except
      on E: EMathError do
        raise Exception.Create('Делить на 0 нельзя');
    end;
  finally
    Scripter.Free;
  end;
end;

procedure TForm1.ButtonRavnoClick(Sender: TObject);
var
  Expression: String;
  ResultValue: Double;
  LastChar: Char;
begin
  Expression := Pole.Text;

  // Check if the current text in Pole is an error message
  if Pos('Ошибка:', Expression) = 1 then
  begin
    Pole.Text := '0';
    LastInputIsOperation := False;
    Exit; // Exit the procedure early
  end;

  if Length(Expression) > 0 then
    LastChar := Expression[Length(Expression)]
  else
    Exit;

  if LastChar in ['+', '-', '*', '/'] then Exit;

  try
    ResultValue := Evaluate(Expression);
    Pole.Text := FloatToStr(ResultValue);
    LastInputIsOperation := False;
  except
    on E: Exception do
    begin
      Pole.Text := 'Ошибка: ' + E.Message;
      LastInputIsOperation := False;
    end;
  end;
end;
end.
