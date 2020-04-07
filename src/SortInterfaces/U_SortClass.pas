unit U_SortClass;

interface
uses
  U_Sort.DTO.Retangle, U_SortInterface,
  FMX.Layouts, System.UITypes, System.SysUtils, FMX.Forms, System.Classes;

type
  TSortClass = class(TInterfacedObject, ISortInterface)
  private
    const
      fTempo : Integer = 500;
      fQtdRet : Integer = 50;

    var
      fCor : Cardinal;
      fCorBorda : Cardinal;
      fCorMudanca : Cardinal;
      fLargura : Integer;
      fLarguraBorda : Integer;
      fRaio : Integer;

    procedure criaRetangulo(posicao, posX, altura : integer);
    procedure preencheTela();
    procedure colorChange(ret01, ret02 : TRetangulo);

  protected
    var
      fOwner : TLayout;

    constructor Create(Owner : TLayout);

    procedure algoritmo(); Virtual; Abstract;
    procedure troca(ret01, ret02 : TRetangulo);
    function findRectangle(posicao : Integer) : TRetangulo;

    property Distancia : Integer read fLargura;

  public
    procedure sort();

  end;

implementation

{ TSortClass }

procedure TSortClass.colorChange(ret01, ret02 : TRetangulo);
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

constructor TSortClass.Create(Owner : TLayout);
begin
  inherited Create();
  fOwner := Owner;
  fCor := TAlphaColors.Hotpink;
  fCorBorda := TAlphaColors.Black;
  fCorMudanca := TAlphaColors.Skyblue;
  fLarguraBorda := 1;
  fLargura := trunc(Owner.Size.Width / fQtdRet);
  fRaio := trunc(fLargura * 0.20);
  preencheTela();

end;

procedure TSortClass.criaRetangulo(posicao, posX, altura: integer);
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

function TSortClass.findRectangle(posicao: Integer): TRetangulo;
begin
  Result := TRetangulo(fOwner.FindComponent('Ret' + intToStr(posicao * fLargura)));
end;

procedure TSortClass.preencheTela;
var
  posX : Integer;
  tamanho : Integer;
  i : Integer;

begin
  Randomize;
  posX := 0;
  for i := 1 to fQtdRet do
  begin
    repeat
      tamanho := Random(490) + 10
    until ((tamanho mod 5) = 0);

    criaRetangulo(i - 1, posX, tamanho);
    inc(posX, fLargura);
  end;

  Application.ProcessMessages;

end;

procedure TSortClass.sort;
var
  alg : TThread;

begin
  alg := TThread.CreateAnonymousThread(
    procedure
    begin
      Self.algoritmo();
    end);
  alg.Start();

end;

procedure TSortClass.troca(ret01, ret02 : TRetangulo);
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
    ret01.Repaint;
    ret02.Repaint;
    fOwner.Repaint;

  finally
    Sleep(fTempo);
    colorChange(ret01, ret02);
    Application.ProcessMessages;
  end;

end;

end.
