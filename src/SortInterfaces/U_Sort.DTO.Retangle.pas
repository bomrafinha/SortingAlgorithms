unit U_Sort.DTO.Retangle;

interface

uses
  FMX.Objects;

type
  TRetangulo = class(TRectangle)
  private
    var
      fPosicao : Integer;

  public
    property Posicao : Integer read fPosicao write fPosicao;

  end;

implementation

end.
