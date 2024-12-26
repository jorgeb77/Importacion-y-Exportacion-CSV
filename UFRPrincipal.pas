unit UFRPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.ComCtrls, System.UITypes, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TFRPrincipal = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    BtImportMetodo1: TButton;
    BtImportMetodo2: TButton;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    BtExportMetodo1: TButton;
    BtExportMetodo2: TButton;
    BtExportMetodo3: TButton;
    FDMemTable1: TFDMemTable;
    procedure BtImportMetodo1Click(Sender: TObject);
    procedure BtImportMetodo2Click(Sender: TObject);
    procedure BtExportMetodo1Click(Sender: TObject);
    procedure BtExportMetodo2Click(Sender: TObject);
    procedure BtExportMetodo3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    Archivo : string;
    procedure WriteDataSetToCSV(DataSet : TDataSet; FileName : string);
    procedure SaveAsCSV(myFileName : string; DataSet : TDataSet);
  public
    { Public declarations }
  end;

var
  FRPrincipal: TFRPrincipal;

implementation

uses
  Unit1, Unit2, DataGenerator;

{$R *.dfm}

procedure TFRPrincipal.BtExportMetodo1Click(Sender: TObject);
var
  Stream : TFileStream;
  I : Integer;
  OutLine : string;
  sTemp : string;
begin
  FDMemTable1.First;

  Archivo := ExtractFilePath(Application.ExeName) + '\Clientes.csv';
  Stream  := TFileStream.Create(Archivo, fmCreate);
  try
    while not FDMemTable1.Eof do
      begin
        // You'll need to add your special handling here where OutLine is built
        OutLine := '';
        for I := 0 to FDMemTable1.FieldCount - 1 do
          begin
            sTemp := FDMemTable1.Fields[I].AsString;
            // Special handling to sTemp here
            OutLine := OutLine + sTemp + ',';
          end;

        // Remove final unnecessary ','
        SetLength(OutLine, Length(OutLine) - 1);

        // Write line to file
        Stream.Write(OutLine[1], Length(OutLine) * SizeOf(Char));

        // Write line ending
        Stream.Write(sLineBreak, Length(sLineBreak));
        FDMemTable1.Next;
      end;
  finally
    Stream.Free; // Saves the file end; end
  end;

  MessageDlg('Operación Terminada!!!',mtInformation,[mbOK],0);

end;

procedure TFRPrincipal.BtExportMetodo2Click(Sender: TObject);
begin
  Archivo := ExtractFilePath(Application.ExeName) + '\Clientes.csv';

  WriteDataSetToCSV(FDMemTable1, Archivo);

  MessageDlg('Operación Terminada!!!',mtInformation,[mbOK],0);
end;

procedure TFRPrincipal.BtExportMetodo3Click(Sender: TObject);
begin
  Archivo := ExtractFilePath(Application.ExeName) + '\Clientes.csv';

  SaveAsCSV(Archivo,FDMemTable1);

  MessageDlg('Operación Terminada!!!',mtInformation,[mbOK],0);
end;

procedure TFRPrincipal.WriteDataSetToCSV(DataSet : TDataSet; FileName : string);
var
  List : TStringList;
  S : string;
  I : Integer;
begin
  List := TStringList.Create;
  try
    DataSet.First;
    while not DataSet.Eof do
      begin
        S := '';
        for I := 0 to DataSet.FieldCount - 1 do
          begin
            if S > '' then
              S := S + '|'; //Delimitador
//              S := S + '"' + DataSet.Fields[I].AsString + '"';  //Guardarlo entre comillas
//              S := S + QuotedStr(DataSet.Fields[I].AsString);
            S := S + DataSet.Fields[I].AsString;
          end;
        List.Add(S);
        DataSet.Next;
      end;
  finally
    List.SaveToFile(FileName);
    List.Free;
  end;
end;

procedure TFRPrincipal.SaveAsCSV(myFileName : string; DataSet : TDataSet);
var
  myTextFile : TextFile;
  I : Integer;
  S : string;
begin
  //create a new file
  AssignFile(myTextFile, myFileName);
  Rewrite(myTextFile);

  S := ''; //initialize empty string

  try
    //write field names (as column headers)
    for I := 0 to DataSet.FieldCount - 1 do
      begin
        S := S + Format('"%s";', [DataSet.Fields[I].FieldName]);
      end;
    Writeln(myTextFile, S);

    //write field values
    while not DataSet.Eof do
      begin
        S := '';
        for I := 0 to DataSet.FieldCount - 1 do
          begin
            S := S + Format('"%s";', [DataSet.Fields[I].AsString]);
          end;

        Writeln(myTextfile, S);
        DataSet.Next;
      end;

  finally
    CloseFile(myTextFile);
  end;
end;

procedure TFRPrincipal.BtImportMetodo1Click(Sender: TObject);
begin
  Form1 := TForm1.Create(Self);
  Form1.ShowModal;
  Form1.Free;
end;

procedure TFRPrincipal.BtImportMetodo2Click(Sender: TObject);
begin
  Form2 := TForm2.Create(Self);
  Form2.ShowModal;
  Form2.Free;
end;

procedure TFRPrincipal.FormShow(Sender: TObject);
var
  I, Idx : Integer;
begin
  with FDMemTable1.FieldDefs do
    begin
      with AddFieldDef do
        begin
          Name     := 'CLIENTEID';
          DataType := ftInteger;
        end;

      with AddFieldDef do
        begin
          Name     := 'NOMBRES';
          DataType := ftString;
          Size     := 60;
        end;

      with AddFieldDef do
        begin
          Name     := 'APELLIDOS';
          DataType := ftString;
          Size     := 60;
        end;

      with AddFieldDef do
        begin
          Name     := 'TELEFONO';
          DataType := ftString;
          Size     := 20;
        end;

      with AddFieldDef do
        begin
          Name     := 'PAIS';
          DataType := ftString;
          Size     := 30;
        end;

      with AddFieldDef do
        begin
          Name     := 'CAPITAL';
          DataType := ftString;
          Size     := 30;
        end;

      with AddFieldDef do
        begin
          Name     := 'EMAIL';
          DataType := ftString;
          Size     := 30;
        end;

      with AddFieldDef do
        begin
          Name      := 'SALARIO';
          DataType  := ftCurrency;
          Precision := 2;
        end;

      with AddFieldDef do
        begin
          Name     := 'FECHA_CONTRATO';
          DataType := ftDateTime;
        end;

      with AddFieldDef do
        begin
          Name     := 'EMPRESA';
          DataType := ftString;
          Size     := 50;
        end;

      with AddFieldDef do
        begin
          Name     := 'CARGO';
          DataType := ftString;
          Size     := 30;
        end;

      with AddFieldDef do
        begin
          Name     := 'FECHA_NACIMIENTO';
          DataType := ftDateTime;
        end;
    end;


  FDMemTable1.Open;
  FDMemTable1.BeginBatch;
  try
    Randomize;
    for I:= 1 to 500 do
      begin
        Idx := Random(19) + 1;  //Indice aleatorio para los paises

        FDMemTable1.Append;
        FDMemTable1.FieldByName('CLIENTEID').AsInteger         := Random(99999) + 1;
        FDMemTable1.FieldByName('NOMBRES').AsString            := TDataGenerator.GetRandomFirstName;
        FDMemTable1.FieldByName('APELLIDOS').AsString          := TDataGenerator.GetRandomLastName;
        FDMemTable1.FieldByName('TELEFONO').AsString           := TDataGenerator.GenerateRandomPhoneNumber;
        FDMemTable1.FieldByName('PAIS').AsString               := TDataGenerator.GetCountryAndCapital(Idx).Country;
        FDMemTable1.FieldByName('CAPITAL').AsString            := TDataGenerator.GetCountryAndCapital(Idx).Capital;
        FDMemTable1.FieldByName('EMAIL').AsString              := TDataGenerator.GenerateRandomEmail;
        FDMemTable1.FieldByName('SALARIO').AsFloat             := TDataGenerator.RandomRangeDecimal(10000, 50000);
        FDMemTable1.FieldByName('FECHA_CONTRATO').AsDateTime   := TDataGenerator.GenerateRandomDateTime(EncodeDate(1995, 01, 01), EncodeDate(2024, 12, 31));
        FDMemTable1.FieldByName('EMPRESA').AsString            := TDataGenerator.GenerateRandomCompany;
        FDMemTable1.FieldByName('CARGO').AsString              := TDataGenerator.GenerateRandomJobTitle;
        FDMemTable1.FieldByName('FECHA_NACIMIENTO').AsDateTime := TDataGenerator.GenerateRandomDate(EncodeDate(1975, 01, 01), EncodeDate(1990, 12, 31));
        FDMemTable1.Post;
      end;
  finally
    FDMemTable1.EndBatch;
  end;

end;

end.
