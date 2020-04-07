unit U_Sort.Selection;

interface

uses U_SortClass, U_SortInterface, FMX.Layouts, System.SysUtils;

type
  TSortSelection = class(TSortClass, ISortInterface)
  private
    procedure algoritmo(); Override;

  public
    constructor Create(layout01 : TLayout);

    procedure sort();

  end;

implementation

{ TSortSelection }

constructor TSortSelection.Create(layout01: TLayout);
begin
  inherited Create(layout01);

end;

procedure TSortSelection.sort;
begin
  inherited sort();

end;

procedure TSortSelection.algoritmo();
var
  i, j, min : Integer;

begin
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
end;

end.
