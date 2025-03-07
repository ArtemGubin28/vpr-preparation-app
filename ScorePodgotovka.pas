unit ScorePodgotovka;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Grid, Data.Win.ADODB, Data.DB, FMX.Menus, FMX.StdCtrls;

type
  TFormOtv = class(TForm)
    ADOQuery1: TADOQuery;
    BindingsList1: TBindingsList;
    BindSourceDB1: TBindSourceDB;
    Grid1: TGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    ADOConnection1: TADOConnection;
    Button1: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormOtv: TFormOtv;

implementation

{$R *.fmx}

uses Login, Choice;

procedure TFormOtv.Button1Click(Sender: TObject);
begin
  FormOtv.Visible := False;
  Form5.Visible := True;
end;

procedure TFormOtv.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Close;
end;

procedure TFormOtv.FormCreate(Sender: TObject);
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
  ADOQuery1.Active := True;
end;

end.
