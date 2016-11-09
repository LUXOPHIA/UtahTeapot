unit Core;

interface //#################################################################### ■

uses System.Types, System.Classes, System.Math.Vectors,
     FMX.Types3D, FMX.Controls3D, FMX.MaterialSources,
     LUX, LUX.D1, LUX.D2, LUX.D3, LUX.D3.M4, LUX.M4;

type //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【型】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

     //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

     //%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTeapotShape

     TTeapotShape = class( TControl3D )
     private
       ///// メソッド
       procedure MakeModel;
     protected
       _Geometry :TMeshData;
       _Material :TMaterialSource;
       _DivN     :Integer;
       ///// アクセス
       procedure SetDivN( const DivN_:Integer );
       ///// メソッド
       procedure Render; override;
     public
       constructor Create( Owner_:TComponent ); override;
       destructor Destroy; override;
       ///// プロパティ
       property Geometry :TMeshData       read _Geometry                  ;
       property Material :TMaterialSource read _Material write   _Material;
       property DivN     :Integer         read _DivN     write SetDivN    ;
     end;

const //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【定数】

      TeapotPatcs :array [ 1..10 ] of TIntegerM4 =
           ( ///// Lid
             ( _:( (  96,  96,  96,  96 ), (  97,  98,  99, 100 ), ( 101, 101, 101, 101 ), (   0,   1,   2,   3 ) ) ),
             ( _:( (   0,   1,   2,   3 ), ( 106, 107, 108, 109 ), ( 110, 111, 112, 113 ), ( 114, 115, 116, 117 ) ) ),
             ///// Rim
             ( _:( ( 102, 103, 104, 105 ), (   4,   5,   6,   7 ), (   8,   9,  10,  11 ), (  12,  13,  14,  15 ) ) ),
             ///// Body
             ( _:( (  12,  13,  14,  15 ), (  16,  17,  18,  19 ), (  20,  21,  22,  23 ), (  24,  25,  26,  27 ) ) ),
             ( _:( (  24,  25,  26,  27 ), (  29,  30,  31,  32 ), (  33,  34,  35,  36 ), (  37,  38,  39,  40 ) ) ),
             ///// Bottom
             ( _:( ( 118, 118, 118, 118 ), ( 124, 122, 119, 121 ), ( 123, 126, 125, 120 ), (  40,  39,  38,  37 ) ) ),
             ///// Spout
             ( _:( (  80,  81,  82,  83 ), (  84,  85,  86,  87 ), (  88,  89,  90,  91 ), (  92,  93,  94,  95 ) ) ),
             ( _:( (  68,  69,  70,  71 ), (  72,  73,  74,  75 ), (  76,  77,  78,  79 ), (  80,  81,  82,  83 ) ) ),
             ///// Handle
             ( _:( (  41,  42,  43,  44 ), (  45,  46,  47,  48 ), (  49,  50,  51,  52 ), (  53,  54,  55,  56 ) ) ),
             ( _:( (  53,  54,  55,  56 ), (  57,  58,  59,  60 ), (  61,  62,  63,  64 ), (  28,  65,  66,  67 ) ) ) );

      TeapotVerts :array [ 0..126 ] of TDouble3D =
           ( ( X:+0.2000; Y: 0.0000; Z:+2.70000 ), ( X:+0.2000; Y:-0.1120; Z:+2.70000 ),
             ( X:+0.1120; Y:-0.2000; Z:+2.70000 ), ( X: 0.0000; Y:-0.2000; Z:+2.70000 ),
             ( X:+1.3375; Y: 0.0000; Z:+2.53125 ), ( X:+1.3375; Y:-0.7490; Z:+2.53125 ),
             ( X:+0.7490; Y:-1.3375; Z:+2.53125 ), ( X: 0.0000; Y:-1.3375; Z:+2.53125 ),
             ( X:+1.4375; Y: 0.0000; Z:+2.53125 ), ( X:+1.4375; Y:-0.8050; Z:+2.53125 ),
             ( X:+0.8050; Y:-1.4375; Z:+2.53125 ), ( X: 0.0000; Y:-1.4375; Z:+2.53125 ),
             ( X:+1.5000; Y: 0.0000; Z:+2.40000 ), ( X:+1.5000; Y:-0.8400; Z:+2.40000 ),
             ( X:+0.8400; Y:-1.5000; Z:+2.40000 ), ( X: 0.0000; Y:-1.5000; Z:+2.40000 ),
             ( X:+1.7500; Y: 0.0000; Z:+1.87500 ), ( X:+1.7500; Y:-0.9800; Z:+1.87500 ),
             ( X:+0.9800; Y:-1.7500; Z:+1.87500 ), ( X: 0.0000; Y:-1.7500; Z:+1.87500 ),
             ( X:+2.0000; Y: 0.0000; Z:+1.35000 ), ( X:+2.0000; Y:-1.1200; Z:+1.35000 ),
             ( X:+1.1200; Y:-2.0000; Z:+1.35000 ), ( X: 0.0000; Y:-2.0000; Z:+1.35000 ),
             ( X:+2.0000; Y: 0.0000; Z:+0.90000 ), ( X:+2.0000; Y:-1.1200; Z:+0.90000 ),
             ( X:+1.1200; Y:-2.0000; Z:+0.90000 ), ( X: 0.0000; Y:-2.0000; Z:+0.90000 ),
             ( X:-2.0000; Y: 0.0000; Z:+0.90000 ), ( X:+2.0000; Y: 0.0000; Z:+0.45000 ),
             ( X:+2.0000; Y:-1.1200; Z:+0.45000 ), ( X:+1.1200; Y:-2.0000; Z:+0.45000 ),
             ( X: 0.0000; Y:-2.0000; Z:+0.45000 ), ( X:+1.5000; Y: 0.0000; Z:+0.22500 ),
             ( X:+1.5000; Y:-0.8400; Z:+0.22500 ), ( X:+0.8400; Y:-1.5000; Z:+0.22500 ),
             ( X: 0.0000; Y:-1.5000; Z:+0.22500 ), ( X:+1.5000; Y: 0.0000; Z:+0.15000 ),
             ( X:+1.5000; Y:-0.8400; Z:+0.15000 ), ( X:+0.8400; Y:-1.5000; Z:+0.15000 ),
             ( X: 0.0000; Y:-1.5000; Z:+0.15000 ), ( X:-1.6000; Y: 0.0000; Z:+2.02500 ),
             ( X:-1.6000; Y:-0.3000; Z:+2.02500 ), ( X:-1.5000; Y:-0.3000; Z:+2.25000 ),
             ( X:-1.5000; Y: 0.0000; Z:+2.25000 ), ( X:-2.3000; Y: 0.0000; Z:+2.02500 ),
             ( X:-2.3000; Y:-0.3000; Z:+2.02500 ), ( X:-2.5000; Y:-0.3000; Z:+2.25000 ),
             ( X:-2.5000; Y: 0.0000; Z:+2.25000 ), ( X:-2.7000; Y: 0.0000; Z:+2.02500 ),
             ( X:-2.7000; Y:-0.3000; Z:+2.02500 ), ( X:-3.0000; Y:-0.3000; Z:+2.25000 ),
             ( X:-3.0000; Y: 0.0000; Z:+2.25000 ), ( X:-2.7000; Y: 0.0000; Z:+1.80000 ),
             ( X:-2.7000; Y:-0.3000; Z:+1.80000 ), ( X:-3.0000; Y:-0.3000; Z:+1.80000 ),
             ( X:-3.0000; Y: 0.0000; Z:+1.80000 ), ( X:-2.7000; Y: 0.0000; Z:+1.57500 ),
             ( X:-2.7000; Y:-0.3000; Z:+1.57500 ), ( X:-3.0000; Y:-0.3000; Z:+1.35000 ),
             ( X:-3.0000; Y: 0.0000; Z:+1.35000 ), ( X:-2.5000; Y: 0.0000; Z:+1.12500 ),
             ( X:-2.5000; Y:-0.3000; Z:+1.12500 ), ( X:-2.6500; Y:-0.3000; Z:+0.93750 ),
             ( X:-2.6500; Y: 0.0000; Z:+0.93750 ), ( X:-2.0000; Y:-0.3000; Z:+0.90000 ),
             ( X:-1.9000; Y:-0.3000; Z:+0.60000 ), ( X:-1.9000; Y: 0.0000; Z:+0.60000 ),
             ( X:+1.7000; Y: 0.0000; Z:+1.42500 ), ( X:+1.7000; Y:-0.6600; Z:+1.42500 ),
             ( X:+1.7000; Y:-0.6600; Z:+0.60000 ), ( X:+1.7000; Y: 0.0000; Z:+0.60000 ),
             ( X:+2.6000; Y: 0.0000; Z:+1.42500 ), ( X:+2.6000; Y:-0.6600; Z:+1.42500 ),
             ( X:+3.1000; Y:-0.6600; Z:+0.82500 ), ( X:+3.1000; Y: 0.0000; Z:+0.82500 ),
             ( X:+2.3000; Y: 0.0000; Z:+2.10000 ), ( X:+2.3000; Y:-0.2500; Z:+2.10000 ),
             ( X:+2.4000; Y:-0.2500; Z:+2.02500 ), ( X:+2.4000; Y: 0.0000; Z:+2.02500 ),
             ( X:+2.7000; Y: 0.0000; Z:+2.40000 ), ( X:+2.7000; Y:-0.2500; Z:+2.40000 ),
             ( X:+3.3000; Y:-0.2500; Z:+2.40000 ), ( X:+3.3000; Y: 0.0000; Z:+2.40000 ),
             ( X:+2.8000; Y: 0.0000; Z:+2.47500 ), ( X:+2.8000; Y:-0.2500; Z:+2.47500 ),
             ( X:+3.5250; Y:-0.2500; Z:+2.49375 ), ( X:+3.5250; Y: 0.0000; Z:+2.49375 ),
             ( X:+2.9000; Y: 0.0000; Z:+2.47500 ), ( X:+2.9000; Y:-0.1500; Z:+2.47500 ),
             ( X:+3.4500; Y:-0.1500; Z:+2.51250 ), ( X:+3.4500; Y: 0.0000; Z:+2.51250 ),
             ( X:+2.8000; Y: 0.0000; Z:+2.40000 ), ( X:+2.8000; Y:-0.1500; Z:+2.40000 ),
             ( X:+3.2000; Y:-0.1500; Z:+2.40000 ), ( X:+3.2000; Y: 0.0000; Z:+2.40000 ),
             ( X: 0.0000; Y: 0.0000; Z:+3.15000 ), ( X:+0.8000; Y: 0.0000; Z:+3.15000 ),
             ( X:+0.8000; Y:-0.4500; Z:+3.15000 ), ( X:+0.4500; Y:-0.8000; Z:+3.15000 ),
             ( X: 0.0000; Y:-0.8000; Z:+3.15000 ), ( X: 0.0000; Y: 0.0000; Z:+2.85000 ),
             ( X:+1.4000; Y: 0.0000; Z:+2.40000 ), ( X:+1.4000; Y:-0.7840; Z:+2.40000 ),
             ( X:+0.7840; Y:-1.4000; Z:+2.40000 ), ( X: 0.0000; Y:-1.4000; Z:+2.40000 ),
             ( X:+0.4000; Y: 0.0000; Z:+2.55000 ), ( X:+0.4000; Y:-0.2240; Z:+2.55000 ),
             ( X:+0.2240; Y:-0.4000; Z:+2.55000 ), ( X: 0.0000; Y:-0.4000; Z:+2.55000 ),
             ( X:+1.3000; Y: 0.0000; Z:+2.55000 ), ( X:+1.3000; Y:-0.7280; Z:+2.55000 ),
             ( X:+0.7280; Y:-1.3000; Z:+2.55000 ), ( X: 0.0000; Y:-1.3000; Z:+2.55000 ),
             ( X:+1.3000; Y: 0.0000; Z:+2.40000 ), ( X:+1.3000; Y:-0.7280; Z:+2.40000 ),
             ( X:+0.7280; Y:-1.3000; Z:+2.40000 ), ( X: 0.0000; Y:-1.3000; Z:+2.40000 ),
             ///// Bottom
             ( X: 0.0000; Y: 0.0000; Z: 0.00000 ), ( X:+1.4250; Y:-0.7980; Z: 0.00000 ),
             ( X:+1.5000; Y: 0.0000; Z:+0.07500 ), ( X:+1.4250; Y: 0.0000; Z: 0.00000 ),
             ( X:+0.7980; Y:-1.4250; Z: 0.00000 ), ( X: 0.0000; Y:-1.5000; Z:+0.07500 ),
             ( X: 0.0000; Y:-1.4250; Z: 0.00000 ), ( X:+1.5000; Y:-0.8400; Z:+0.07500 ),
             ( X:+0.8400; Y:-1.5000; Z:+0.07500 )                                       );

//var //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【変数】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

implementation //############################################################### ■

uses System.SysUtils, System.RTLConsts,
     LUX.Curve.T2.D3, Main;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【レコード】

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【クラス】

//%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TTeapotShape

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& private

procedure TTeapotShape.MakeModel;
var
   N1, I0 :Integer;
   Poins :TArray<TDouble3D>;
//･･････････････････････････････
     function XYtoI( const X_,Y_:Integer ) :Integer;
     begin
          Result := I0 + N1 * Y_ + X_;
     end;

     function AddPoin( const P_:TDouble3D ) :Integer;
     var
        I :Integer;
     begin
          for I := 0 to High( Poins ) do
          begin
               with Poins[ I ] do
               if ( X = P_.X ) and
                  ( Y = P_.Y ) and
                  ( Z = P_.Z ) then
               begin
                    Result := I;  Exit;
               end;
          end;

          Poins := Poins + [ P_ ];

          Result := High( Poins );
     end;

//･･････････････････････････････
var
   PatcN,
   N2, I, J, X, Y, X0, Y0, X1, Y1, II :Integer;
   Ps :TDouble3DM4;
   T :TDouble2D;
   M :TDoubleM4;
   S :String;
   PP :TSingle3D;
//･･････････････････････････････
     procedure MakeVert;
     var
        X, Y :Integer;
     begin
          with _Geometry do
          begin
               with VertexBuffer do
               begin
                    for Y := 0 to _DivN do
                    begin
                         T.Y := Y / _DivN;

                         for X := 0 to _DivN do
                         begin
                              T.X := X / _DivN;

                              M := TensorBezie4( Ps, T );

                              Vertices [ J ] := M.AxisP;
                              Tangents [ J ] := M.AxisX;
                              BiNormals[ J ] := M.AxisY;
                              Normals  [ J ] := M.AxisZ;
                              TexCoord0[ J ] := TPointF.Create( T.X, T.Y );

                              Inc( J );
                         end;
                    end;
               end;
          end;
     end;
     procedure MakePatch05( const I:Integer );
     var
        X, Y :Integer;
     begin
          S := '             ( _:(';
          for Y := 1 to 4 do
          begin
               S := S + ' ( ';

               for X := 1 to 4 do
               begin
                    Ps[ Y, X ] := TeapotVerts[ TeapotPatcs[ I ][ Y, 5-X ] ];

                    II := AddPoin( Ps[ Y, X ] );

                    S := S + IntToStr( II ) + ', ';
               end;

               S := S + '),';
          end;
          Form1.Memo2.Lines.Add( S + ') ),' );

          MakeVert;
     end;

     procedure MakePatch2( const I:Integer );
     var
        X, Y :Integer;
     begin
          S := '             ( _:(';
          for Y := 1 to 4 do
          begin
               S := S + ' ( ';

               for X := 1 to 4 do
               begin
                    Ps[ Y, X ] := TeapotVerts[ TeapotPatcs[ I ][ Y, X ] ];

                    Ps._[ Y, X ].X := -Ps._[ Y, X ].X;

                    II := AddPoin( Ps[ Y, X ] );

                    S := S + IntToStr( II ) + ', ';
               end;

               S := S + '),';
          end;
          Form1.Memo2.Lines.Add( S + ') ),' );

          MakeVert;
     end;

     procedure MakePatch3( const I:Integer );
     var
        X, Y :Integer;
     begin
          S := '             ( _:(';
          for Y := 1 to 4 do
          begin
               S := S + ' ( ';

               for X := 1 to 4 do
               begin
                    Ps[ Y, X ] := TeapotVerts[ TeapotPatcs[ I ][ Y, X ] ];

                    Ps._[ Y, X ].Y := -Ps._[ Y, X ].Y;

                    II := AddPoin( Ps[ Y, X ] );

                    S := S + IntToStr( II ) + ', ';
               end;

               S := S + '),';
          end;
          Form1.Memo2.Lines.Add( S + ') ),' );

          MakeVert;
     end;

     procedure MakePatch4( const I:Integer );
     var
        X, Y :Integer;
     begin
          S := '             ( _:(';
          for Y := 1 to 4 do
          begin
               S := S + ' ( ';

               for X := 1 to 4 do
               begin
                    Ps[ Y, X ] := TeapotVerts[ TeapotPatcs[ I ][ Y, 5-X ] ];

                    Ps._[ Y, X ].X := -Ps._[ Y, X ].X;
                    Ps._[ Y, X ].Y := -Ps._[ Y, X ].Y;

                    II := AddPoin( Ps[ Y, X ] );

                    S := S + IntToStr( II ) + ', ';
               end;

               S := S + '),';
          end;
          Form1.Memo2.Lines.Add( S + ') ),' );

          MakeVert;
     end;

     procedure MakePatch50( const I:Integer );
     var
        X, Y :Integer;
     begin
          S := '             ( _:(';
          for Y := 1 to 4 do
          begin
               S := S + ' ( ';

               for X := 1 to 4 do
               begin
                    Ps[ Y, X ] := TeapotVerts[ TeapotPatcs[ I ][ 5-Y, X ] ];

                    II := AddPoin( Ps[ Y, X ] );

                    S := S + IntToStr( II ) + ', ';
               end;

               S := S + '),';
          end;
          Form1.Memo2.Lines.Add( S + ') ),' );

          MakeVert;
     end;


     procedure MakePatch51( const I:Integer );
     var
        X, Y :Integer;
     begin
          S := '             ( _:(';
          for Y := 1 to 4 do
          begin
               S := S + ' ( ';

               for X := 1 to 4 do
               begin
                    Ps[ Y, X ] := TeapotVerts[ TeapotPatcs[ I ][ 5-Y, 5-X ] ];

                    Ps._[ Y, X ].Y := -Ps._[ Y, X ].Y;

                    II := AddPoin( Ps[ Y, X ] );

                    S := S + IntToStr( II ) + ', ';
               end;

               S := S + '),';
          end;
          Form1.Memo2.Lines.Add( S + ') ),' );

          MakeVert;
     end;

     procedure MakePatch52( const I:Integer );
     var
        X, Y :Integer;
     begin
          S := '             ( _:(';
          for Y := 1 to 4 do
          begin
               S := S + ' ( ';

               for X := 1 to 4 do
               begin
                    Ps[ Y, X ] := TeapotVerts[ TeapotPatcs[ I ][ 5-Y, 5-X ] ];

                    Ps._[ Y, X ].X := -Ps._[ Y, X ].X;

                    II := AddPoin( Ps[ Y, X ] );

                    S := S + IntToStr( II ) + ', ';
               end;

               S := S + '),';
          end;
          Form1.Memo2.Lines.Add( S + ') ),' );

          MakeVert;
     end;


     procedure MakePatch53( const I:Integer );
     var
        X, Y :Integer;
     begin
          S := '             ( _:(';
          for Y := 1 to 4 do
          begin
               S := S + ' ( ';

               for X := 1 to 4 do
               begin
                    Ps[ Y, X ] := TeapotVerts[ TeapotPatcs[ I ][ 5-Y, X ] ];

                    Ps._[ Y, X ].X := -Ps._[ Y, X ].X;
                    Ps._[ Y, X ].Y := -Ps._[ Y, X ].Y;

                    II := AddPoin( Ps[ Y, X ] );

                    S := S + IntToStr( II ) + ', ';
               end;

               S := S + '),';
          end;
          Form1.Memo2.Lines.Add( S + ') ),' );

          MakeVert;
     end;


begin
     Poins := [];

     PatcN := 10 + 10 + 6 + 6;

     N1 := _DivN + 1;  N2 := Pow2( N1 );

     with _Geometry do
     begin
          with VertexBuffer do
          begin
               Length := PatcN{Patc} * N2{Poin};

               J := 0;

               MakePatch05(  1 );  MakePatch2( 1 );  MakePatch3( 1 );  MakePatch4( 1 );
               MakePatch05(  2 );  MakePatch2( 2 );  MakePatch3( 2 );  MakePatch4( 2 );
               MakePatch05(  3 );  MakePatch2( 3 );  MakePatch3( 3 );  MakePatch4( 3 );
               MakePatch05(  4 );  MakePatch2( 4 );  MakePatch3( 4 );  MakePatch4( 4 );
               MakePatch05(  5 );  MakePatch2( 5 );  MakePatch3( 5 );  MakePatch4( 5 );

               MakePatch50(  6 ); MakePatch52( 6 ); MakePatch51( 6 );  MakePatch53( 6 );

               MakePatch50(  7 ); MakePatch51(7);
               MakePatch50(  8 ); MakePatch51(8);

               MakePatch05(  9 ); MakePatch3( 9 );
               MakePatch05( 10 ); MakePatch3( 10 );
          end;

          for I := 0 to High( Poins ) do
          begin
               with Poins[ I ] do
               begin
                    Form1.Memo1.Lines.Add( '( X:'+X.ToString+'; Y:'+Y.ToString+'; Z:'+Z.ToString+' ),' );
               end;
          end;

          Form1.Caption := Length( Poins ).ToString;

          with IndexBuffer do
          begin
               Length := PatcN{Patc} * Pow2( _DivN ){Quad} * 2{Tria} * 3{Poin};

               I0 := 0;
               J  := 0;
               for I := 1 to PatcN do
               begin
                    for Y0 := 0 to _DivN-1 do
                    begin
                         Y1 := Y0 + 1;

                         for X0 := 0 to _DivN-1 do
                         begin
                              X1 := X0 + 1;

                              //    X0      X1
                              //  Y0┼───┼
                              //    │＼    │
                              //    │  ＼  │
                              //    │    ＼│
                              //  Y1┼───┼

                              Indices[ J ] := XYtoI( X0, Y0 );  Inc( J );
                              Indices[ J ] := XYtoI( X1, Y0 );  Inc( J );
                              Indices[ J ] := XYtoI( X1, Y1 );  Inc( J );

                              Indices[ J ] := XYtoI( X1, Y1 );  Inc( J );
                              Indices[ J ] := XYtoI( X0, Y1 );  Inc( J );
                              Indices[ J ] := XYtoI( X0, Y0 );  Inc( J );
                         end;
                    end;

                    Inc( I0, N2 );
               end;
          end;
     end;

     Repaint;
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& protected

/////////////////////////////////////////////////////////////////////// アクセス

procedure TTeapotShape.SetDivN( const DivN_:Integer );
begin
     _DivN := DivN_;  MakeModel;
end;

/////////////////////////////////////////////////////////////////////// メソッド

procedure TTeapotShape.Render;
begin
     Context.SetMatrix( AbsoluteMatrix);

     _Geometry.Render( Context, TMaterialSource.ValidMaterial(_Material), AbsoluteOpacity );
end;

//&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&& public

constructor TTeapotShape.Create( Owner_:TComponent );
begin
     inherited;

     _Geometry := TMeshData.Create;

     HitTest := False;

     _DivN := 8;

     MakeModel;
end;

destructor TTeapotShape.Destroy;
begin
     _Geometry.Free;

     inherited;
end;

//$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$【ルーチン】

//############################################################################## □

initialization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 初期化

finalization //$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 最終化

end. //######################################################################### ■
