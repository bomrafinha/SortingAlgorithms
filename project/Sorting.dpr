program Sorting;

uses
  System.StartUpCopy,
  FMX.Forms,
  U_Sorting.Viewer in '..\src\Sorting\U_Sorting.Viewer.pas' {SortingViewer};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TSortingViewer, SortingViewer);
  Application.Run;
end.
