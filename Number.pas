unit Number;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ListBox,
  FMX.Controls.Presentation, FMX.StdCtrls, Winapi.Windows;

type
  TForm6 = class(TForm)
    ComboBox1: TComboBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  table, NumberClass: string;
  kod: integer;

implementation

{$R *.fmx}

uses Questions, Choice, Login, QuestionsPodgotovka;


procedure TForm6.Button1Click(Sender: TObject);
begin

  Form6.Visible := False;
  Form5.Visible := True;
end;

procedure TForm6.Button2Click(Sender: TObject);
var ComBo: string;
begin
kod := StrToInt(ComboBox1.Text[1]);
 quests := Form1.ADOQuery1.FieldByName('Class').AsInteger;

 NumberClass := IntToStr(quests);

 Form1.ADOQuery2.Parameters[0].Value := Form5.ComboBox1.Text;  //предмет
 Form1.ADOQuery2.Parameters[1].Value := Form5.ComboBox2.Text;  //сложность
 Form1.ADOQuery2.Parameters[2].Value := kod; //код вопроса

  table := Form5.ComboBox1.Text + '_' + NumberClass + '_класс_подготовка';

 if ComboBox1.Text <> '' then
   begin
     Form1.ADOQuery2.SQL.Text := 'SELECT * FROM ' + table + ' WHERE Сложность = :Hard AND КодВопроса = :KodVopr';

      Form1.ADOQuery2.Active := True;

      FormPodgotovka.Visible := True;
      Form6.Visible := False;
   end
else
  MessageBox(0, 'Вы не выбрали номер задания!', '', MB_ICONINFORMATION or MB_OK);

end;

end.
