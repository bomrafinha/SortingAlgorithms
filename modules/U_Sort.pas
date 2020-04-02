unit U_Sort;

interface

uses
  System.UITypes, System.Generics.Collections, FMX.Objects, System.Classes,
  FMX.Layouts, FMX.Types, FMX.Dialogs, System.SysUtils, FMX.Forms;

type
  TRetangulo = class(TRectangle)
  private
    var
      fPosicao : Integer;

  public
    property Posicao : Integer read fPosicao write fPosicao;

  end;

  TSort = class(TObject)
  private
    const
      fTempo : Integer = 500;
    var
      fCor : Cardinal;
      fCorBorda : Cardinal;
      fCorMudanca : Cardinal;
      fLargura : Integer;
      fLarguraBorda : Integer;
      fRaio : Integer;
      fOwner : TLayout;
    procedure criaRetangulo(posicao, posX, altura : integer);
    procedure preencheTela();
    procedure colorChange(ret01, ret02 : TRetangulo);

  protected
    constructor Create(Owner : TLayout);
    procedure troca(ret01, ret02 : TRetangulo);
    function findRectangle(posicao : Integer) : TRetangulo;
    property Distancia : Integer read fLargura;

  end;

implementation

{ TSort }

procedure TSort.colorChange(ret01, ret02 : TRetangulo);
begin
  if ret01.Fill.Color = fCor then
  begin
    ret01.Fill.Color := fCorMudanca;
    ret02.Fill.Color := fCorMudanca;
  end else begin
    ret01.Fill.Color := fCor;
    ret02.Fill.Color := fCor;
  end;

end;

constructor TSort.Create(Owner : TLayout);
begin
  inherited Create();
  fOwner := Owner;
  fCor := TAlphaColors.Hotpink;
  fCorBorda := TAlphaColors.Black;
  fCorMudanca := TAlphaColors.Skyblue;
  fLargura := 25;
  fLarguraBorda := 1;
  fRaio := 5;
  preencheTela();

end;

procedure TSort.criaRetangulo(posicao, posX, altura: integer);
var
  retangulo : TRetangulo;

begin
  retangulo := TRetangulo.Create(fOwner);
  retangulo.Fill.Color := fCor;
  retangulo.Stroke.Color := fCorBorda;
  retangulo.Height := altura;
  retangulo.Position.X := posX;
  retangulo.Position.Y := fOwner.Height - altura;
  retangulo.Width := fLargura;
  retangulo.XRadius := fRaio;
  retangulo.YRadius := fRaio;
  retangulo.Name := 'Ret' + IntToStr(posX);
  retangulo.Posicao := posicao;
  fOwner.AddObject(retangulo);

end;

function TSort.findRectangle(posicao: Integer): TRetangulo;
begin
  Result := TRetangulo(fOwner.FindComponent('Ret' + intToStr(posicao * fLargura)));
end;

procedure TSort.preencheTela;
var
  posX : Integer;
  tamanho : Integer;
  i : Integer;

begin
  Randomize;
  posX := 0;
  for i  := 0 to 49 do
  begin
    repeat
      tamanho := Random(490) + 10
    until ((tamanho mod 5) = 0);

    criaRetangulo(i, posX, tamanho);
    inc(posX, fLargura);

  end;
  Application.ProcessMessages;

end;

procedure TSort.troca(ret01, ret02 : TRetangulo);
var
  aux : Single;

begin
  try
    Sleep(fTempo);
    colorChange(ret01, ret02);
    Application.ProcessMessages;

    aux := ret01.Height;
    ret01.Height := ret02.Height;
    ret02.Height := aux;
    ret01.Position.Y := fOwner.Height - ret01.Height;
    ret02.Position.Y := fOwner.Height - ret02.Height;

  finally
    Sleep(fTempo);
    colorChange(ret01, ret02);
    Application.ProcessMessages;
  end;

end;

end.
