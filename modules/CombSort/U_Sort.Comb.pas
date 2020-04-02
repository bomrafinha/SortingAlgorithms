unit U_Sort.Comb;

interface

uses U_SortClass, U_SortInterface, FMX.Layouts, System.SysUtils;

type
  TSortComb = class(TSortClass, ISortInterface<TLayout>)
  private
    procedure sort(layout01 : TLayout);

  public
    constructor Create(layout01 : TLayout);
  end;

implementation

{ TSortComb }

constructor TSortComb.Create(layout01: TLayout);
begin
  inherited Create(layout01);
  sleep(2000);
  sort(layout01);

end;

procedure TSortComb.sort(layout01: TLayout);
var
  i, gap, tamanho : Integer;

begin
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

end;

end.
