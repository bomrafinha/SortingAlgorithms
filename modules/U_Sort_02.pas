unit U_Sort_02; //Insertion Sort

interface

uses U_Sort, FMX.Layouts, System.Classes, Winapi.Windows, FMX.Dialogs,
  FMX.Objects, System.SysUtils;

type
  TSort02 = class(TSort)
  private
    procedure sort(layout01 : TLayout);

  public
    constructor Create(layout01 : TLayout);
  end;

implementation

{ TSort02 }

constructor TSort02.Create(layout01: TLayout);
begin
  inherited Create(layout01);
  sleep(2000);
  sort(layout01);

end;

procedure TSort02.sort(layout01: TLayout);
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
