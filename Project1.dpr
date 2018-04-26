program Project1;

uses
  Vcl.Forms,
  SMap in 'SMap.pas' {Form1},
  PMap in 'PMap.pas',
  Gmap in 'Gmap.pas',
  MsMap in 'MsMap.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
