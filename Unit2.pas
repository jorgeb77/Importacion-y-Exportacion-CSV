unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Samples.Gauges, Vcl.ExtCtrls, Vcl.Samples.Spin,
  Vcl.WinXCtrls, Vcl.Mask, System.UITypes, System.Diagnostics,
  Data.DB, Vcl.Grids, Vcl.DBGrids,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin;


type
  TForm2 = class(TForm)
    Memo1: TMemo;
    EdDelimitador: TLabeledEdit;
    EdRutaArchivo: TLabeledEdit;
    LbTiempo: TLabel;
    BtArchivo: TButton;
    opd: TFileOpenDialog;
    BtImportar: TButton;
    ActivityIndicator1: TActivityIndicator;
    Gauge1: TGauge;
    Bevel1: TBevel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    FDMemTable1: TFDMemTable;
    procedure BtImportarClick(Sender: TObject);
    procedure BtArchivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    function SegundoAFecha(Segundos : Int64) : TDateTime;
    function FileLines(Archivo : string) : Integer;
    function IsEmptyOrNull(const Value : Variant) : Boolean;
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

uses csvparser;

{$R *.dfm}

procedure TForm2.BtArchivoClick(Sender: TObject);
begin
  if (opd.Execute) then
    EdRutaArchivo.Text := opd.FileName;
end;

procedure TForm2.BtImportarClick(Sender: TObject);
var
  Hilo : TThread;
begin
  if Trim(EdRutaArchivo.Text) = '' then
    Exit;

  Hilo := TThread.CreateAnonymousThread(procedure
          var
            ParseCsv : TCSVParser;
            Cronometro : TStopwatch;
            Milisegundos : Int64;
            T : Integer;
//            SpacePos : Integer;
//            Fecha, TempFecha : string;
//            FormatSettings : TFormatSettings;
          begin
            Cronometro := TStopwatch.StartNew;
            ParseCsv   := TCSVParser.Create;
            ActivityIndicator1.Visible := True;
            ActivityIndicator1.Animate := True;

            ParseCsv.DataFile  := Trim(EdRutaArchivo.Text);
            ParseCsv.Delimeter := EdDelimitador.Text[1];

            try
              ParseCsv.Open;

              FDMemTable1.Open;
              FDMemTable1.BeginBatch;

              Gauge1.Progress := 0;
              T               := FileLines(EdRutaArchivo.Text);
//              T               := ParseCsv.RowCount;
              Gauge1.MaxValue := T-1;

              while not ParseCsv.Eof do
                begin
//                  Memo1.Lines.Add( ParseCsv.FieldByName['nombre'] +' '+ ParseCsv.FieldByName['direccion'] +' '+
//                                   ParseCsv.FieldByName['telefono'] +' '+ ParseCsv.FieldByName['fecha'] +' '+
//                                   ParseCsv.FieldByName['ciudad'] +' '+ ParseCsv.FieldByName['pais'] +#10#13 );

//                  Memo1.Lines.Add( ParseCsv.Fields[0] +' '+ ParseCsv.Fields[1] +' '+
//                                   ParseCsv.Fields[2] +' '+ ParseCsv.Fields[3] +' '+
//                                   ParseCsv.Fields[4] +' '+ ParseCsv.Fields[5] +#10#13 );

//                  Memo1.Lines.Add( ParseCsv.Fields[0] +' '+ ParseCsv.Fields[1] +' '+
//                                   ParseCsv.Fields[2] +' '+ ParseCsv.Fields[3] +' '+
//                                   ParseCsv.Fields[4] +' '+ ParseCsv.Fields[5] +' '+
//                                   ParseCsv.Fields[6] +' '+ ParseCsv.Fields[7] +' '+
//                                   ParseCsv.Fields[8] +' '+ ParseCsv.Fields[9] +' '+
//                                   ParseCsv.Fields[10] +#10#13);



                  with FDMemTable1 do
                    begin
                      Append;

                      if ParseCsv.Fields[0] <> EmptyStr then
                        FieldByName('CLIENTEID').AsString := ParseCsv.Fields[0];

                      if ParseCsv.Fields[1] <> EmptyStr then
                        FieldByName('NOMBRES').AsString := ParseCsv.Fields[1];

                      if ParseCsv.Fields[2] <> EmptyStr then
                        FieldByName('APELLIDOS').AsString := ParseCsv.Fields[2];

                      if ParseCsv.Fields[3] <> EmptyStr then
                        FieldByName('TELEFONO').AsString := ParseCsv.Fields[3];

                      if IsEmptyOrNull(ParseCsv.Fields[4]) = False then
                        FieldByName('PAIS').AsString := ParseCsv.Fields[4]
                      else
                        FieldByName('PAIS').AsString := Null;

                      if IsEmptyOrNull(ParseCsv.Fields[5]) = False then
                        FieldByName('CAPITAL').AsString := ParseCsv.Fields[5]
                      else
                        FieldByName('CAPITAL').AsString := Null;

                      if IsEmptyOrNull(ParseCsv.Fields[6]) = False then
                        FieldByName('EMAIL').AsString := ParseCsv.Fields[6]
                      else
                        FieldByName('EMAIL').AsString := Null;

                      if IsEmptyOrNull(ParseCsv.Fields[7]) = False then
                        FieldByName('SALARIO').AsFloat := StrToFloat(ParseCsv.Fields[7])
                      else
                        FieldByName('SALARIO').AsFloat := Null;

                      if IsEmptyOrNull(ParseCsv.Fields[8]) = False then
                        FieldByName('FECHA_CONTRATO').AsDateTime := StrToDateTime(ParseCsv.Fields[8])
                      else
                        FieldByName('FECHA_CONTRATO').AsDateTime := Null;

                      if IsEmptyOrNull(ParseCsv.Fields[9]) = False then
                        FieldByName('EMPRESA').AsString := ParseCsv.Fields[9]
                      else
                        FieldByName('EMPRESA').AsString := Null;

                      if IsEmptyOrNull(ParseCsv.Fields[10]) = False then
                        FieldByName('CARGO').AsString := ParseCsv.Fields[10]
                      else
                        FieldByName('CARGO').AsString := Null;

                      if IsEmptyOrNull(ParseCsv.Fields[11]) = False then
                        FieldByName('FECHA_NACIMIENTO').AsDateTime := StrToDateTime(ParseCsv.Fields[11])
                      else
                        FieldByName('FECHA_NACIMIENTO').AsDateTime := Null;


//                      //DEBIDO A QUE LA FECHA VIENE CON ESTE FORMATO 22/2/1982 0:00 DEBEMOS ELIMINARLE LA HORA
//
//                      TempFecha := ParseCsv.Fields[5];
//
//                      // Encontrar la posición del espacio
//                      SpacePos := Pos(' ', TempFecha);
//
//                      // Si se encuentra el espacio, tomar solo la parte antes del espacio
//                      if SpacePos > 0 then
//                        Fecha := Copy(TempFecha, 1, SpacePos - 1)
//                      else
//                        Fecha := TempFecha; // Si no se encuentra el espacio, devolver la cadena completa
//
//                      // Configurar el formato de fecha esperado
//                      FormatSettings := TFormatSettings.Create;
//                      FormatSettings.DateSeparator := '/';
//                      FormatSettings.ShortDateFormat := 'dd/mm/yyyy'; //usamos este formato por que así esta almacenado en el archivo, esto hay que tomarlo en cuenta.
//
//                      if IsEmptyOrNull(Fecha) = False then
//                        FieldByName('FECHA_NACIMIENTO').AsDateTime := StrToDateTime(Fecha, FormatSettings)
//                      else
//                        FieldByName('FECHA_NACIMIENTO').AsDateTime := Null;

                      Post;
                    end;

                  Application.ProcessMessages;

                  ParseCsv.Next;

                  Gauge1.Progress := Gauge1.Progress + 1;
                  Gauge1.Refresh;
                  Update;
                end;

            finally
              ParseCsv.Free;
              FDMemTable1.EndBatch;
            end;

            Hilo.Synchronize(nil, procedure
                 begin
                   ActivityIndicator1.Animate := False;
                   ActivityIndicator1.Visible := False;
                   Milisegundos     := Cronometro.ElapsedMilliseconds;
                   LbTiempo.Caption := FormatDateTime('hh:nn:ss', SegundoAFecha(Milisegundos));
                 end);
          end);

  Hilo.Start;

end;

procedure TForm2.FormShow(Sender: TObject);
begin
  ActivityIndicator1.Visible := False;
end;

function TForm2.SegundoAFecha(Segundos : Int64) : TDateTime;
var
   dt : TDateTime;
begin
  dt     := Segundos / MSecsPerSec / SecsPerDay;
  Result := dt;
end;

function TForm2.FileLines(Archivo : string) : Integer;
var
  Lineas : Integer;
  txt : TStringList;
begin
//  Lineas := 0;
  txt := TStringList.Create;
  try
    txt.LoadFromFile(Archivo);
    Lineas := txt.Count;
  finally
    txt.Free;
  end;
  Result := Lineas;
end;

function TForm2.IsEmptyOrNull(const Value : Variant) : Boolean;
begin
  Result := VarIsClear(Value) or VarIsEmpty(Value) or VarIsNull(Value) or (VarCompareValue(Value, Unassigned) = vrEqual);
  if (not Result) and VarIsStr(Value) then
    Result := Value = '';
end;


end.
