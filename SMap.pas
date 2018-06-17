unit SMap;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.ExtCtrls,Pmap,Gmap,MsMap,
  Vcl.StdCtrls, Vcl.Imaging.pngimage,Vcl.Imaging.jpeg,Math;

type


  TForm1 = class(TForm)
    Timer1: TTimer;
    Label1: TLabel;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);    //�������� �����
    procedure Timer1Timer(Sender: TObject);   // ��������������� ������
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean); // ��� ������� �� �������
    procedure Timer2Timer(Sender: TObject); // ������ �����
  private
    { Private declarations }
  public
   procedure ImageOnClick(Sender: TObject);  //������� ��� ���� ����
   procedure RandomAni(var A:Mas);      // ��������� ���������� ����
    { Public declarations }
  end;

var
  Form1: TForm1;
  Map:Mmap;
   Ani:Mas;
   NotRep:MNotRep;
   Klik,Pler,Time:integer;
implementation

{$R *.dfm}



procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
halt;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
i:integer;
 MyThread:TGnMap;
begin
Setlength(NotRep,16);

for i := 0 to 15 do
  NotRep[i]:=False;

     RandomAni(Ani);
   MyThread:=TGnMap.Create(False);
  MyThread.Priority:=tpNormal;
end;

procedure TForm1.ImageOnClick(Sender: TObject);
Var
Fimage:TMap;
i:integer;
STOP:boolean;
begin
 if Sender is  TMap then
   begin
      Timer2.Enabled:=true;
      Fimage:=TMap(Sender);


      Fimage.Picture.LoadFromFile('Textures/Other/'+IntToStr(Ani[Fimage.x])+'.jpg');
        if Ani[Fimage.x]=Pler then
          begin
           NotRep[Ani[Fimage.x]]:=true;
          end;


         Fimage.Enabled:=false;

         Pler:=Ani[Fimage.x];
        inc(Klik);

        if klik=2 then
        begin
        for i := 0 to 31 do
         Map[i].Enabled:=false;

         for i := 0 to 31 do
          if NotRep[Ani[map[i].x]]<>True then
          begin
         STOP:=false;
          end;
            if STOP then
                begin
                  Timer2.Enabled:=false;
                  showmessage('�������!! ���� ����� '+IntToStr(Time)+' ������');
                  halt;
                end;

        Pler:=0;
        Timer1.Enabled:=true;
        end;
   end;
end;

procedure TForm1.RandomAni(var A: Mas);
var
  z,k,i:integer;
begin
  setlength(A,32);

  for i := 0 to 31 do
  A[i]:=0;

 for z := 1 to 16 do
 begin
  i:=0;
  while i<>2 do
  begin
    K:=RandomRange(0,32);
  if A[K]=0 then
    begin
      A[K]:=z;
      inc(i);
    end;

  end;

 end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i:integer;
begin
for i := 0 to 31 do
        begin
          if NotRep[Ani[Map[i].x]]<>True then
         Map[i].Picture.LoadFromFile('Textures/Other/0.jpg');

        end;
         klik:=0;
          for i := 0 to 31 do
          if NotRep[Ani[map[i].x]]<>True then
          begin
         Map[i].Enabled:=true;
          end;
          
    Timer1.Enabled:=false;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
begin

   Time:=Time+1;
   label1.Caption:=IntToStr(Time);

end;

end.
