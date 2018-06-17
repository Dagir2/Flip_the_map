 unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit3: TEdit;
    Edit2: TEdit;
    Edit4: TEdit;
    Button1: TButton;
    Memo1: TMemo;
    RadioGroup1: TRadioGroup;
    Image1: TImage;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  mas = array [1..3] of string[50] ;
  voprosi=record
    vopros:string[50];
    otveti : mas;
  end;
var
  Form1: TForm1;
  f: file of voprosi;
  vopross:voprosi;
  mnogvopr,mnogotv:set of byte;
  kolvopravotv,kolvoallotv:integer;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
var i:integer;
begin
 assignfile(f,'1.dat');
 if fileexists('1.dat') then
  begin
    reset(f);
  end
  else
  rewrite(f);
  seek(f,filesize(f));//  на последнец позиции в файле
  vopross.vopros:=edit1.Text;

    case RadioGroup1.ItemIndex of
       0:begin
         vopross.otveti[1]:=edit2.Text;// всегда правильвный ответ
          vopross.otveti[2]:=edit3.Text;
         vopross.otveti[3]:=edit4.Text;
       end;
       1:begin
         vopross.otveti[1]:=edit3.Text;// всегда правильвный ответ
          vopross.otveti[2]:=edit2.Text;
         vopross.otveti[3]:=edit4.Text;
       end;

       2:begin
           vopross.otveti[1]:=edit4.Text;// всегда правильвный ответ
          vopross.otveti[2]:=edit3.Text;
         vopross.otveti[3]:=edit2.Text;
       end;
    end;


  write(f,vopross);
  closefile(f);
  reset(f);
  memo1.Clear;
  for i:=0 to filesize(f)-1 do
    begin
      read(f,vopross);
      memo1.Lines.Add(vopross.vopros);
      memo1.Lines.Add('-----------------');
      memo1.Lines.Add('1) '+vopross.otveti[1]);
      memo1.Lines.Add('2) '+vopross.otveti[2]);
      memo1.Lines.Add('3) '+vopross.otveti[3]);
      memo1.Lines.Add('*****************');
    end;
end;






procedure TForm1.FormCreate(Sender: TObject);
var k,n,j,i:integer;
begin
  kolvoallotv:=0;
  randomize;
  mnogotv:=[];
  assignfile(f,'1.dat');
   Rewrite(f);

end;



end.
