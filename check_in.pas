unit check_in;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm10 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

procedure TForm10.Button1Click(Sender: TObject);
var SaveTxt:TStringList;
    LoginUsr, PassUsr,NewLog:string;
    i:integer;
    logIf:boolean;
begin
i:=0;
logIf:=true;
SaveTxt:=TStringList.Create;
SaveTxt.LoadFromFile(ExtractFilePath(Application.ExeName)+'RegEdit.txt');
  NewLog:=Edit1.Text;
while (i-1)<>SaveTxt.Count-1 do
  begin
    if NewLog=SaveTxt[i] then
    begin
    logIf:=false;
    break;
    end;

    i:=i+2;
  end;

   if logIf then
    begin
          if (Edit1.Text <> '') and (Edit2.Text <> '') then
             begin
      LoginUsr:=Trim(Edit1.Text);
      PassUsr:=Trim(Edit2.Text);
      SaveTxt.Add(LoginUsr);
      SaveTxt.Add(PassUsr);
      SaveTxt.SaveToFile(ExtractFilePath(Application.ExeName)+'RegEdit.txt');
       showmessage('����������� ������ �������!');
       edit1.Text:='';
       edit2.Text:='';
       Form10.Visible:=false;
      exit;
            end;
    end
    else
    begin
    showmessage('����� ����� ��� ����������');
    exit;
    end;
end;

end.
