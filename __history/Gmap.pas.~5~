unit Gmap;

interface

uses
    Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.ExtCtrls,
  Vcl.StdCtrls,MsMap,Vcl.Imaging.pngimage;

type
  TGnmap = class(TThread)
  private
  procedure CreateGnTopImageBOT(LeftShift,TopShift,i:integer);
    { Private declarations }
  protected
    procedure Execute; override;
  end;

implementation
  uses Smap,Pmap,Vcl.Imaging.jpeg;
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

procedure TGnmap.CreateGnTopImageBOT(LeftShift, TopShift, i: integer);
begin
  Map[i]:=TMap.Create(Form1);
  Map[i].Parent:=Form1;
  Map[i].Left:=30+LeftShift;
  Map[i].Top:=50+TopShift;
  Map[i].Width:=150;
  Map[i].Height:=200;
  Map[i].Picture.LoadFromFile('Textures/Other/0.jpg');
  Map[i].Stretch:=True;
  Map[i].Visible:=true;
  Map[i].x:=i;
  Map[i].Tag:=i;
  Map[i].OnClick:=Form1.ImageOnClick;
end;



procedure TGnmap.Execute;
var i,j1,j,x1,LeftShift,TopShift:integer;
begin

  setlength(Map,32);

       LeftShift:=0;
       TopShift:=0;
           i:=0;

       for j1 := 0 to 3 do
       begin
        for j := 0 to 7 do
         begin

        CreateGnTopImageBOT(LeftShift,TopShift,i);

        LeftShift:=LeftShift+155;
        inc(i);
        end;
         LeftShift:=0;
          TopShift:=TopShift+205;
       end;


end;
end.
