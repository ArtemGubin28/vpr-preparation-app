unit Login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.ExtCtrls, FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Edit, Windows,
  Data.DB, Data.Win.ADODB, FMX.ListBox;

type
  TForm1 = class(TForm)
    Z: TImage;
    Rectangle1: TRectangle;
    Circle1: TCircle;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Line2: TLine;
    Line1: TLine;
    Edit2: TEdit;
    RoundRect1: TRoundRect;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    RoundRect2: TRoundRect;
    RoundRect3: TRoundRect;
    Label6: TLabel;
    ADOQuery1: TADOQuery;
    Label7: TLabel;
    ADOQuery2: TADOQuery;
    ADOConnection1: TADOConnection;
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
    procedure RoundRect3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  KolVoVopr, quests: Integer;
  Role: string;


implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

uses Score, Questions, Registration, Choice;



procedure TForm1.FormCreate(Sender: TObject);
var
    FullPath: string;
begin
  Z.Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\ca64507e-6b8d-449a-9dfc-052c9e95272b.jpeg');
  Image2.Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\graduation-hat.png');
  // Определяем полный путь к файлу базы данных относительно текущей директории приложения
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

procedure TForm1.RoundRect1Click(Sender: TObject);
var
  Login, Password: string;

begin
  Login := Edit1.Text;
  Password := Edit2.Text;

  ADOQuery1.Active := False;
  ADOQuery1.Parameters[0].Value := Login;
  ADOQuery1.Parameters[1].Value := Password;
  ADOQuery1.SQL.Text := 'SELECT * FROM pass WHERE Login = :Login AND Password = :Password';
  ADOQuery1.Active := True;
  Role := ADOQuery1.FieldByName('Role').AsString;

  If (Login = ADOQuery1.FieldByName('Login').AsString) and (Password = ADOQuery1.FieldByName('Password').AsString) then
     If (Role='Ученик') then
      begin
        Form5.Visible := True;
        Form1.Visible := False
      end
     else  If (Role='Учитель') then
      begin
        Form3.Visible := True;
        Form1.Visible := False
      end
  else
     Label7.Visible := True;


end;

procedure TForm1.RoundRect2Click(Sender: TObject);
begin
MessageBox(0, 'Обратитесь к классному руководителю.', '', MB_ICONINFORMATION or MB_OK);
end;



procedure TForm1.RoundRect3Click(Sender: TObject);
begin
  Form4.Visible := True;
  Form1.Visible := False;
  Form4.Edit1.Text := '';
  Form4.Edit2.Text := '';
  Form4.Edit3.Text := '';
end;

end.
