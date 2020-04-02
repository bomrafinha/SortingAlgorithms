unit U_Sort_03; //Selection Sort

interface

uses U_Sort, FMX.Layouts, System.Classes, Winapi.Windows, FMX.Dialogs,
  FMX.Objects, System.SysUtils;

type
  TSort03 = class(TSort)
  private
    procedure sort(layout01 : TLayout);

  public
    constructor Create(layout01 : TLayout);
  end;

implementation

{ TSort03 }

constructor TSort03.Create(layout01: TLayout);
begin
  inherited Create(layout01);
  sleep(2000);
  sort(layout01);

end;

procedure TSort03.sort(layout01: TLayout);
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
