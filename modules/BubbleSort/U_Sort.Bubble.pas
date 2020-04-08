unit U_Sort.Bubble;

interface

uses U_SortClass, U_SortInterface, FMX.Layouts, System.SysUtils;

type
  TSortBubble = class(TSortClass, ISortInterface)
  private
    function algoritmo() : Boolean; Override;

  end;

implementation

{ TSortBubble }

function TSortBubble.algoritmo() : Boolean;
var
  i, j : Integer;

begin
  Result := False;
  for i := 48 downto 0 do
  begin
    for j := 0 to i do
    begin
      if Round(findRectangle(j).Height) > Round(findRectangle(j + 1).Height) then
      begin
        troca(findRectangle(j), findRectangle(j + 1));
      end;
    end;
  end;

  Result := True;

end;

end.
