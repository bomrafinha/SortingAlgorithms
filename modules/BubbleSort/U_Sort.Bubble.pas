unit U_Sort.Bubble;

interface

uses U_SortClass, U_SortInterface, FMX.Layouts, System.SysUtils;

type
  TSortBubble = class(TSortClass, ISortInterface<TLayout>)
  private
    procedure sort(layout01 : TLayout);

  public
    constructor Create(layout01 : TLayout);
  end;

implementation

{ TSortBubble }

constructor TSortBubble.Create(layout01: TLayout);
begin
  inherited Create(layout01);
  sleep(2000);
  sort(layout01);

end;

procedure TSortBubble.sort(layout01: TLayout);
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
