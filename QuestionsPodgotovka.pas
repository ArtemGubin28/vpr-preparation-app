unit QuestionsPodgotovka;

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
  System.Generics.Collections, FMX.Menus, Winapi.Windows;

type
  TFormPodgotovka = class(TForm)
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
  FormPodgotovka: TFormPodgotovka;
 Prav: Integer;


implementation

{$R *.fmx}

uses Login, Choice, Number, ScorePodgotovka;
{$R *.Windows.fmx MSWINDOWS}





procedure TFormPodgotovka.Button1Click(Sender: TObject);
begin
  ADOQuery2.SQL.Text := 'DELETE FROM ВременныеДанные';
  ADOQuery2.ExecSQL;
    Button5.Visible := False;
    Button6.Visible := False;

    Form1.ADOQuery2.ExecSQL;

    Label1.Text := Form1.ADOQuery2.FieldByName('Вопрос').AsString;

    RadioButton1.Text := Form1.ADOQuery2.FieldByName('Ответ1').AsString;
    RadioButton2.Text := Form1.ADOQuery2.FieldByName('Ответ2').AsString;
    RadioButton3.Text := Form1.ADOQuery2.FieldByName('Ответ3').AsString;
    RadioButton4.Text := Form1.ADOQuery2.FieldByName('Ответ4').AsString;
    Label2.Text := Form1.ADOQuery2.FieldByName('ВерныйОтвет').AsString;

    Button1.Visible := False;
    Button3.Visible := True;
    Button4.Visible := True;
    Button3.Enabled := False;


end;

procedure TFormPodgotovka.Button2Click(Sender: TObject);

begin
    FormPodgotovka.Visible := False;
    FormOtv.Visible := True;

   Button3.Visible := False;
   Button4.Visible := False;

   Button6.Visible := True;
   Button5.Visible := True;
    FormOtv.ADOQuery1.Active := False;
    FormOtv.ADOQuery1.Active := True;
end;

procedure TFormPodgotovka.Button3Click(Sender: TObject);
begin

    Form1.ADOQuery2.Next;
    if not Form1.ADOQuery2.Eof then
    begin

    Label1.Text := Form1.ADOQuery2.FieldByName('Вопрос').AsString;

    RadioButton1.Text := Form1.ADOQuery2.FieldByName('Ответ1').AsString;
    RadioButton2.Text := Form1.ADOQuery2.FieldByName('Ответ2').AsString;
    RadioButton3.Text := Form1.ADOQuery2.FieldByName('Ответ3').AsString;
    RadioButton4.Text := Form1.ADOQuery2.FieldByName('Ответ4').AsString;
    Label2.Text := Form1.ADOQuery2.FieldByName('ВерныйОтвет').AsString;

    Button4.Enabled := True;
    Button3.Enabled := False;
    Label3.Text := '';
    RadioButton1.IsChecked := False;
    RadioButton2.IsChecked := False;
    RadioButton3.IsChecked := False;
    RadioButton4.IsChecked := False;
    end
    else  if Form1.ADOQuery2.Eof then
       begin
       Button3.Enabled := False;
       Button3.Enabled := False;
       Label1.Text := 'Тестирование завершено';
       Label3.Text := '';
       RadioButton1.Text := 'Количество правильных ответов: ' + IntToStr(Prav);
       RadioButton3.Text := '';
       RadioButton2.Text := '';
       RadioButton4.Text := '';
       RadioButton1.Enabled := False;
       RadioButton2.Enabled := False;
       RadioButton3.Enabled := False;
       RadioButton4.Enabled := False;
       Button2.Visible := True;
       end;
end;

procedure TFormPodgotovka.Button4Click(Sender: TObject);
begin
  ADOQuery1.Parameters[0].Value := Label1.Text;
  ADOQuery1.Parameters[1].Value := Label2.Text;

   if (RadioButton1.IsChecked) and (Label2.Text = RadioButton1.Text) then
      begin
      Label3.Text := 'Вы ответили: правильно';
      Prav := Prav + 1;
      ADOQuery1.Parameters[2].Value := RadioButton1.Text;
      ADOQuery1.SQL.Text := 'INSERT INTO ВременныеДанные VALUES (:Vopr, :PravOtv, :Otv)';
      ADOQuery1.ExecSQL
      end
    else if (RadioButton2.IsChecked) and (Label2.Text = RadioButton2.Text) then
      begin
      Label3.Text := 'Вы ответили: правильно';
      Prav := Prav + 1;
      ADOQuery1.Parameters[2].Value := RadioButton1.Text;
      ADOQuery1.SQL.Text := 'INSERT INTO ВременныеДанные VALUES (:Vopr, :PravOtv, :Otv)';
      ADOQuery1.ExecSQL
      end
    else if (RadioButton3.IsChecked) and (Label2.Text = RadioButton3.Text) then
      begin
      Label3.Text := 'Вы ответили: правильно';
      Prav := Prav + 1;
      ADOQuery1.Parameters[2].Value := RadioButton1.Text;
      ADOQuery1.SQL.Text := 'INSERT INTO ВременныеДанные VALUES (:Vopr, :PravOtv, :Otv)';
      ADOQuery1.ExecSQL
      end
    else if (RadioButton4.IsChecked) and (Label2.Text = RadioButton4.Text) then
       begin
      Label3.Text := 'Вы ответили: правильно';
      Prav := Prav + 1;
      ADOQuery1.Parameters[2].Value := RadioButton1.Text;
      ADOQuery1.SQL.Text := 'INSERT INTO ВременныеДанные VALUES (:Vopr, :PravOtv, :Otv)';
      ADOQuery1.ExecSQL
      end
    else
      begin
      Label3.Text := 'Вы ответили: неправильно';
      if RadioButton1.IsChecked then
        ADOQuery1.Parameters[2].Value := RadioButton1.Text
      else if RadioButton2.IsChecked then
        ADOQuery1.Parameters[2].Value := RadioButton2.Text
      else if RadioButton3.IsChecked then
        ADOQuery1.Parameters[2].Value := RadioButton3.Text
      else if RadioButton4.IsChecked then
        ADOQuery1.Parameters[2].Value := RadioButton4.Text
      else
        ADOQuery1.Parameters[2].Value := 'Нет ответа';

      ADOQuery1.SQL.Text := 'INSERT INTO ВременныеДанные VALUES (:Vopr, :PravOtv, :Otv)';
      ADOQuery1.ExecSQL
      end;

    Button4.Enabled := False;
    Button3.Enabled := True;


end;

procedure TFormPodgotovka.Button5Click(Sender: TObject);
begin
  Form1.Close;
end;

procedure TFormPodgotovka.Button6Click(Sender: TObject);
begin
FormPodgotovka.Visible := False;
Form5.Visible := True;
end;

procedure TFormPodgotovka.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Close;
end;


procedure TFormPodgotovka.FormCreate(Sender: TObject);
var
    FullPath: string;
begin
  Prav := 0;
  // Определяем полный путь к файлу базы данных относительно текущей директории приложения
  Image1.Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\point_spot_light_50379_1680x1050.jpg');
  FullPath := ExtractFilePath(ParamStr(0)) + 'Passwords.mdb';
  // Проверка существования файла
  if not FileExists(FullPath) then
  begin
    MessageBox(0, 'Файл базы данных не найден.', '', MB_ICONINFORMATION or MB_OK);
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

end.
