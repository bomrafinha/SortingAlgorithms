unit U_Sort.Selection;

interface

uses U_SortClass, U_SortInterface, FMX.Layouts, System.SysUtils;

type
  TSortSelection = class(TSortClass, ISortInterface)
  private
    function algoritmo() : Boolean; Override;

  end;

implementation

{ TSortSelection }

function TSortSelection.algoritmo() : Boolean;
var
  i, j, min : Integer;

begin
  Result := False;
  for i := 0 to 48 do
  begin
    min := i;
    for j := (i + 1) to 49 do
    begin
      if (findRectangle(j).Height < findRectangle(min).Height) then
      begin
        min := j;
      end;
    end;
    troca(findRectangle(min), findRectangle(i));
  end;
  Result := True;
end;

end.
