unit Registration;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Objects, FMX.Controls.Presentation, FMX.Edit, FMX.ListBox, FMX.ComboEdit,
  Data.DB, Data.Win.ADODB;

type
  TForm4 = class(TForm)
    Image1: TImage;
    Rectangle1: TRectangle;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    RoundRect3: TRoundRect;
    Label6: TLabel;
    Регистрация: TLabel;
    Brush1: TBrushObject;
    ADOQuery1: TADOQuery;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    Label1: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    ADOConnection1: TADOConnection;
    Label5: TLabel;
    ComboBox4: TComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RoundRect3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox4ClosePopup(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.fmx}

uses Login;



procedure TForm4.ComboBox4ClosePopup(Sender: TObject);
begin
if ComboBox4.Text = 'Учитель' then
  begin
    Label3.Visible := False;
    Label4.Visible := False;
    ComboBox1.Visible := False;
    ComboBox2.Visible := False;
  end
else
begin
    Label3.Visible := True;
    Label4.Visible := True;
    ComboBox1.Visible := True;
    ComboBox2.Visible := True;
  end
end;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Visible := True;
  Form4.Visible := False;
end;


procedure TForm4.FormCreate(Sender: TObject);
var
    FullPath: string;
begin
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

procedure TForm4.RoundRect3Click(Sender: TObject);
var Login, Password, Role, School, Letter, FIO, Clas: string;

begin
  Login := Edit1.Text;
  Password := Edit2.Text;
  FIO := Edit3.Text;
  Clas := ComboBox1.Text;
  Letter := ComboBox2.Text;
  School := ComboBox3.Text;
  Role := ComboBox4.Text;

  if (Login = '') or (Password = '') or (FIO = '') or (Role = '') then
      ShowMessage('Не все поля заполнены!')
  else
      begin
  ADOQuery1.Parameters[0].Value := Login;
  ADOQuery1.Parameters[1].Value := Password;
  if Role = 'Учитель' then
      ADOQuery1.Parameters[2].Value := Null
  else
  ADOQuery1.Parameters[2].Value := Clas;
  ADOQuery1.Parameters[3].Value := Letter;
  ADOQuery1.Parameters[4].Value := School;
  ADOQuery1.Parameters[5].Value := FIO;
  ADOQuery1.Parameters[6].Value := Role;


        ADOQuery1.SQL.Text := 'INSERT INTO pass VALUES (:Login, :Password, :FIO, :Clas, :Letter, :Role, :School)';
        ADOQuery1.ExecSQL;
        Form4.Visible := False;
        Form1.Visible := True;

        ShowMessage('Вы успешно зарегистрировались. Теперь авторизуйтесь!');
      end;

end;

end.
