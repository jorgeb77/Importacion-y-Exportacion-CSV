{==============================================================================|
| Project : Delphi Simple CSV Parser module | Version : Github Version         |
|==============================================================================|
| Initial Developers of the Original Code are:                                 |
| NanakSR (Indonesia) nanaksr.com                                              |
| All Rights Reserved.                                                         |
|==============================================================================|}

unit csvparser;

interface

uses
  Classes, SysUtils, Windows;

type
  TCSVParseMultiArray = array of array of string;

  TCSVParser = class(TObject)
  private
    FDataFile : string;
    FDelimiter : Char;
    FColCount : Integer;
    FRowCount : Integer;
    FIndex : Integer;
    Feof : Boolean;
    FCol : TStringList;
    FRow : TStringList;
    function GetFields(ColNo : Integer) : string;
    function GetFieldByName(ColName : string) : string;
  public
    constructor Create;
    property DataFile : string read FDataFile write FDataFile;
    property Delimeter : Char read FDelimiter write FDelimiter default ',';
    procedure Open;
    property RowCount : Integer read FRowCount;
    property Fields[index : Integer] : string read GetFields;
    property FieldByName[index : string] : string read GetFieldByName;

    procedure Next;
    property Eof : Boolean read FEof;
  private

//  published

end;

implementation

constructor TCSVParser.Create;
begin
  FDataFile  := '';
  FDelimiter := ',';
  FCol       := TStringList.Create;
  FRow       := TStringList.Create;
  FColCount  := 0;
  FRowCount  := 0;
  FIndex     := -1;
end;

procedure TCSVParser.Open;
var
  GetFiles,Colmn : TStringList;
  I,J : Integer;
begin
  GetFiles := TStringList.Create;
  GetFiles.LoadFromFile(FDataFile);

  Colmn                 := TStringList.Create;
  Colmn.StrictDelimiter := True;
  Colmn.Delimiter       := FDelimiter;
  Colmn.DelimitedText   := GetFiles.Strings[0];
  FColCount             := Colmn.Count-1;

  for I := 0 to FColCount do
    begin
      FCol.Add(Colmn.Strings[I]);
    end;

  FRowCount := 0;
  for J := 1 to GetFiles.Count-1 do
    begin
      Inc(FRowCount);
      FRow.Add(GetFiles.Strings[J]);
    end;

  FIndex := 0;
  Feof := False;
end;

function TCSVParser.GetFields(ColNo : Integer) : string;
var
  Row : TStringList;
begin
  if ColNo > FColCount then
    raise Exception.Create('out of index column, Max: Fields['+IntToStr(FColCount)+']');

  Row                 := TStringList.Create;
  Row.StrictDelimiter := True;
  Row.Delimiter       := FDelimiter;
  Row.DelimitedText   := FRow.Strings[FIndex];
  Result              := Row.Strings[ColNo];
end;

function TCSVParser.GetFieldByName(ColName : string) : string;
var
  Row : TStringList;
  ColIndex : Integer;
begin
  ColIndex := FCol.IndexOf(ColName);
  if ColIndex = -1 then
    raise Exception.Create('Column '+ColName+' Not Found');

  Row                 := TStringList.Create;
  Row.StrictDelimiter := True;
  Row.Delimiter       := FDelimiter;
  Row.DelimitedText   := FRow.Strings[FIndex];
  Result              := Row.Strings[ColIndex];
end;

procedure TCSVParser.Next;
begin
  Inc(FIndex);
  if FIndex = FRow.Count then
    FEof := True;
end;

end.
