unit Gmap;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.ExtCtrls,
  Vcl.StdCtrls,MsMap,Vcl.Imaging.pngimage;

type
  TGnmap = class(TThread)
  private
  procedure CreateGnTopImageBOT(LeftShift,TopShift,j,i:integer);
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation
  uses Smap,Pmap;
{ 
  Important: Methods and properties of objects in visual components can only be
  used in a method called using Synchronize, for example,

      Synchronize(UpdateCaption);  

  and UpdateCaption could look like,

    procedure Gmap.UpdateCaption;
    begin
      Form1.Caption := 'Updated in a thread';
    end; 
    
    or 
    
    Synchronize( 
      procedure 
      begin
        Form1.Caption := 'Updated in thread via an anonymous method' 
      end
      )
    );
    
  where an anonymous method is passed.
  
  Similarly, the developer can call the Queue method with similar parameters as 
  above, instead passing another TThread class as the first parameter, putting
  the calling thread in a queue with the other thread.
    
}

{ Gmap }

procedure TGnmap.CreateGnTopImageBOT(LeftShift, TopShift, j, i: integer);
begin
  Map[j,i]:=TMap.Create(Form1);
  Map[j,i].Parent:=Form1;
  Map[j,i].Left:=10+LeftShift;
  Map[j,i].Top:=10+TopShift;
  Map[j,i].Width:=100;
  Map[j,i].Height:=150;
  Map[j,i].Picture.LoadFromFile('Textures/Other/TopImage.png');
  Map[j,i].Stretch:=True;
  Map[j,i].Visible:=true;
  Map[j,i].Tag:=i;
  Map[j,i].OnClick:=Form1.ImageOnClick;
end;



procedure TGnmap.Execute;
var i,j,LeftShift,TopShift:integer;
begin

  setlength(Map,x,x);

       LeftShift:=0;
       TopShift:=0;


       for i := 0 to x-1 do
       begin
        for j := 0 to x-1 do
         begin
        CreateGnTopImageBOT(LeftShift,TopShift,j,i);

        LeftShift:=LeftShift+105;
        end;
         LeftShift:=0;
          TopShift:=TopShift+155;
       end;


end;
end.
