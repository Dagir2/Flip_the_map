program Project1;

uses
  Vcl.Forms,
  SMap in 'SMap.pas' {Form1},
  PMap in 'PMap.pas',
  Gmap in 'Gmap.pas',
  MsMap in 'MsMap.pas',
  Smenu in 'Smenu.pas' {Form2},
  SOption in 'SOption.pas' {Form3},
  Test in 'Test.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {Form7},
  Unit8 in 'Unit8.pas' {Form8},
  Unit9 in 'Unit9.pas' {Form9},
  check_in in 'check_in.pas' {Form10};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
   Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm10, Form10);
  Application.Run;
end.
