unit U_Sort_01; //Bubble Sort

interface

uses U_Sort, FMX.Layouts, System.Classes, Winapi.Windows, FMX.Dialogs,
  FMX.Objects, System.SysUtils;

type
  TSort01 = class(TSort)
  private
    procedure sort(layout01 : TLayout);

  public
    constructor Create(layout01 : TLayout);
  end;

implementation

{ TSort01 }

constructor TSort01.Create(layout01: TLayout);
begin
  inherited Create(layout01);
  sleep(2000);
  sort(layout01);

end;

procedure TSort01.sort(layout01: TLayout);
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
