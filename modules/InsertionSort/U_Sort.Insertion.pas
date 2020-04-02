unit U_Sort.Insertion;

interface

uses U_SortClass, U_SortInterface, FMX.Layouts, System.SysUtils;

type
  TSortInsertion = class(TSortClass, ISortInterface<TLayout>)
  private
    procedure sort(layout01 : TLayout);

  public
    constructor Create(layout01 : TLayout);
  end;

implementation

{ TSortInsertion }

constructor TSortInsertion.Create(layout01: TLayout);
begin
  inherited Create(layout01);
  sleep(2000);
  sort(layout01);

end;

procedure TSortInsertion.sort(layout01: TLayout);
var
  i, j : Integer;
  key : Single;

begin
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
end;

end.
