unit U_Sorting.Viewer;

interface

uses
  U_SortClass, U_Sort.Bubble, {U_Sort.Insertion, U_Sort.Selection, U_Sort.Comb,}
  FMX.Controls, FMX.Layouts, System.Classes, FMX.Types, FMX.Forms, System.SysUtils,
  FMX.Objects, FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Filter.Effects, System.Types;

type
  TSortingViewer = class(TForm)
    Layout1: TLayout;
    Layout2: TLayout;
    Layout3: TLayout;
    Layout4: TLayout;
    Text1: TText;
    ShadowEffect1: TShadowEffect;
    bBubbleSort: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    ShadowEffect2: TShadowEffect;
    Layout5: TLayout;
    Rectangle1: TRectangle;
    procedure bBubbleSortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    var
      fSort : TSortClass;

  public
    { Public declarations }
  end;

var
  SortingViewer: TSortingViewer;

implementation

{$R *.fmx}

procedure TSortingViewer.bBubbleSortClick(Sender: TObject);
begin
  if Assigned(fSort) then
  begin
    fSort.Free;
  end;
  fSort := TSortBubble.Create(Layout5);
  fSort.sort();

end;


procedure TSortingViewer.FormCreate(Sender: TObject);
var
  ScreenSize: TSize;

begin
  ScreenSize := Screen.Size;

  Self.Width := trunc(ScreenSize.Width * 0.8);
  Self.Height := trunc(ScreenSize.Height * 0.8);

  Self.Layout2.Size.Height := 50;
  Self.Layout4.Size.Width := 140;

end;

end.
