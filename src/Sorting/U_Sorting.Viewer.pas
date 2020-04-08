unit U_Sorting.Viewer;

interface

uses
  U_SortClass, U_Sort.Bubble, U_Sort.Insertion, U_Sort.Selection, U_Sort.Comb,
  FMX.Controls, FMX.Layouts, System.Classes, FMX.Types, FMX.Forms, System.SysUtils,
  FMX.Objects, FMX.Effects, FMX.Controls.Presentation, FMX.StdCtrls, rtti,
  FMX.Filter.Effects, System.Types, FMX.Edit, FMX.EditBox, FMX.SpinBox;

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
    bInsertionSort: TButton;
    bSelectionSort: TButton;
    bCombSort: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    ShadowEffect2: TShadowEffect;
    Layout5: TLayout;
    Rectangle1: TRectangle;
    Layout6: TLayout;
    Label1: TLabel;
    SpinBox1: TSpinBox;
    Timer1: TTimer;
    procedure bBubbleSortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure bInsertionSortClick(Sender: TObject);
    procedure bSelectionSortClick(Sender: TObject);
    procedure bCombSortClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    var
      fSort : TSortClass;
      retorno : Boolean;

    procedure sort(tipo : Integer);
    procedure bloqueio();

  public
    { Public declarations }
  end;

var
  SortingViewer: TSortingViewer;

implementation

{$R *.fmx}

procedure TSortingViewer.bBubbleSortClick(Sender: TObject);
begin
  Text1.Text := 'SortingAlghoritms - BubbleSort';
  Self.sort(0);

end;


procedure TSortingViewer.bCombSortClick(Sender: TObject);
begin
  Text1.Text := 'SortingAlghoritms - CombSort';
  Self.sort(3);

end;

procedure TSortingViewer.bInsertionSortClick(Sender: TObject);
begin
  Text1.Text := 'SortingAlghoritms - InsertionSort';
  Self.sort(1);

end;

procedure TSortingViewer.bloqueio;
var
  I: Integer;
  item: TControl;

begin
  Timer1.Enabled := not Timer1.Enabled;

  for I := 0 to Layout4.ControlsCount - 1 do
  begin
    item := Layout4.Controls[I];
    if item.ClassType = TButton then
    begin
      TButton(item).Enabled := not TButton(item).Enabled;
    end;
  end;

end;

procedure TSortingViewer.bSelectionSortClick(Sender: TObject);
begin
  Text1.Text := 'SortingAlghoritms - SelectionSort';
  Self.sort(2);

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

procedure TSortingViewer.sort(tipo : Integer);
begin
  ShadowEffect1.UpdateParentEffects;

  if Assigned(fSort) then
  begin
    fSort.Free;
  end;

  case tipo of
    0: fSort := TSortBubble.Create(Layout5, SpinBox1.Value);
    1: fSort := TSortInsertion.Create(Layout5, SpinBox1.Value);
    2: fSort := TSortSelection.Create(Layout5, SpinBox1.Value);
    3: fSort := TSortComb.Create(Layout5, SpinBox1.Value);
  end;

  Self.bloqueio();

  fSort.sort();
end;

procedure TSortingViewer.Timer1Timer(Sender: TObject);
begin
  if fSort.Finalizado then
  begin
    Self.bloqueio();
  end;
end;

end.
