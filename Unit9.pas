unit Unit9;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm9 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Label2: TLabel;
    procedure Button2Click(Sender: TObject);  // ����
    function  Entrance:boolean;  //���� ����� User ��� ���
    procedure Button1Click(Sender: TObject); // �����������
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;


implementation
uses Smenu,check_in;

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
begin
Form10.Show;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
if Entrance then
   begin
     showmessage('���� ����������');
       Nick:=edit1.Text;
      Form2.Show;
      Form9.Visible:=false;
   end
   else
    showmessage('�� ����� �� ������ ����� ��� ������! ��������� ������������ ���������! ���� �����������������!');
end;

function TForm9.Entrance: boolean;
var SaveTxt:TStringList;
    i:integer;
    Log,Pass:string;
begin
result:=false;
SaveTxt:=TStringList.Create;
SaveTxt.LoadFromFile(ExtractFilePath(Application.ExeName)+'RegEdit.txt');
Log:=Edit1.Text;
Pass:=Edit2.Text;
i:=0;
while (i-1)<>SaveTxt.Count -1 do
  begin
    if (Log= SaveTxt[i]) and (pass=SaveTxt[i+1]) then
      begin
        result:=True;
        Break;
      end
        else
        begin
          i:=i+2
        end;
  end;

end;

end.
