unit SMap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.ExtCtrls,Pmap,Gmap,MsMap,
  Vcl.StdCtrls, Vcl.Imaging.pngimage;

type


  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
   procedure ImageOnClick(Sender: TObject);
    { Public declarations }
  end;

var
  Form1: TForm1;
  Map:Mmap;
  x:integer;
implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
var
 MyThread:TGnMap;
begin
    x:=5;

   MyThread:=TGnMap.Create(False);
  MyThread.Priority:=tpNormal;
end;

procedure TForm1.ImageOnClick(Sender: TObject);
Var
Fimage:TMap;
i:integer;
begin
 if Sender is  TMap then
   begin
      Fimage:=TMap(Sender);
      Fimage.Picture.LoadFromFile('Textures/Other/Empty.png');


   end;
end;

end.
