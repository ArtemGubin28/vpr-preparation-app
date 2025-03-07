unit Questions;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, Data.DB,
  Data.Win.ADODB, System.Rtti, FMX.Grid.Style, FMX.Controls.Presentation,
  FMX.ScrollBox, FMX.Grid, Data.Bind.Controls, Data.FMTBcd, DataSnap.DBClient,
  FMX.ExtCtrls, Data.Bind.ObjectScope, Data.Bind.DBScope, Data.Bind.DBXScope,
  Data.Bind.Components, FMX.Layouts, Fmx.Bind.Navigator, FireDAC.Phys.TDBXDef,
  FMX.Effects, Data.SqlExpr, FireDAC.Stan.Intf, FireDAC.Phys,
  FireDAC.Phys.TDBXBase, FireDAC.Phys.TDBX, Data.Bind.EngExt, Fmx.Bind.DBEngExt,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.FMXUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FMX.StdCtrls, FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MSAcc,
  FireDAC.Phys.MSAccDef, FireDAC.Phys.ODBC, FireDAC.Phys.ODBCDef,
  FireDAC.Phys.ODBCBase, FMX.ListBox, System.Bindings.Outputs, Fmx.Bind.Editors,
  Fmx.Bind.Grid, Data.Bind.Grid, FMX.DateTimeCtrls, FMX.Ani, FMX.Objects,
  System.Generics.Collections, FMX.Menus;

type
  TForm2 = class(TForm)
    ShadowEffect1: TShadowEffect;
    Label1: TLabel;
    Button1: TButton;
    Label2: TLabel;
    Label3: TLabel;
    Button3: TButton;
    ADOQuery1: TADOQuery;
    Button4: TButton;
    Grid1: TGrid;
    Image1: TImage;
    Rectangle1: TRectangle;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    RadioButton4: TRadioButton;
    Button2: TButton;
    Label4: TLabel;
    ADOQuery2: TADOQuery;
    BindingsList1: TBindingsList;
    Button5: TButton;
    ADOConnection1: TADOConnection;
    Button6: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button6Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Numberr, quest, x, z, RandomNumber, Prav: Integer;
  a: double;
  Result, Subject, sql: string;
  Numbers: TArray<Integer>;   // Массив чисел от 1 до 10
  RemainingCount: Integer;    // Количество оставшихся чисел

implementation

{$R *.fmx}

uses Login, Choice, Number;
{$R *.Windows.fmx MSWINDOWS}

// Функция для получения случайного числа без повторений
function GetNextNumber: Integer;
var
  Index: Integer;
begin
  if RemainingCount <= 0 then
    Exit(-1);  // Все числа уже выбраны

  // Выбираем случайный индекс среди оставшихся чисел
  Index := Random(RemainingCount);
  Result := Numbers[Index];  // Возвращаем выбранное число

  // Удаляем использованное число из массива
  Numbers[Index] := Numbers[RemainingCount - 1];
  Dec(RemainingCount);  // Уменьшаем счетчик оставшихся чисел
end;



procedure TForm2.Button1Click(Sender: TObject);
begin
    Button5.Visible := False;
    Button6.Visible := False;
    Subject := Form5.ComboBox1.Text;
    Numberr := 1;
    ADOQuery1.Parameters[0].Value := Numberr;
    quest := quests;
    Subject := Form5.ComboBox1.Text;
    ADOQuery1.Active := False;

    if quest = 6 then
          begin
          if (Form5.ComboBox1.Text = 'Алгебра') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Алгебра_6_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Литература') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Литература_6_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'История') then
              ADOQuery1.SQL.Text := 'SELECT * FROM История_6_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Русский язык') then
              ADOQuery1.SQL.Text := 'SELECT * FROM РусскийЯзык_6_класс WHERE Код = :Number'
          end
    else if quest = 7 then
           begin
          if (Form5.ComboBox1.Text = 'Алгебра') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Алгебра_7_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Литература') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Литература_7_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'История') then
              ADOQuery1.SQL.Text := 'SELECT * FROM История_7_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Русский язык') then
              ADOQuery1.SQL.Text := 'SELECT * FROM РусскийЯзык_7_класс WHERE Код = :Number'
          end
    else if quest = 8 then
           begin
          if (Form5.ComboBox1.Text = 'Алгебра') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Алгебра_8_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Литература') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Литература_8_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'История') then
              ADOQuery1.SQL.Text := 'SELECT * FROM История_8_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Русский язык') then
              ADOQuery1.SQL.Text := 'SELECT * FROM РусскийЯзык_8_класс WHERE Код = :Number'
          end
    else if quest = 9 then
          begin
          if (Form5.ComboBox1.Text = 'Алгебра') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Алгебра_9_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Литература') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Литература_9_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'История') then
              ADOQuery1.SQL.Text := 'SELECT * FROM История_9_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Русский язык') then
              ADOQuery1.SQL.Text := 'SELECT * FROM РусскийЯзык_9_класс WHERE Код = :Number'
          end;

    ADOQuery1.Active := True;

    Label1.Text := ADOQuery1.FieldByName('Вопрос').AsString;


    RadioButton1.Text := ADOQuery1.FieldByName('Ответ1').AsString;
    RadioButton2.Text := ADOQuery1.FieldByName('Ответ2').AsString;
    RadioButton3.Text := ADOQuery1.FieldByName('Ответ3').AsString;
    RadioButton4.Text := ADOQuery1.FieldByName('Ответ4').AsString;
    Label2.Text := ADOQuery1.FieldByName('ВерныйОтвет').AsString;

    Button1.Visible := False;
    Button3.Visible := True;
    Button4.Visible := True;
    Button3.Enabled := False;
end;

procedure TForm2.Button2Click(Sender: TObject);

begin
   ADOQuery2.Parameters[0].Value := Form1.ADOQuery1.FieldByName('FIO').AsString;
   ADOQuery2.Parameters[5].Value := Result;
   ADOQuery2.Parameters[6].Value := Form1.ADOQuery1.FieldByName('Class').AsString;
   ADOQuery2.Parameters[1].Value := Form1.ADOQuery1.FieldByName('Letter').AsString;
   ADOQuery2.Parameters[2].Value := Form1.ADOQuery1.FieldByName('School').AsString;
   ADOQuery2.Parameters[3].Value := Label4.Text;
   ADOQuery2.Parameters[4].Value := Form5.ComboBox1.Text;

   Button3.Visible := False;
   Button4.Visible := False;


   ADOQuery2.SQL.Text := 'INSERT INTO Score VALUES (:FIO, :Score, :Clas, :Letter, :School, :Subject, :Answer)';

   ADOQuery2.ExecSQL;
   Label1.Text := 'Результат записан';
   Button5.Visible := True;
   Button2.Visible := False;
end;

procedure TForm2.Button3Click(Sender: TObject);
begin

    Numberr := GetNextNumber;


    ADOQuery1.Active := False;
    ADOQuery1.Parameters[0].Value := Numberr;
     if quest = 6 then
          begin
          if (Form5.ComboBox1.Text = 'Алгебра') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Алгебра_6_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Литература') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Литература_6_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'История') then
              ADOQuery1.SQL.Text := 'SELECT * FROM История_6_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Русский язык') then
              ADOQuery1.SQL.Text := 'SELECT * FROM РусскийЯзык_6_класс WHERE Код = :Number'
          end
    else if quest = 7 then
           begin
          if (Form5.ComboBox1.Text = 'Алгебра') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Алгебра_7_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Литература') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Литература_7_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'История') then
              ADOQuery1.SQL.Text := 'SELECT * FROM История_7_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Русский язык') then
              ADOQuery1.SQL.Text := 'SELECT * FROM РусскийЯзык_7_класс WHERE Код = :Number'
          end
    else if quest = 8 then
           begin
          if (Form5.ComboBox1.Text = 'Алгебра') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Алгебра_8_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Литература') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Литература_8_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'История') then
              ADOQuery1.SQL.Text := 'SELECT * FROM История_8_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Русский язык') then
              ADOQuery1.SQL.Text := 'SELECT * FROM РусскийЯзык_8_класс WHERE Код = :Number'
          end
    else if quest = 9 then
          begin
          if (Form5.ComboBox1.Text = 'Алгебра') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Алгебра_9_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Литература') then
              ADOQuery1.SQL.Text := 'SELECT * FROM Литература_9_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'История') then
              ADOQuery1.SQL.Text := 'SELECT * FROM История_9_класс WHERE Код = :Number'
          else if (Form5.ComboBox1.Text = 'Русский язык') then
              ADOQuery1.SQL.Text := 'SELECT * FROM РусскийЯзык_9_класс WHERE Код = :Number'
          end;
    ADOQuery1.Active := True;
    Label1.Text := ADOQuery1.FieldByName('Вопрос').AsString;

    if Label1.Text = '' then
       begin
       if Prav > 0 then a := (Prav/KolVoVopr)*100 else a := 0;
       if a >= 90 then Result := '5 (Отлично)'
        else if a >= 80 then Result := '4 (Хорошо)'
          else if a >= 70 then Result := '3 (Удовлетворительно)'
            else if a >= 60 then Result := '2 (Неудовлетворительно)'
       else Result := '1 (Плохо)';

       Button3.Enabled := False;
       Button3.Enabled := False;
       Label1.Text := 'Тестирование завершено';
       Label3.Text := '';
       RadioButton1.Text := 'Количество правильных ответов: ' + IntToStr(Prav);
       RadioButton3.Text := 'Ваша оценка: ' + Result;
       RadioButton2.Text := 'Количество вопросов: ' + IntToStr(KolVoVopr);
       RadioButton4.Text := 'Запишите результат';
       RadioButton1.Enabled := False;
       RadioButton2.Enabled := False;
       RadioButton3.Enabled := False;
       RadioButton4.Enabled := False;
       Button2.Visible := True;
       end
    else
      begin
        RadioButton1.Text := ADOQuery1.FieldByName('Ответ1').AsString;
        RadioButton2.Text := ADOQuery1.FieldByName('Ответ2').AsString;
        RadioButton3.Text := ADOQuery1.FieldByName('Ответ3').AsString;
        RadioButton4.Text := ADOQuery1.FieldByName('Ответ4').AsString;
        Label2.Text := ADOQuery1.FieldByName('ВерныйОтвет').AsString;

        Button4.Enabled := True;
        Button3.Enabled := False;
        Label3.Text := '';
        RadioButton1.IsChecked := False;
        RadioButton2.IsChecked := False;
        RadioButton3.IsChecked := False;
        RadioButton4.IsChecked := False;
      end;

end;

procedure TForm2.Button4Click(Sender: TObject);
begin
   if (RadioButton1.IsChecked) and (Label2.Text = RadioButton1.Text) then
      begin
      Label3.Text := 'Вы ответили: правильно';
      Prav := Prav + 1;
      end
    else if (RadioButton2.IsChecked) and (Label2.Text = RadioButton2.Text) then
      begin
      Label3.Text := 'Вы ответили: правильно';
      Prav := Prav + 1;
      end
    else if (RadioButton3.IsChecked) and (Label2.Text = RadioButton3.Text) then
      begin
      Label3.Text := 'Вы ответили: правильно';
      Prav := Prav + 1;
      end
    else if (RadioButton4.IsChecked) and (Label2.Text = RadioButton4.Text) then
       begin
      Label3.Text := 'Вы ответили: правильно';
      Prav := Prav + 1;
      end
    else
      Label3.Text := 'Вы ответили: неправильно';

    Button4.Enabled := False;
    Button3.Enabled := True;

    if (RadioButton1.IsChecked = False) and (RadioButton2.IsChecked = False) and (RadioButton3.IsChecked = False) and (RadioButton4.IsChecked = False) then
         Label4.Text := Label4.Text + 'Вопрос: ' + Label1.Text + ' - Ответ: --- ; '
    else
    begin
    if RadioButton1.IsChecked then
          Label4.Text := Label4.Text + 'Вопрос: ' + Label1.Text + ' - Ответ: ' + RadioButton1.Text + '; '
        else if RadioButton2.IsChecked then
          Label4.Text := Label4.Text + 'Вопрос: ' + Label1.Text + ' - Ответ: ' + RadioButton2.Text + '; '
        else if RadioButton3.IsChecked then
          Label4.Text := Label4.Text + 'Вопрос: ' + Label1.Text + ' - Ответ: ' + RadioButton3.Text + '; '
        else if RadioButton4.IsChecked then
          Label4.Text := Label4.Text + 'Вопрос: ' + Label1.Text + ' - Ответ: ' + RadioButton4.Text + '; '
    end;


end;

procedure TForm2.Button5Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TForm2.Button6Click(Sender: TObject);
begin
Form2.Visible := False;
Form5.Visible := True;
end;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Close;
end;


procedure TForm2.FormCreate(Sender: TObject);
var
    FullPath: string;
begin
  // Определяем полный путь к файлу базы данных относительно текущей директории приложения
  Image1.Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\point_spot_light_50379_1680x1050.jpg');
  FullPath := ExtractFilePath(ParamStr(0)) + 'Passwords.mdb';
  // Проверка существования файла
  if not FileExists(FullPath) then
  begin
    ShowMessage('Файл базы данных не найден.');
    Exit;
  end;

  // Настройка строки соединения для ADOConnection
  with ADOConnection1 do
  begin
    ConnectionString :=
      'Provider=Microsoft.Jet.OLEDB.4.0;' +
      'Data Source=' + FullPath + ';' +
      'Persist Security Info=False';
    Connected := True;
  end;
end;

procedure TForm2.FormShow(Sender: TObject);
begin
 SetLength(Numbers, KolVoVopr);  // Создаем массив длиной 10
  RemainingCount := Length(Numbers);  // Устанавливаем количество оставшихся чисел
  // Заполняем массив числами от 1 до KolVoVopr
  for var i := Low(Numbers) to High(Numbers) do
    Numbers[i] := i + 1;
end;

initialization
  Randomize;  // Инициализируем генератор случайных чисел

  end.
