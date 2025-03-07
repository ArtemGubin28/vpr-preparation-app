unit Score;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Fmx.Bind.Grid,
  System.Bindings.Outputs, Fmx.Bind.Editors, Data.Bind.Components,
  Data.Bind.Grid, Data.Bind.DBScope, FMX.Controls.Presentation, FMX.ScrollBox,
  FMX.Grid, Data.Win.ADODB, Data.DB, FMX.Menus;

type
  TForm3 = class(TForm)
    ADOQuery1: TADOQuery;
    BindingsList1: TBindingsList;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem11: TMenuItem;
    MenuItem12: TMenuItem;
    MenuItem13: TMenuItem;
    MenuItem14: TMenuItem;
    MenuItem15: TMenuItem;
    MenuItem16: TMenuItem;
    BindSourceDB1: TBindSourceDB;
    MenuItem17: TMenuItem;
    MenuItem18: TMenuItem;
    MenuItem19: TMenuItem;
    MenuItem20: TMenuItem;
    MenuItem21: TMenuItem;
    MenuItem22: TMenuItem;
    MenuItem23: TMenuItem;
    MenuItem24: TMenuItem;
    MenuItem25: TMenuItem;
    MenuItem26: TMenuItem;
    MenuItem27: TMenuItem;
    MenuItem28: TMenuItem;
    MenuItem29: TMenuItem;
    MenuItem30: TMenuItem;
    MenuItem31: TMenuItem;
    MenuItem32: TMenuItem;
    MenuItem33: TMenuItem;
    MenuItem34: TMenuItem;
    MenuItem35: TMenuItem;
    MenuItem36: TMenuItem;
    MenuItem37: TMenuItem;
    MenuItem38: TMenuItem;
    MenuItem39: TMenuItem;
    MenuItem40: TMenuItem;
    MenuItem41: TMenuItem;
    MenuItem42: TMenuItem;
    MenuItem43: TMenuItem;
    MenuItem44: TMenuItem;
    MenuItem45: TMenuItem;
    MenuItem46: TMenuItem;
    MenuItem47: TMenuItem;
    MenuItem48: TMenuItem;
    MenuItem49: TMenuItem;
    MenuItem50: TMenuItem;
    MenuItem51: TMenuItem;
    MenuItem52: TMenuItem;
    MenuItem53: TMenuItem;
    MenuItem54: TMenuItem;
    MenuItem55: TMenuItem;
    MenuItem56: TMenuItem;
    MenuItem57: TMenuItem;
    MenuItem58: TMenuItem;
    MenuItem59: TMenuItem;
    MenuItem60: TMenuItem;
    MenuItem61: TMenuItem;
    MenuItem62: TMenuItem;
    MenuItem63: TMenuItem;
    MenuItem64: TMenuItem;
    MenuItem65: TMenuItem;
    MenuItem66: TMenuItem;
    MenuItem67: TMenuItem;
    MenuItem68: TMenuItem;
    Grid1: TGrid;
    LinkGridToDataSourceBindSourceDB1: TLinkGridToDataSource;
    MenuItem69: TMenuItem;
    ADOConnection1: TADOConnection;
    procedure MenuItem5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure MenuItem16Click(Sender: TObject);
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuItem15Click(Sender: TObject);
    procedure MenuItem12Click(Sender: TObject);
    procedure MenuItem13Click(Sender: TObject);
    procedure MenuItem14Click(Sender: TObject);
    procedure MenuItem20Click(Sender: TObject);
    procedure MenuItem21Click(Sender: TObject);
    procedure MenuItem22Click(Sender: TObject);
    procedure MenuItem24Click(Sender: TObject);
    procedure MenuItem25Click(Sender: TObject);
    procedure MenuItem26Click(Sender: TObject);
    procedure MenuItem28Click(Sender: TObject);
    procedure MenuItem29Click(Sender: TObject);
    procedure MenuItem30Click(Sender: TObject);
    procedure MenuItem32Click(Sender: TObject);
    procedure MenuItem33Click(Sender: TObject);
    procedure MenuItem34Click(Sender: TObject);
    procedure MenuItem37Click(Sender: TObject);
    procedure MenuItem38Click(Sender: TObject);
    procedure MenuItem39Click(Sender: TObject);
    procedure MenuItem41Click(Sender: TObject);
    procedure MenuItem42Click(Sender: TObject);
    procedure MenuItem43Click(Sender: TObject);
    procedure MenuItem45Click(Sender: TObject);
    procedure MenuItem46Click(Sender: TObject);
    procedure MenuItem47Click(Sender: TObject);
    procedure MenuItem49Click(Sender: TObject);
    procedure MenuItem50Click(Sender: TObject);
    procedure MenuItem51Click(Sender: TObject);
    procedure MenuItem54Click(Sender: TObject);
    procedure MenuItem55Click(Sender: TObject);
    procedure MenuItem56Click(Sender: TObject);
    procedure MenuItem58Click(Sender: TObject);
    procedure MenuItem59Click(Sender: TObject);
    procedure MenuItem60Click(Sender: TObject);
    procedure MenuItem62Click(Sender: TObject);
    procedure MenuItem63Click(Sender: TObject);
    procedure MenuItem64Click(Sender: TObject);
    procedure MenuItem66Click(Sender: TObject);
    procedure MenuItem67Click(Sender: TObject);
    procedure MenuItem68Click(Sender: TObject);
    procedure MenuItem69Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

uses Login;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Form1.Close;
end;

procedure TForm3.FormCreate(Sender: TObject);
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

procedure TForm3.MenuItem10Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "8" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem11Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "8" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem12Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "9" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem13Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "9" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem14Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "9" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem15Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "8" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem16Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "7" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem20Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "6" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem21Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "6" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem22Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "6" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem24Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "7" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem25Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "7" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem26Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "7" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem28Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "8" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem29Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "8" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem30Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "8" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem32Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "9" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem33Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "9" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem34Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "9" and Subject = "Русский язык";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem37Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "6" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem38Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "6" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem39Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "6" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem41Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "7" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem42Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "7" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem43Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "7" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem45Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "8" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem46Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "8" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem47Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "8" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem49Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "9" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem50Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "9" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem51Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "9" and Subject = "Литература";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem54Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "6" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem55Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "6" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem56Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "6" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem58Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "7" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem59Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "7" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem5Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "6" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem60Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "7" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem62Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "8" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem63Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "8" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem64Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "8" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem66Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "9" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem67Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "9" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem68Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "9" and Subject = "История";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem69Click(Sender: TObject);
begin
   ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem6Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "6" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem7Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "В" and Class = "6" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem8Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "А" and Class = "7" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

procedure TForm3.MenuItem9Click(Sender: TObject);
begin
    ADOQuery1.Active := False;
    ADOQuery1.SQL.Text := 'SELECT * FROM Score WHERE Letter = "Б" and Class = "7" and Subject = "Алгебра";';
    ADOQuery1.Active := True;
end;

end.
