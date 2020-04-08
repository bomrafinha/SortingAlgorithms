unit U_Sort.Comb;

interface

uses U_SortClass, U_SortInterface, FMX.Layouts, System.SysUtils;

type
  TSortComb = class(TSortClass, ISortInterface)
  private
    function algoritmo() : Boolean; Override;

  end;

implementation

{ TSortComb }

function TSortComb.algoritmo() : Boolean;
var
  i, gap, tamanho : Integer;

begin
  Result := False;
  tamanho := 50;
  gap := trunc(tamanho / 1.3);
  while ((gap > 0) and  (i <> tamanho - 1)) do
  begin
    i := 0;
    while ((i + gap) < tamanho) do
    begin
      if (findRectangle(i).Height > findRectangle(i + gap).Height) then
      begin
        troca(findRectangle(i), findRectangle(i + gap));
      end;
      inc(i, 1);
    end;
    gap := Trunc(gap / 1.3);
  end;
  Result := True;

end;

end.
