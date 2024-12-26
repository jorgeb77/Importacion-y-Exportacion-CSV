unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, ShellApi,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Samples.Gauges, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.StorageBin,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TJusticado = (tjLeft, tjCenter, tjRight);

type
  TForm1 = class(TForm)
    LbTiempoInicial: TLabel;
    opd: TFileOpenDialog;
    BtImportar: TButton;
    MmList: TMemo;
    EdDelimitador: TLabeledEdit;
    Gauge1: TGauge;
    EdRutaArchivo: TLabeledEdit;
    BtArchivo: TButton;
    DsClientes: TDataSource;
    DBGrid1: TDBGrid;
    BtImpTabla: TButton;
    BtExportarTxt: TButton;
    MtClientes: TFDMemTable;
    Bevel1: TBevel;
    procedure BtImportarClick(Sender: TObject);
    procedure BtArchivoClick(Sender: TObject);
    procedure BtImpTablaClick(Sender: TObject);
    procedure BtExportarTxtClick(Sender: TObject);
  private
    FtempoInicial : Double;
    function FileLines(Archivo : string) : Integer;
    function ObtenerToken(Linea : string; Delimitador : Char; Posicion : Integer) : string;
    function Justifica(Texto : string; Longitud : SmallInt; Rellena : Char; Justificado : TJusticado) : string;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.BtArchivoClick(Sender: TObject);
begin
  if (opd.Execute) then
    EdRutaArchivo.Text := opd.FileName;
end;

procedure TForm1.BtImportarClick(Sender: TObject);
var
//  SlArchivo, SlLinea : TStringList;
//  I, J : Integer;
  Hilo : TThread;
begin
  if Trim(EdRutaArchivo.Text) = '' then
    Exit;

  Hilo := TThread.CreateAnonymousThread(procedure
          var
            SlArchivo, SlLinea : TStringList;
            I, J : Integer;
          begin
            FtempoInicial := Now;
            MmList.Lines.Clear;
            Gauge1.Progress := 0;
            Gauge1.MaxValue := FileLines(EdRutaArchivo.Text);

            SlArchivo := TStringList.Create;
            SlLinea   := TStringList.Create;
            SlLinea.Delimiter := EdDelimitador.Text[1]; // Establecer el delimitador

            {esta propiedad viene por defecto en False
             (considera los espacios como delimitadores también),
              establecemos True para que no rompa líneas donde hay espacios en blanco.}
            SlLinea.StrictDelimiter := True;

            try
              SlArchivo.LoadFromFile(EdRutaArchivo.Text);

              if SlArchivo.Count = 0 then
                Exit;

              for I:= 1 to SlArchivo.Count - 1 do
                begin
                  SlLinea.DelimitedText:= SlArchivo[I]; // Recibe el texto (por linea)

                  for J := 0 to SlLinea.Count - 1 do
                    begin
                      MmList.Lines.Add(SlLinea[J]); //Texto envuelto en línea
                    end;

                  Gauge1.Progress := Gauge1.Progress + 2; //Ponemos 2 por que no se cuenta el encabezado
                  Gauge1.Refresh;
                end;
            finally
              FreeAndNil(SlLinea);
              FreeAndNil(SlArchivo);
            end;

            Hilo.Synchronize(nil, procedure
                 begin
                   LbTiempoInicial.Caption := FormatDateTime('hh:nn:ss',FtempoInicial - Now);
                   FtempoInicial := 0;
                 end);
          end);

  Hilo.Start;

end;

procedure TForm1.BtImpTablaClick(Sender: TObject);
var
  Hilo : TThread;
begin
  if Trim(EdRutaArchivo.Text) = '' then
    Exit;

  Hilo := TThread.CreateAnonymousThread(procedure
          var
            SlArchivo : TStringList;
            I, SpacePos : Integer;
            Delimitador : Char;
            Fecha, TempFecha : string;
            FormatSettings : TFormatSettings;
          begin
            FtempoInicial   := Now;
            Gauge1.Progress := 0;
            Gauge1.MaxValue := FileLines(EdRutaArchivo.Text);

            SlArchivo   := TStringList.Create;
            Delimitador := EdDelimitador.Text[1]; // Establecer el delimitador

            try
              SlArchivo.LoadFromFile(EdRutaArchivo.Text);

              if SlArchivo.Count = 0 then
                Exit;

              MtClientes.DisableControls;

              for I:= 1 to SlArchivo.Count - 1 do
                begin
                  with MtClientes do
                    begin
                      Append;
                      FieldByName('CLIENTEID').AsInteger         := StrToInt(ObtenerToken(SlArchivo[I], Delimitador, 1));
                      FieldByName('NOMBRES').AsString            := ObtenerToken(SlArchivo[I], Delimitador, 2);
                      FieldByName('APELLIDOS').AsString          := ObtenerToken(SlArchivo[I], Delimitador, 3);
                      FieldByName('TELEFONO').AsString           := ObtenerToken(SlArchivo[I], Delimitador, 4);
                      FieldByName('PAIS').AsString               := ObtenerToken(SlArchivo[I], Delimitador, 5);
                      FieldByName('CAPITAL').AsString            := ObtenerToken(SlArchivo[I], Delimitador, 6);
                      FieldByName('EMAIL').AsString              := ObtenerToken(SlArchivo[I], Delimitador, 7);
                      FieldByName('SALARIO').AsFloat             := StrToFloat(ObtenerToken(SlArchivo[I], Delimitador, 8));
                      FieldByName('FECHA_CONTRATO').AsDateTime   := StrToDateTime(ObtenerToken(SlArchivo[I], Delimitador, 9));
                      FieldByName('EMPRESA').AsString            := ObtenerToken(SlArchivo[I], Delimitador, 10);
                      FieldByName('CARGO').AsString              := ObtenerToken(SlArchivo[I], Delimitador, 11);
                      FieldByName('FECHA_NACIMIENTO').AsDateTime := StrToDateTime(ObtenerToken(SlArchivo[I], Delimitador, 12));


                      //DEBIDO A QUE LA FECHA VIENE CON ESTE FORMATO 22/2/1982 0:00 DEBEMOS ELIMINARLE LA HORA

//                      TempFecha := ObtenerToken(SlArchivo[I], Delimitador, 6);
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
//
//
//                      // Configurar el formato de fecha esperado
//                      FormatSettings := TFormatSettings.Create;
//                      FormatSettings.DateSeparator := '/';
//                      FormatSettings.ShortDateFormat := 'dd/mm/yyyy'; //usamos este formato por que así esta almacenado en el archivo, esto hay que tomarlo en cuenta.
//
//                      // Usar StrToDateTime en lugar de StrToDate para mayor compatibilidad
//                      FieldByName('FECHANACIMIENTO').AsDateTime := StrToDateTime(Fecha, FormatSettings);

                      Post;
                    end;

                  Gauge1.Progress := Gauge1.Progress + 2; //Ponemos 2 por que no se cuenta el encabezado
                  Gauge1.Refresh;
                end;
            finally
              FreeAndNil(SlArchivo);
              MtClientes.EnableControls;
            end;

            Hilo.Synchronize(nil, procedure
                 begin
                   LbTiempoInicial.Caption := FormatDateTime('hh:nn:ss',FtempoInicial - Now);
                   FtempoInicial := 0;
                 end);
          end);

  Hilo.Start;

end;

procedure TForm1.BtExportarTxtClick(Sender: TObject);
var
  I : Integer;
  myFile : TextFile;
begin
  if MtClientes.RecordCount = 0 then
    Exit;

  AssignFile(myFile, ExtractFilePath(Application.ExeName) + '\Clientes.txt');
  ReWrite(myFile);

  //CREAMOS EL TITULO DE LOS ENCABEZADOS
  WriteLn(myFile, StringOfChar('=',175));

  WriteLn(myFile, Justifica('CLIENTEID',15,' ',tjLeft) +
                  Justifica('NOMBRES',50,' ',tjLeft) +
                  Justifica('APELLIDOS',50,' ',tjLeft) +
                  Justifica('TELEFONO',20,' ',tjLeft) +
                  Justifica('EMAIL',20,' ',tjLeft) +
                  Justifica('FECHA_NACIMIENTO',20,' ',tjRight));

  WriteLn(myFile, StringOfChar('=',175));

  with MtClientes do
    begin
      DisableControls;
      First;

      for I := 0 to RecordCount - 1 do
        begin
          WriteLn(myFile,
                  Justifica(FieldByName('CLIENTEID').AsString,15,' ',tjLeft) +
                  Justifica(FieldByName('NOMBRES').AsString,50,' ',tjLeft) +
                  Justifica(FieldByName('APELLIDOS').AsString,50,' ',tjLeft) +
                  Justifica(FieldByName('TELEFONO').AsString,20,' ',tjLeft) +
                  Justifica(FieldByName('EMAIL').AsString,20,' ',tjLeft) +
                  Justifica(FormatDateTime('DD-MM-YYYY', FieldByName('FECHA_NACIMIENTO').AsDateTime),20,' ',tjRight));

          Next;
        end;

      EnableControls;
    end;

  CloseFile(myFile);

  //ABRIMOS EL ARCHIVO GENERADO
  ShellExecute(Handle,'open','c:\windows\notepad.exe',
        PWideChar(ExtractFilePath(Application.ExeName) + '\Clientes.txt'), nil, SW_SHOWNORMAL);
end;

function TForm1.FileLines(Archivo : string) : Integer;
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

//FUNCION PARA OBTENER EL TOKEN DE UNA CADENA DELIMITADA USANDO STRINGLIST
function TForm1.ObtenerToken(Linea : string; Delimitador : Char; Posicion : Integer) : string;
var
  Lista : TStringList;
  I : Integer;
begin
  Lista := TStringList.Create;
  try
    Lista.Clear;
    ExtractStrings([Delimitador], [], PChar(Linea), Lista);

    for I:= 0 to Lista.Count -1 do
      if (I+1) = Posicion then
        Result:= Lista[I];
  finally
    Lista.Free;
  end;
end;

function TForm1.Justifica(Texto : string; Longitud : SmallInt; Rellena : Char; Justificado : TJusticado) : string;
  function RellenaLinea(Longitud : SmallInt; Rellena : Char) : string;
  begin
    Result := '';
    while Length(Result) < Longitud do
      Result := Result + Rellena;
  end;

var
  LongTexto : SmallInt;
begin
  LongTexto := Length(Texto);
  if  LongTexto  < Longitud then
    begin
      LongTexto := Longitud - LongTexto;
      case Justificado of
        tjLeft   : Texto := Texto+ RellenaLinea(LongTexto, Rellena);
        tjRight  : Texto := RellenaLinea(LongTexto, Rellena) + Texto;
        tjCenter : Texto := RellenaLinea((LongTexto - Round(LongTexto/ 2)), Rellena) +
                            Texto + RellenaLinea((Round(LongTexto/ 2)) , Rellena);
      end;
    end;
   Result := Texto;
end;


end.
