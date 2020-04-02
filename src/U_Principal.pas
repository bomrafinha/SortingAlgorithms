unit U_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts;

type
  TPrincipal = class(TForm)
    Timer1: TTimer;
    Layout1: TLayout;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.fmx}

uses U_Fractais, U_Sort, U_Fractal_01, U_Fractal_02, U_Fractal_03, U_Fractal_06,
  U_Sort_01, U_Sort_02, U_Sort_03, U_Sort_04;

procedure TPrincipal.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TPrincipal.Timer1Timer(Sender: TObject);
var
  fractal : TFractais;
  sort : TSort;

begin
  Timer1.Enabled := False;
  fractal := TFractal06.Create(Layout1);
//  sort := TSort04.Create(Layout1);

end;

end.
