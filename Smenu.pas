unit Smenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation
     uses Smap,SOption;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
   form1.ShowModal
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
    form3.ShowModal
end;

end.
