unit U_Sort.Bubble;

interface

uses U_SortClass, U_SortInterface, FMX.Layouts, System.SysUtils;

type
  TSortBubble = class(TSortClass, ISortInterface)
  private
    procedure algoritmo(); Override;

  public
    constructor Create(layout01 : TLayout);

    procedure sort();

  end;

implementation

{ TSortBubble }

constructor TSortBubble.Create(layout01: TLayout);
begin
  inherited Create(layout01);

end;

procedure TSortBubble.sort;
begin
  inherited sort();
end;

procedure TSortBubble.algoritmo();
var
  i, j : Integer;

begin
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

end;

end.
