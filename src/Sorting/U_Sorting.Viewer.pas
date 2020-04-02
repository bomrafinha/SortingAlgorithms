unit U_Sorting.Viewer;

interface

uses
  FMX.Controls, FMX.Layouts, System.Classes, FMX.Types, FMX.Forms,
  U_SortClass, U_Sort.Bubble, U_Sort.Insertion, U_Sort.Selection, U_Sort.Comb;

type
  TSortingViewer = class(TForm)
    Timer1: TTimer;
    Layout1: TLayout;
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SortingViewer: TSortingViewer;

implementation

{$R *.fmx}

procedure TSortingViewer.FormShow(Sender: TObject);
begin
  Timer1.Enabled := True;
end;

procedure TSortingViewer.Timer1Timer(Sender: TObject);
var
  sort : TSortClass;

begin
  Timer1.Enabled := False;
//  sort := TSort04.Create(Layout1);

end;

end.
