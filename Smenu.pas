unit Smenu;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
mas = array [1..3] of string[50] ;
Test=record
    vopros:string[50];
    otveti : mas;
  end;


  TForm2 = class(TForm)
    Button1: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    OpenDialog1: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);  // Нажатие на крестик
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  Nick:string;
   f:file of Test;
   vopross:Test;
  mnogvopr,mnogotv:set of byte;
  kolvopravotv,kolvoallotv:integer;
implementation
     uses Smap,SOption,Test, Unit5;
{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
begin
  Application.CreateForm(TForm1, Form1);
   form1.ShowModal
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
Form5.Show;
end;

procedure TForm2.Button4Click(Sender: TObject);
begin
halt;
end;

procedure TForm2.Button5Click(Sender: TObject);
var k,n,j,i:integer;
begin
if  opendialog1.Execute then
if fileexists(opendialog1.filename)  then
          begin
           assignfile(f,opendialog1.filename);
           kolvopravotv:=0;
           reset(f);
           n:=random(filesize(f));
          mnogotv:=mnogotv+[n];
          seek(f,n);
          read(f,vopross);
          Form4.RadioGroup1.Caption:=vopross.vopros;
          inc(kolvoallotv);
          Form4.RadioGroup1.Items.Clear;
          mnogvopr:=[];
          k:=0;
     while k<3 do
      begin
        n:=random(3)+1;
        if not(n in mnogvopr) then
        begin
        inc(k);
        mnogvopr:=mnogvopr+[n];
        Form4.RadioGroup1.Items.Add(vopross.otveti[n]);
        end;
      end;
      closefile(f);
      Form2.Visible:=false;
       Form4.Show;
          end;
end;

procedure TForm2.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
halt;
end;

end.
