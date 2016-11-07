unit Main;

interface //#################################################################### Å°

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  System.Math.Vectors,
  FMX.Types3D, FMX.MaterialSources, FMX.StdCtrls, FMX.Edit,
  FMX.EditBox, FMX.SpinBox, FMX.Objects, FMX.Controls.Presentation,
  FMX.Objects3D, FMX.Controls3D, FMX.Viewport3D,
  LUX.FMX,
  Core;

type
  TForm1 = class(TForm)
    Viewport3D1: TViewport3D;
      Dummy1: TDummy;
        Dummy2: TDummy;
          Camera1: TCamera;
          Light1: TLight;
      Grid3D1: TGrid3D;
      StrokeCube1: TStrokeCube;
      LightMaterialSource1: TLightMaterialSource;
    Panel1: TPanel;
      Image1: TImage;
    SpinBox1: TSpinBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
    procedure Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
    procedure SpinBox1Change(Sender: TObject);
  private
    { private êÈåæ }
    _MouseS :TShiftState;
    _MouseP :TPointF;
  public
    { public êÈåæ }
    _TeapotShape :TTeapotShape;
    _TensorShape :TTensorShape;
  end;

var
  Form1: TForm1;

implementation //############################################################### Å°

{$R *.fmx}

procedure TForm1.FormCreate(Sender: TObject);
begin
     _TeapotShape := TTeapotShape.Create( Self );
     _TensorShape := TTensorShape.Create( Self );

     with _TeapotShape do
     begin
          Parent   := Grid3D1;
          Material := LightMaterialSource1;
     end;

     with _TensorShape do
     begin
          Parent   := _TeapotShape;
          MeshData := _TeapotShape.Geometry;
          AxisLeng := 0.1;
     end;

     Image1.Bitmap.LoadFromFile( '..\..\_DATA\Texture.png' );

     LightMaterialSource1.Texture.Assign( Image1.Bitmap );

     SpinBox1Change( Self );
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
     /////
end;

//------------------------------------------------------------------------------

procedure TForm1.Viewport3D1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     _MouseS := Shift;
     _MouseP := TPointF.Create( X, Y );
end;

procedure TForm1.Viewport3D1MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Single);
var
   P :TPointF;
begin
     if ssLeft in _MouseS then
     begin
          P := TPointF.Create( X, Y );

          with Dummy1.RotationAngle do Y := Y + ( P.X - _MouseP.X );
          with Dummy2.RotationAngle do X := X - ( P.Y - _MouseP.Y );

          _MouseP := P;
     end;
end;

procedure TForm1.Viewport3D1MouseUp(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Single);
begin
     Viewport3D1MouseMove( Sender, Shift, X, Y );

     _MouseS := [];
end;

//------------------------------------------------------------------------------

procedure TForm1.SpinBox1Change(Sender: TObject);
begin
     _TeapotShape.DivN := Round( SpinBox1.Value );

     _TensorShape.MakeShape;
end;

end. //######################################################################### Å°
