program VPR;

uses
  System.StartUpCopy,
  FMX.Forms,
  Login in 'Login.pas' {Form1},
  Questions in 'Questions.pas' {Form2},
  Score in 'Score.pas' {Form3},
  Registration in 'Registration.pas' {Form4},
  Choice in 'Choice.pas' {Form5},
  Number in 'Number.pas' {Form6},
  QuestionsPodgotovka in 'QuestionsPodgotovka.pas' {FormPodgotovka},
  ScorePodgotovka in 'ScorePodgotovka.pas' {FormOtv};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TFormPodgotovka, FormPodgotovka);
  Application.CreateForm(TFormOtv, FormOtv);
  Application.Run;
end.
