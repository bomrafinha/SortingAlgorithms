unit U_SortClass;

interface
uses
  U_Sort.DTO.Retangle, U_SortInterface,
  FMX.Layouts, System.UITypes, System.SysUtils, FMX.Forms, System.Classes;

type
  TSortClass = class(TInterfacedObject, ISortInterface)
  private
    const
      fQtdRet : Integer = 50;

    var
      fCor : Cardinal;
      fCorBorda : Cardinal;
      fCorMudanca : Cardinal;
      fLargura : Integer;
      fLarguraBorda : Integer;
      fRaio : Integer;
      fTempo : Integer;
      fNomes : TStringList;
      fFinalizado : Boolean;

    procedure criaRetangulo(posicao, posX, altura : integer); Overload;
    procedure criaRetangulo(nome : String; altura : integer); Overload;
    procedure preencheTela();
    procedure colorChange(ret01, ret02 : TRetangulo);

  protected
    var
      fOwner : TLayout;

    function algoritmo() : Boolean; Virtual; Abstract;
    function findRectangle(posicao : Integer) : TRetangulo;
    function getDelay(aTempo : Single) : Integer;
    procedure troca(ret01, ret02 : TRetangulo);

    property Distancia : Integer read fLargura;

  public
    constructor Create(Owner : TLayout; delay : Single);

    procedure sort();

    property Finalizado : boolean read fFinalizado write fFinalizado;

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

constructor TSortClass.Create(Owner : TLayout; delay : Single);
var
  I: Integer;

begin
  inherited Create();

  Self.fFinalizado := False;

  fNomes := TStringList.Create();
  fNomes.Clear;

  fOwner := Owner;
  fCor := TAlphaColors.Hotpink;
  fCorBorda := TAlphaColors.Black;
  fCorMudanca := TAlphaColors.Skyblue;
  fLarguraBorda := 1;
  fLargura := trunc(Owner.Size.Width / fQtdRet);
  fRaio := trunc(fLargura * 0.20);
  fTempo := getDelay(delay);

  for I := 0 to fOwner.ControlsCount - 1 do
  begin
    fNomes.Add(fOwner.Controls[I].Name);
  end;

  fNomes.SaveToFile('D:\Users\Bomrafinha\Desktop\rafinha.txt');

  preencheTela();

end;

procedure TSortClass.criaRetangulo(nome : String; altura: integer);
var
  ret : TRetangulo;

begin
  ret := TRetangulo(fOwner.FindComponent(nome));
  ret.Fill.Color := fCor;
  ret.Height := altura;
  ret.Position.Y := fOwner.Height - altura;

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
  retangulo.Name := 'Ret' + posX.ToString;
  retangulo.Posicao := posicao;
  fOwner.AddObject(retangulo);

end;

function TSortClass.findRectangle(posicao: Integer): TRetangulo;
begin
  Result := TRetangulo(fOwner.FindComponent('Ret' + intToStr(posicao * fLargura)));
end;

function TSortClass.getDelay(aTempo: Single): Integer;
begin
  Result := trunc(1000 / (2 * aTempo));

end;

procedure TSortClass.preencheTela;
var
  posX : Integer;
  tamanho : Integer;
  i : Integer;

begin
  Randomize;

  if fNomes.Count <= 0 then
  begin
    posX := 0;
    for i := 1 to fQtdRet do
    begin
      repeat
        tamanho := Random(490) + 10
      until ((tamanho mod 5) = 0);

      criaRetangulo(i - 1, posX, tamanho);
      inc(posX, fLargura);
    end;
  end else begin
    for i := 0 to fNomes.Count - 1 do
    begin
      repeat
        tamanho := Random(490) + 10
      until ((tamanho mod 5) = 0);

      criaRetangulo(fNomes.Strings[i], tamanho);
    end;

  end;

  Application.ProcessMessages;

end;

procedure TSortClass.sort;
var
  alg : TThread;

begin
  Self.fFinalizado := False;
  alg := TThread.CreateAnonymousThread(
    procedure
    begin
      Self.fFinalizado := Self.algoritmo();
    end);
  alg.Start();

end;

procedure TSortClass.troca(ret01, ret02 : TRetangulo);
var
  aux : Single;

begin
  try
    colorChange(ret01, ret02);
    Application.ProcessMessages;
    Sleep(fTempo);

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
