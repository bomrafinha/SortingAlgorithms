unit U_Sort.Insertion;

interface

uses U_SortClass, U_SortInterface, FMX.Layouts, System.SysUtils;

type
  TSortInsertion = class(TSortClass, ISortInterface)
  private
    function algoritmo() : Boolean; Override;

  end;

implementation

{ TSortInsertion }

function TSortInsertion.algoritmo() : Boolean;
var
  i, j : Integer;
  key : Single;

begin
  Result := False;
  for j := 1 to 49 do
  begin
    key := findRectangle(j).Height;

    i := j - 1;

    while ((i >= 0) and (findRectangle(i).Height > key)) do
    begin
      troca(findRectangle(i + 1), findRectangle(i));
      dec(i, 1);

    end;
  end;
  Result := True;
end;

end.
