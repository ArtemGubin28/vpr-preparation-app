unit Choice;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, Windows, Winapi.ShellAPI, FMX.ListBox;

type
  TForm5 = class(TForm)
    Image1: TImage;
    RoundRect3: TRoundRect;
    Label6: TLabel;
    RoundRect1: TRoundRect;
    Label1: TLabel;
    RoundRect2: TRoundRect;
    Label2: TLabel;
    RoundRect4: TRoundRect;
    Label3: TLabel;
    Label8: TLabel;
    ComboBox1: TComboBox;
    Label4: TLabel;
    ComboBox2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure RoundRect4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RoundRect3Click(Sender: TObject);
    procedure RoundRect1Click(Sender: TObject);
    procedure RoundRect2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

uses Login, Questions, Number;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
Form1.Close;
end;

procedure TForm5.FormCreate(Sender: TObject);
begin
Image1.Bitmap.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'image\vibor.jpeg');
end;

procedure TForm5.RoundRect1Click(Sender: TObject);
begin
    quests := Form1.ADOQuery1.FieldByName('Class').AsInteger;
    Form1.ADOQuery2.Active := False;
    Form1.ADOQuery2.SQL.Clear;
    NumberClass := IntToStr(quests);
    table := ComboBox1.Text + '_' + NumberClass + '_класс';
   Form1.ADOQuery2.SQL.Text := 'SELECT TOP 1 * FROM ' + table + ' ORDER BY Код DESC';

      if (ComboBox1.Text = '') then
              MessageBox(0, 'Вы не выбрали предмет!', '', MB_ICONINFORMATION or MB_OK)
      else
      begin
      Form1.ADOQuery2.Active := True;
      KolVoVopr := Form1.ADOQuery2.FieldByName('Код').AsInteger;
      quests := Form1.ADOQuery1.FieldByName('Class').AsInteger;

      Form2.Visible := True;
      Form5.Visible := False;
      end;

end;

procedure TForm5.RoundRect2Click(Sender: TObject);
begin
Form6.ComboBox1.Items.Clear;
if ((ComboBox1.Text = '') and (ComboBox2.Text = '')) or ((ComboBox1.Text <> '') and (ComboBox2.Text = '')) then

  begin
    MessageBox(0, 'Выберите предмет и уровень сложности.', '', MB_ICONINFORMATION or MB_OK);
    Label4.Visible := True;
    ComboBox2.Visible := True;
  end


else if (ComboBox1.Text <> '') and (ComboBox2.Text <> '') then
begin
quests := Form1.ADOQuery1.FieldByName('Class').AsInteger;
    if quests = 6 then
    begin
      if ComboBox1.Text = 'Алгебра' then
      begin
      Form6.ComboBox1.Items.Add('1 - Решение уравнений');
      Form6.ComboBox1.Items.Add('2 - Дроби');
      Form6.ComboBox1.Items.Add('3 - Проценты');
      end
      else if ComboBox1.Text = 'История' then
      begin
      Form6.ComboBox1.Items.Add('1 - Древний мир');
      Form6.ComboBox1.Items.Add('2 - Средневековье');
      Form6.ComboBox1.Items.Add('3 -  История России');
      end
    else if ComboBox1.Text = 'Литература' then
      begin
      Form6.ComboBox1.Items.Add('1 - Анализ произведения');
      Form6.ComboBox1.Items.Add('2 - Характеристика героев');
      Form6.ComboBox1.Items.Add('3 - Творческое задание');
      end
    else if ComboBox1.Text = 'Русский язык' then
      begin
      Form6.ComboBox1.Items.Add('1 - Орфография');
      Form6.ComboBox1.Items.Add('2 - Морфология');
      Form6.ComboBox1.Items.Add('3 - Синтаксис');
      end
    end

    else if quests = 7 then
    begin
      if ComboBox1.Text = 'Алгебра' then
      begin
      Form6.ComboBox1.Items.Add('1 - Линейные уравнения и неравенства');
      Form6.ComboBox1.Items.Add('2 - Квадратные уравнения');
      Form6.ComboBox1.Items.Add('3 - Функции и графики');
      end
      else if ComboBox1.Text = 'История' then
      begin
      Form6.ComboBox1.Items.Add('1 - Эпоха Возрождения');
      Form6.ComboBox1.Items.Add('2 - Великие географические открытия');
      Form6.ComboBox1.Items.Add('3 - Россия в XVII веке');
      end
    else if ComboBox1.Text = 'Литература' then
      begin
      Form6.ComboBox1.Items.Add('1 - Анализ художественного текста');
      Form6.ComboBox1.Items.Add('2 - Творчество писателей XIX века');
      Form6.ComboBox1.Items.Add('3 - Литературные жанры и стили');
      end
    else if ComboBox1.Text = 'Русский язык' then
      begin
      Form6.ComboBox1.Items.Add('1 - Синтаксис и пунктуация');
      Form6.ComboBox1.Items.Add('2 - Морфология');
      Form6.ComboBox1.Items.Add('3 - Культура речи');
      end
    end
    else if quests = 8 then
    begin
      if ComboBox1.Text = 'Алгебра' then
      begin
      Form6.ComboBox1.Items.Add('1 - Квадратные уравнения и неравенства');
      Form6.ComboBox1.Items.Add('2 - Функции и их свойства');
      Form6.ComboBox1.Items.Add('3 - Системы уравнений');
      end
      else if ComboBox1.Text = 'История' then
      begin
      Form6.ComboBox1.Items.Add('1 - Эпоха Просвещения');
      Form6.ComboBox1.Items.Add('2 - Великая французская революция');
      Form6.ComboBox1.Items.Add('3 - Россия в XVIII веке');
      end
    else if ComboBox1.Text = 'Литература' then
      begin
      Form6.ComboBox1.Items.Add('1 - Русская литература XIX века');
      Form6.ComboBox1.Items.Add('2 - Литературные жанры и стили');
      Form6.ComboBox1.Items.Add('3 - Творчество зарубежных писателей');
      end
    else if ComboBox1.Text = 'Русский язык' then
      begin
      Form6.ComboBox1.Items.Add('1 - Синтаксис и пунктуация');
      Form6.ComboBox1.Items.Add('2 - Морфология');
      Form6.ComboBox1.Items.Add('3 - Культура речи');
      end
    end

    else if quests = 9 then
    begin
      if ComboBox1.Text = 'Алгебра' then
      begin
      Form6.ComboBox1.Items.Add('1 - Квадратные уравнения и функции');
      Form6.ComboBox1.Items.Add('2 - Системы уравнений и неравенств');
      Form6.ComboBox1.Items.Add('3 - Прогрессии');
      end
      else if ComboBox1.Text = 'История' then
      begin
      Form6.ComboBox1.Items.Add('1 - Первая мировая война');
      Form6.ComboBox1.Items.Add('2 - Революции и гражданские войны');
      Form6.ComboBox1.Items.Add('3 - Международные отношения в XX веке');
      end
    else if ComboBox1.Text = 'Литература' then
      begin
      Form6.ComboBox1.Items.Add('1 - Русская литература XIX века');
      Form6.ComboBox1.Items.Add('2 - Литературные направления и стили');
      Form6.ComboBox1.Items.Add('3 - Творчество зарубежных писателей');
      end
    else if ComboBox1.Text = 'Русский язык' then
      begin
      Form6.ComboBox1.Items.Add('1 - Синтаксис и пунктуация');
      Form6.ComboBox1.Items.Add('2 - Морфология');
      Form6.ComboBox1.Items.Add('3 - Культура речи');
      end
    end;

    Form5.Visible := False;
    Form6.Visible := True;

    end;




end;

procedure TForm5.RoundRect3Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar('https://stgau.ru/'), nil, nil, SW_SHOWNORMAL);
end;

procedure TForm5.RoundRect4Click(Sender: TObject);
begin
ShellExecute(0, 'open', PChar('https://stgau.ru/'), nil, nil, SW_SHOWNORMAL);
end;

end.
