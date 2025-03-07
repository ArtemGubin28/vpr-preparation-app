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
    table := ComboBox1.Text + '_' + NumberClass + '_�����';
   Form1.ADOQuery2.SQL.Text := 'SELECT TOP 1 * FROM ' + table + ' ORDER BY ��� DESC';

      if (ComboBox1.Text = '') then
              MessageBox(0, '�� �� ������� �������!', '', MB_ICONINFORMATION or MB_OK)
      else
      begin
      Form1.ADOQuery2.Active := True;
      KolVoVopr := Form1.ADOQuery2.FieldByName('���').AsInteger;
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
    MessageBox(0, '�������� ������� � ������� ���������.', '', MB_ICONINFORMATION or MB_OK);
    Label4.Visible := True;
    ComboBox2.Visible := True;
  end


else if (ComboBox1.Text <> '') and (ComboBox2.Text <> '') then
begin
quests := Form1.ADOQuery1.FieldByName('Class').AsInteger;
    if quests = 6 then
    begin
      if ComboBox1.Text = '�������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ������� ���������');
      Form6.ComboBox1.Items.Add('2 - �����');
      Form6.ComboBox1.Items.Add('3 - ��������');
      end
      else if ComboBox1.Text = '�������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ������� ���');
      Form6.ComboBox1.Items.Add('2 - �������������');
      Form6.ComboBox1.Items.Add('3 -  ������� ������');
      end
    else if ComboBox1.Text = '����������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ������ ������������');
      Form6.ComboBox1.Items.Add('2 - �������������� ������');
      Form6.ComboBox1.Items.Add('3 - ���������� �������');
      end
    else if ComboBox1.Text = '������� ����' then
      begin
      Form6.ComboBox1.Items.Add('1 - ����������');
      Form6.ComboBox1.Items.Add('2 - ����������');
      Form6.ComboBox1.Items.Add('3 - ���������');
      end
    end

    else if quests = 7 then
    begin
      if ComboBox1.Text = '�������' then
      begin
      Form6.ComboBox1.Items.Add('1 - �������� ��������� � �����������');
      Form6.ComboBox1.Items.Add('2 - ���������� ���������');
      Form6.ComboBox1.Items.Add('3 - ������� � �������');
      end
      else if ComboBox1.Text = '�������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ����� �����������');
      Form6.ComboBox1.Items.Add('2 - ������� �������������� ��������');
      Form6.ComboBox1.Items.Add('3 - ������ � XVII ����');
      end
    else if ComboBox1.Text = '����������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ������ ��������������� ������');
      Form6.ComboBox1.Items.Add('2 - ���������� ��������� XIX ����');
      Form6.ComboBox1.Items.Add('3 - ������������ ����� � �����');
      end
    else if ComboBox1.Text = '������� ����' then
      begin
      Form6.ComboBox1.Items.Add('1 - ��������� � ����������');
      Form6.ComboBox1.Items.Add('2 - ����������');
      Form6.ComboBox1.Items.Add('3 - �������� ����');
      end
    end
    else if quests = 8 then
    begin
      if ComboBox1.Text = '�������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ���������� ��������� � �����������');
      Form6.ComboBox1.Items.Add('2 - ������� � �� ��������');
      Form6.ComboBox1.Items.Add('3 - ������� ���������');
      end
      else if ComboBox1.Text = '�������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ����� �����������');
      Form6.ComboBox1.Items.Add('2 - ������� ����������� ���������');
      Form6.ComboBox1.Items.Add('3 - ������ � XVIII ����');
      end
    else if ComboBox1.Text = '����������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ������� ���������� XIX ����');
      Form6.ComboBox1.Items.Add('2 - ������������ ����� � �����');
      Form6.ComboBox1.Items.Add('3 - ���������� ���������� ���������');
      end
    else if ComboBox1.Text = '������� ����' then
      begin
      Form6.ComboBox1.Items.Add('1 - ��������� � ����������');
      Form6.ComboBox1.Items.Add('2 - ����������');
      Form6.ComboBox1.Items.Add('3 - �������� ����');
      end
    end

    else if quests = 9 then
    begin
      if ComboBox1.Text = '�������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ���������� ��������� � �������');
      Form6.ComboBox1.Items.Add('2 - ������� ��������� � ����������');
      Form6.ComboBox1.Items.Add('3 - ����������');
      end
      else if ComboBox1.Text = '�������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ������ ������� �����');
      Form6.ComboBox1.Items.Add('2 - ��������� � ����������� �����');
      Form6.ComboBox1.Items.Add('3 - ������������� ��������� � XX ����');
      end
    else if ComboBox1.Text = '����������' then
      begin
      Form6.ComboBox1.Items.Add('1 - ������� ���������� XIX ����');
      Form6.ComboBox1.Items.Add('2 - ������������ ����������� � �����');
      Form6.ComboBox1.Items.Add('3 - ���������� ���������� ���������');
      end
    else if ComboBox1.Text = '������� ����' then
      begin
      Form6.ComboBox1.Items.Add('1 - ��������� � ����������');
      Form6.ComboBox1.Items.Add('2 - ����������');
      Form6.ComboBox1.Items.Add('3 - �������� ����');
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
