{**************************************************************************************************}
{                                                                                                  }
{ Project JEDI Code Library (JCL)                                                                  }
{                                                                                                  }
{ The contents of this file are subject to the Mozilla Public License Version 1.1 (the "License"); }
{ you may not use this file except in compliance with the License. You may obtain a copy of the    }
{ License at http://www.mozilla.org/MPL/                                                           }
{                                                                                                  }
{ Software distributed under the License is distributed on an "AS IS" basis, WITHOUT WARRANTY OF   }
{ ANY KIND, either express or implied. See the License for the specific language governing rights  }
{ and limitations under the License.                                                               }
{                                                                                                  }
{ The Original Code is JclIniFiles.pas.                                                            }
{                                                                                                  }
{ The Initial Developers of the Original Code are documented in the accompanying help file         }
{ JCLHELP.hlp. Portions created by these individuals are Copyright (C) of these individuals.       }
{                                                                                                  }
{**************************************************************************************************}
{                                                                                                  }
{ Unit owner: Eric S. Fisher                                                                       }
{                                                                                                  }
{**************************************************************************************************}

// $Id: JclIniFiles.pas,v 1.1 2005/02/14 19:26:25 bert Exp $

unit JclIniFiles;

{$I jcl.inc}

{$IFDEF SUPPORTS_WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF SUPPORTS_WEAKPACKAGEUNIT}

interface

uses
  Classes, IniFiles, SysUtils;

//--------------------------------------------------------------------------------------------------
// Initialization (ini) Files
//--------------------------------------------------------------------------------------------------

function IniReadBool(const FileName, Section, Line: string): Boolean;
function IniReadInteger(const FileName, Section, Line: string): Integer;
function IniReadString(const FileName, Section, Line: string): string;
procedure IniWriteBool(const FileName, Section, Line: string; Value: Boolean);
procedure IniWriteInteger(const FileName, Section, Line: string; Value: Integer);
procedure IniWriteString(const FileName, Section, Line, Value: string);

//--------------------------------------------------------------------------------------------------
// Initialization (ini) Files helper routines
//--------------------------------------------------------------------------------------------------

procedure IniReadStrings(IniFile: TCustomIniFile; const Section: string; Strings: TStrings);
procedure IniWriteStrings(IniFile: TCustomIniFile; const Section: string; Strings: TStrings);

implementation

//==================================================================================================
// Initialization Files
//==================================================================================================

function IniReadBool(const FileName, Section, Line: string): Boolean;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    Result := Ini.ReadBool(Section, Line, False);
  finally
    Ini.Free;
  end;
end;

//--------------------------------------------------------------------------------------------------

function IniReadInteger(const FileName, Section, Line: string): Integer;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    Result := Ini.ReadInteger(Section, Line, 0);
  finally
    Ini.Free;
  end;
end;

//--------------------------------------------------------------------------------------------------

function IniReadString(const FileName, Section, Line: string): string;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    Result := Ini.ReadString(Section, Line, '');
  finally
    Ini.Free;
  end;
end;

//--------------------------------------------------------------------------------------------------

procedure IniWriteBool(const FileName, Section, Line: string; Value: Boolean);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    Ini.WriteBool(Section, Line, Value);
  finally
    Ini.Free;
  end;
end;

//--------------------------------------------------------------------------------------------------

procedure IniWriteInteger(const FileName, Section, Line: string; Value: Integer);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    Ini.WriteInteger(Section, Line, Value);
  finally
    Ini.Free;
  end;
end;

//--------------------------------------------------------------------------------------------------

procedure IniWriteString(const FileName, Section, Line, Value: string);
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(FileName);
  try
    Ini.WriteString(Section, Line, Value);
  finally
    Ini.Free;
  end;
end;

//==================================================================================================
// Initialization (ini) Files helper routines
//==================================================================================================

const
  ItemCountName = 'Count';

//--------------------------------------------------------------------------------------------------

procedure IniReadStrings(IniFile: TCustomIniFile; const Section: string; Strings: TStrings);
var
  Count, I: Integer;
begin
  with IniFile do
  begin
    Strings.Clear;
    Count := ReadInteger(Section, ItemCountName, 0);
    for I := 0 to Count - 1 do
      Strings.Add(ReadString(Section, IntToStr(I), ''));
  end;
end;

//--------------------------------------------------------------------------------------------------

procedure IniWriteStrings(IniFile: TCustomIniFile; const Section: string; Strings: TStrings);
var
  I: Integer;
begin
  with IniFile do
  begin
    EraseSection(Section);
    WriteInteger(Section, ItemCountName, Strings.Count);
    for I := 0 to Strings.Count - 1 do
      WriteString(Section, IntToStr(I), Strings[I]);
  end;
end;

end.
