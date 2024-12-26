program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  csvparser in 'csvparser.pas',
  Unit2 in 'Unit2.pas' {Form2},
  UFRPrincipal in 'UFRPrincipal.pas' {FRPrincipal},
  DataGenerator in 'DataGenerator.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFRPrincipal, FRPrincipal);
  Application.Run;
end.
