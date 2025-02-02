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
{ The Original Code is JclLogic.pas.                                                               }
{                                                                                                  }
{ The Initial Developers of the Original Code are documented in the accompanying help file         }
{ JCLHELP.hlp. Portions created by these individuals are Copyright (C) of these individuals.       }
{                                                                                                  }
{**************************************************************************************************}
{                                                                                                  }
{ Various routines to perform various arithmetic and logical operations on one or more ordinal     }
{ values (integer numbers). This includes various bit manipulation routines, min/max testing and   }
{ conversion to string.                                                                            }
{                                                                                                  }
{ Unit owner: Marcel van Brakel                                                                    }
{                                                                                                  }
{**************************************************************************************************}

// $Id: JclLogic.pas,v 1.1 2005/02/14 19:26:25 bert Exp $

unit JclLogic;

{$I jcl.inc}
{$RANGECHECKS OFF}

{$IFDEF SUPPORTS_WEAKPACKAGEUNIT}
  {$WEAKPACKAGEUNIT ON}
{$ENDIF SUPPORTS_WEAKPACKAGEUNIT}

interface

//--------------------------------------------------------------------------------------------------
// Conversion
//--------------------------------------------------------------------------------------------------

function OrdToBinary(const Value: Byte): string; overload;
function OrdToBinary(const Value: Shortint): string; overload;
function OrdToBinary(const Value: Smallint): string; overload;
function OrdToBinary(const Value: Word): string; overload;
function OrdToBinary(const Value: Integer): string; overload;
function OrdToBinary(const Value: Cardinal): string; overload;
function OrdToBinary(const Value: Int64): string; overload;

//--------------------------------------------------------------------------------------------------
// Bit manipulation
//--------------------------------------------------------------------------------------------------

type
  TBitRange = Byte;
  TBooleanArray = array of Boolean;

function BitsHighest(X: Byte): Integer; overload;
function BitsHighest(X: ShortInt): Integer; overload;
function BitsHighest(X: SmallInt): Integer; overload;
function BitsHighest(X: Word): Integer; overload;
function BitsHighest(X: Integer): Integer; overload;
function BitsHighest(X: Cardinal): Integer; overload;
function BitsHighest(X: Int64): Integer; overload;

function BitsLowest(X: Byte): Integer; overload;
function BitsLowest(X: Shortint): Integer; overload;
function BitsLowest(X: Smallint): Integer; overload;
function BitsLowest(X: Word): Integer; overload;
function BitsLowest(X: Cardinal): Integer; overload;
function BitsLowest(X: Integer): Integer; overload;
function BitsLowest(X: Int64): Integer; overload;

function ClearBit(const Value: Byte; const Bit: TBitRange): Byte; overload;
function ClearBit(const Value: Shortint; const Bit: TBitRange): Shortint; overload;
function ClearBit(const Value: Smallint; const Bit: TBitRange): Smallint; overload;
function ClearBit(const Value: Word; const Bit: TBitRange): Word; overload;
function ClearBit(const Value: Integer; const Bit: TBitRange): Integer; overload;
function ClearBit(const Value: Cardinal; const Bit: TBitRange): Cardinal; overload;
function ClearBit(const Value: Int64; const Bit: TBitRange): Int64; overload;
procedure ClearBitBuffer(var Value; const Bit: TBitRange); // todo document

function CountBitsSet(X: Byte): Integer; overload;
function CountBitsSet(X: Word): Integer; overload;
function CountBitsSet(X: Smallint): Integer; overload;
function CountBitsSet(X: ShortInt): Integer; overload;
function CountBitsSet(X: Integer): Integer; overload;
function CountBitsSet(X: Cardinal): Integer; overload;
function CountBitsSet(X: Int64): Integer; overload;

function CountBitsCleared(X: Byte): Integer; overload;
function CountBitsCleared(X: Shortint): Integer; overload;
function CountBitsCleared(X: Smallint): Integer; overload;
function CountBitsCleared(X: Word): Integer; overload;
function CountBitsCleared(X: Integer): Integer; overload;
function CountBitsCleared(X: Cardinal): Integer; overload;
function CountBitsCleared(X: Int64): Integer; overload;

function LRot(const Value: Byte; const Count: TBitRange): Byte; overload;
function LRot(const Value: Word; const Count: TBitRange): Word; overload;
function LRot(const Value: Integer; const Count: TBitRange): Integer; overload;

function ReverseBits(Value: Byte): Byte; overload;
function ReverseBits(Value: Shortint): Shortint; overload;
function ReverseBits(Value: Smallint): Smallint; overload;
function ReverseBits(Value: Word): Word; overload;
function ReverseBits(Value: Integer): Integer; overload;
function ReverseBits(Value: Cardinal): Cardinal; overload;
function ReverseBits(Value: Int64): Int64; overload;
function ReverseBits(P: Pointer; Count: Integer): Pointer; overload;

function RRot(const Value: Byte; const Count: TBitRange): Byte; overload;
function RRot(const Value: Word; const Count: TBitRange): Word; overload;
function RRot(const Value: Integer; const Count: TBitRange): Integer; overload;

function Sar(const Value: Shortint; const Count: TBitRange): Shortint; overload;
function Sar(const Value: Smallint; const Count: TBitRange): Smallint; overload;
function Sar(const Value: Integer; const Count: TBitRange): Integer; overload;

function SetBit(const Value: Byte; const Bit: TBitRange): Byte; overload;
function SetBit(const Value: Shortint; const Bit: TBitRange): Shortint; overload;
function SetBit(const Value: Smallint; const Bit: TBitRange): Smallint; overload;
function SetBit(const Value: Word; const Bit: TBitRange): Word; overload;
function SetBit(const Value: Cardinal; const Bit: TBitRange): Cardinal; overload;
function SetBit(const Value: Integer; const Bit: TBitRange): Integer; overload;
function SetBit(const Value: Int64; const Bit: TBitRange): Int64; overload;
procedure SetBitBuffer(var Value; const Bit: TBitRange); // todo document

function TestBit(const Value: Byte; const Bit: TBitRange): Boolean; overload;
function TestBit(const Value: Shortint; const Bit: TBitRange): Boolean; overload;
function TestBit(const Value: Smallint; const Bit: TBitRange): Boolean; overload;
function TestBit(const Value: Word; const Bit: TBitRange): Boolean; overload;
function TestBit(const Value: Cardinal; const Bit: TBitRange): Boolean; overload;
function TestBit(const Value: Integer; const Bit: TBitRange): Boolean; overload;
function TestBit(const Value: Int64; const Bit: TBitRange): Boolean; overload;
function TestBitBuffer(const Value; const Bit: TBitRange): Boolean; // todo document

function TestBits(const Value, Mask: Byte): Boolean; overload;
function TestBits(const Value, Mask: Shortint): Boolean; overload;
function TestBits(const Value, Mask: Smallint): Boolean; overload;
function TestBits(const Value, Mask: Word): Boolean; overload;
function TestBits(const Value, Mask: Cardinal): Boolean; overload;
function TestBits(const Value, Mask: Integer): Boolean; overload;
function TestBits(const Value, Mask: Int64): Boolean; overload;

function ToggleBit(const Value: Byte; const Bit: TBitRange): Byte; overload;
function ToggleBit(const Value: Shortint; const Bit: TBitRange): Shortint; overload;
function ToggleBit(const Value: Smallint; const Bit: TBitRange): Smallint; overload;
function ToggleBit(const Value: Word; const Bit: TBitRange): Word; overload;
function ToggleBit(const Value: Cardinal; const Bit: TBitRange): Cardinal; overload;
function ToggleBit(const Value: Integer; const Bit: TBitRange): Integer; overload;
function ToggleBit(const Value: Int64; const Bit: TBitRange): Int64; overload;
procedure ToggleBitBuffer(var Value; const Bit: TBitRange); // todo document

procedure BooleansToBits(var Dest: Byte; const B: TBooleanArray); overload;
procedure BooleansToBits(var Dest: Word; const B: TBooleanArray); overload;
procedure BooleansToBits(var Dest: Integer; const B: TBooleanArray); overload;
procedure BooleansToBits(var Dest: Int64; const B: TBooleanArray); overload;

procedure BitsToBooleans(const Bits: Byte; var B: TBooleanArray; AllBits: Boolean = False); overload;
procedure BitsToBooleans(const Bits: Word; var B: TBooleanArray; AllBits: Boolean = False); overload;
procedure BitsToBooleans(const Bits: Integer; var B: TBooleanArray; AllBits: Boolean = False); overload;
procedure BitsToBooleans(const Bits: Int64; var B: TBooleanArray; AllBits: Boolean = False); overload;

function BitsNeeded(const X: Byte): Integer; overload;
function BitsNeeded(const X: Word): Integer; overload;
function BitsNeeded(const X: Integer): Integer; overload;
function BitsNeeded(const X: Int64): Integer; overload;

function Digits(const X: Cardinal): Integer;

function ReverseBytes(Value: Word): Word; overload;
function ReverseBytes(Value: Smallint): Smallint; overload;
function ReverseBytes(Value: Integer): Integer; overload;
function ReverseBytes(Value: Cardinal): Cardinal; overload;
function ReverseBytes(Value: Int64): Int64; overload;
function ReverseBytes(P: Pointer; Count: Integer): Pointer; overload;

//--------------------------------------------------------------------------------------------------
// Arithmetic
//--------------------------------------------------------------------------------------------------

procedure SwapOrd(var I, J: Byte); overload;
procedure SwapOrd(var I, J: Shortint); overload;
procedure SwapOrd(var I, J: Smallint); overload;
procedure SwapOrd(var I, J: Word); overload;
procedure SwapOrd(var I, J: Integer); overload;
procedure SwapOrd(var I, J: Cardinal); overload;
procedure SwapOrd(var I, J: Int64); overload;

function IncLimit(var B: Byte; const Limit: Byte; const Incr: Byte = 1): Byte; overload;
function IncLimit(var B: Shortint; const Limit: Shortint; const Incr: Shortint = 1): Shortint; overload;
function IncLimit(var B: Smallint; const Limit: Smallint; const Incr: Smallint = 1): Smallint; overload;
function IncLimit(var B: Word; const Limit: Word; const Incr: Word = 1): Word; overload;
function IncLimit(var B: Integer; const Limit: Integer; const Incr: Integer = 1): Integer; overload;
function IncLimit(var B: Cardinal; const Limit: Cardinal; const Incr: Cardinal = 1): Cardinal; overload;
function IncLimit(var B: Int64; const Limit: Int64; const Incr: Int64 = 1): Int64; overload;

function DecLimit(var B: Byte; const Limit: Byte; const Decr: Byte = 1): Byte; overload;
function DecLimit(var B: Shortint; const Limit: Shortint; const Decr: Shortint = 1): Shortint; overload;
function DecLimit(var B: Smallint; const Limit: Smallint; const Decr: Smallint = 1): Smallint; overload;
function DecLimit(var B: Word; const Limit: Word; const Decr: Word = 1): Word; overload;
function DecLimit(var B: Integer; const Limit: Integer; const Decr: Integer = 1): Integer; overload;
function DecLimit(var B: Cardinal; const Limit: Cardinal; const Decr: Cardinal = 1): Cardinal; overload;
function DecLimit(var B: Int64; const Limit: Int64; const Decr: Int64 = 1): Int64; overload;

function IncLimitClamp(var B: Byte; const Limit: Byte; const Incr: Byte = 1): Byte; overload;
function IncLimitClamp(var B: Shortint; const Limit: Shortint; const Incr: Shortint = 1): Shortint; overload;
function IncLimitClamp(var B: Smallint; const Limit: Smallint; const Incr: Smallint = 1): Smallint; overload;
function IncLimitClamp(var B: Word; const Limit: Word; const Incr: Word = 1): Word; overload;
function IncLimitClamp(var B: Integer; const Limit: Integer; const Incr: Integer = 1): Integer; overload;
function IncLimitClamp(var B: Cardinal; const Limit: Cardinal; const Incr: Cardinal = 1): Cardinal; overload;
function IncLimitClamp(var B: Int64; const Limit: Int64; const Incr: Int64 = 1): Int64; overload;

function DecLimitClamp(var B: Byte; const Limit: Byte; const Decr: Byte = 1): Byte; overload;
function DecLimitClamp(var B: Shortint; const Limit: Shortint; const Decr: Shortint = 1): Shortint; overload;
function DecLimitClamp(var B: Smallint; const Limit: Smallint; const Decr: Smallint = 1): Smallint; overload;
function DecLimitClamp(var B: Word; const Limit: Word; const Decr: Word = 1): Word; overload;
function DecLimitClamp(var B: Integer; const Limit: Integer; const Decr: Integer = 1): Integer; overload;
function DecLimitClamp(var B: Cardinal; const Limit: Cardinal; const Decr: Cardinal = 1): Cardinal; overload;
function DecLimitClamp(var B: Int64; const Limit: Int64; const Decr: Int64 = 1): Int64; overload;

function Max(const B1, B2: Byte): Byte; overload;
function Max(const B1, B2: Shortint): Shortint; overload;
function Max(const B1, B2: Smallint): Smallint; overload;
function Max(const B1, B2: Word): Word; overload;
function Max(const B1, B2: Integer): Integer; overload;
function Max(const B1, B2: Cardinal): Cardinal; overload;
function Max(const B1, B2: Int64): Int64; overload;

function Min(const B1, B2: Byte): Byte; overload;
function Min(const B1, B2: Shortint): Shortint; overload;
function Min(const B1, B2: Smallint): Smallint; overload;
function Min(const B1, B2: Word): Word; overload;
function Min(const B1, B2: Integer): Integer; overload;
function Min(const B1, B2: Cardinal): Cardinal; overload;
function Min(const B1, B2: Int64): Int64; overload;

implementation

uses
  JclBase;

type
  PByte = ^Byte;

const
  // Constants defining the number of bits in each Integer type

  BitsPerNibble   = 4;
  BitsPerByte     = 8;
  BitsPerShortint = SizeOf(Shortint) * BitsPerByte;
  BitsPerSmallint = SizeOf(Smallint) * BitsPerByte;
  BitsPerWord     = SizeOf(Word) * BitsPerByte;
  BitsPerInteger  = SizeOf(Integer) * BitsPerByte;
  BitsPerCardinal = SizeOf(Cardinal) * BitsPerByte;
  BitsPerInt64    = SizeOf(Int64) * BitsPerByte;

  // Constants defining the number of nibbles in each Integer type

  NibblesPerByte     = BitsPerByte div BitsPerNibble;
  NibblesPerShortint = SizeOf(Shortint) * NibblesPerByte;
  NibblesPerSmallint = SizeOf(Smallint) * NibblesPerByte;
  NibblesPerWord     = SizeOf(Word) * NibblesPerByte;
  NibblesPerInteger  = SizeOf(Integer) * NibblesPerByte;
  NibblesPerCardinal = SizeOf(Cardinal) * NibblesPerByte;
  NibblesPerInt64    = SizeOf(Int64) * NibblesPerByte;

  // Constants defining a mask with all bits set for each Integer type

  NibbleMask      = $F;
  ByteMask        = Byte($FF);
  ShortintMask    = Shortint($FF);
  SmallintMask    = Smallint($FFFF);
  WordMask        = Word($FFFF);
  IntegerMask     = Integer($FFFFFFFF);
  CardinalMask    = Cardinal($FFFFFFFF);
  Int64Mask       = Int64($FFFFFFFFFFFFFFFF);

//==================================================================================================
// Conversion
//==================================================================================================

function OrdToBinary(const Value: Byte): string;
var
  I: Integer;
  B: Byte;
  P: PChar;
begin
  SetLength(Result, BitsPerByte);
  P := PChar(Result) + ((BitsPerByte - 1) * SizeOf(Char));
  B := Value;
  for I := 0 to BitsPerByte - 1 do
  begin
    P^ := Chr(48 + (B and $00000001));
    Dec(P);
    B := B shr 1;
  end;
end;

//--------------------------------------------------------------------------------------------------

function OrdToBinary(const Value: Shortint): string;
var
  I: Integer;
  S: Shortint;
  P: PChar;
begin
  SetLength(Result, BitsPerShortint);
  P := PChar(Result) + ((BitsPerShortint - 1) * SizeOf(Char));
  S := Value;
  for I := 0 to BitsPerShortint - 1 do
  begin
    P^ := Chr(48 + (S and $00000001));
    Dec(P);
    S := S shr 1;
  end;
end;

//--------------------------------------------------------------------------------------------------

function OrdToBinary(const Value: Smallint): string;
var
  I: Integer;
  S: Smallint;
  P: PChar;
begin
  SetLength(Result, BitsPerSmallint);
  P := PChar(Result) + ((BitsPerSmallint - 1) * SizeOf(Char));
  S := Value;
  for I := 0 to BitsPerSmallint - 1 do
  begin
    P^ := Chr(48 + (S and $00000001));
    Dec(P);
    S := S shr 1;
  end;
end;

//--------------------------------------------------------------------------------------------------

function OrdToBinary(const Value: Word): string;
var
  I: Integer;
  W: Word;
  P: PChar;
begin
  SetLength(Result, BitsPerWord);
  P := PChar(Result) + ((BitsPerWord - 1) * SizeOf(Char));
  W := Value;
  for I := 0 to BitsPerWord - 1 do
  begin
    P^ := Chr(48 + (W and $00000001));
    Dec(P);
    W := W shr 1;
  end;
end;

//--------------------------------------------------------------------------------------------------

function OrdToBinary(const Value: Integer): string;
var
  I, J: Integer;
  P: PChar;
begin
  SetLength(Result, BitsPerInteger);
  P := PChar(Result) + ((BitsPerInteger - 1) * SizeOf(Char));
  J := Value;
  for I := 0 to BitsPerInteger - 1 do
  begin
    P^ := Chr(48 + (J and $00000001));
    Dec(P);
    J := J shr 1;
  end;
end;

//--------------------------------------------------------------------------------------------------

function OrdToBinary(const Value: Cardinal): string;
var
  I: Integer;
  J: Cardinal;
  P: PChar;
begin
  SetLength(Result, BitsPerCardinal);
  P := PChar(Result) + ((BitsPerCardinal - 1) * SizeOf(Char));
  J := Value;
  for I := 0 to BitsPerCardinal - 1 do
  begin
    P^ := Chr(48 + (J and $00000001));
    Dec(P);
    J := J shr 1;
  end;
end;

//--------------------------------------------------------------------------------------------------

function OrdToBinary(const Value: Int64): string;
var
  I: Integer;
  I64: Int64;
  P: PChar;
begin
  SetLength(Result, BitsPerInt64);
  P := PChar(Result) + ((BitsPerInt64 - 1) * SizeOf(Char));
  I64 := Value;
  for I := 0 to BitsPerInt64 - 1 do
  begin
    P^ := Chr(48 + (I64 and Int64(1)));
    Dec(P);
    I64 := I64 shr Int64(1);
  end;
end;


//==================================================================================================
// Bit manipulation
//==================================================================================================

function BitsHighest(X: Cardinal): Integer; assembler;
asm
        MOV     ECX, EAX
        MOV     EAX, -1
        BSR     EAX, ECX
end;

//--------------------------------------------------------------------------------------------------

function BitsHighest(X: Integer): Integer;
begin
  Result := BitsHighest(Cardinal(X));
end;

//--------------------------------------------------------------------------------------------------

function BitsHighest(X: Byte): Integer;
begin
  Result := BitsHighest(Cardinal(X) and ByteMask);
end;

//--------------------------------------------------------------------------------------------------

function BitsHighest(X: Word): Integer;
begin
  Result := BitsHighest(Cardinal(X) and WordMask);
end;

//--------------------------------------------------------------------------------------------------

function BitsHighest(X: SmallInt): Integer;
begin
  Result := BitsHighest(Word(X));
end;


//--------------------------------------------------------------------------------------------------

function BitsHighest(X: ShortInt): Integer;
begin
  Result := BitsHighest(Cardinal(Byte(X)));
end;

//--------------------------------------------------------------------------------------------------

function BitsHighest(X: Int64): Integer;
begin
  if TULargeInteger(X).HighPart = 0 then
  begin
    if TULargeInteger(X).LowPart = 0 then
      Result := -1
    else
      Result := BitsHighest(TULargeInteger(X).LowPart);
  end
  else
    Result := BitsHighest(TULargeInteger(X).HighPart) + 32;
end;

//--------------------------------------------------------------------------------------------------

function BitsLowest(X: Cardinal): Integer; assembler;
asm
        MOV     ECX, EAX
        MOV     EAX, -1
        BSF     EAX, ECX
end;

//--------------------------------------------------------------------------------------------------

function BitsLowest(X: Byte): Integer;
begin
  Result := BitsLowest(Cardinal(X) and ByteMask);
end;

//--------------------------------------------------------------------------------------------------

function BitsLowest(X: Shortint): Integer;
begin
  Result := BitsLowest(Cardinal(X) and ShortintMask);
end;

//--------------------------------------------------------------------------------------------------

function BitsLowest(X: Smallint): Integer;
begin
  Result := BitsLowest(Cardinal(X) and SmallintMask);
end;

//--------------------------------------------------------------------------------------------------

function BitsLowest(X: Word): Integer;
begin
  Result := BitsLowest(Cardinal(X) and WordMask);
end;

//--------------------------------------------------------------------------------------------------

function BitsLowest(X: Integer): Integer;
begin
  Result := BitsLowest(Cardinal(X));
end;

//--------------------------------------------------------------------------------------------------

function BitsLowest(X: Int64): Integer;
begin
  if TULargeInteger(X).LowPart = 0 then
  begin
    if TULargeInteger(X).HighPart = 0 then
      Result := -1
    else
      Result := BitsLowest(TULargeInteger(X).HighPart) + 32;
  end
  else
    Result := BitsLowest(TULargeInteger(X).LowPart);
end;

//--------------------------------------------------------------------------------------------------

function ClearBit(const Value: Byte; const Bit: TBitRange): Byte;
begin
  Result := Value and not (1 shl (Bit mod BitsPerByte));
end;

//--------------------------------------------------------------------------------------------------

function ClearBit(const Value: Shortint; const Bit: TBitRange): Shortint;
begin
  Result := Value and not (1 shl (Bit mod BitsPerShortint));
end;

//--------------------------------------------------------------------------------------------------

function ClearBit(const Value: Smallint; const Bit: TBitRange): Smallint;
begin
  Result := Value and not (1 shl (Bit mod BitsPerSmallint));
end;

//--------------------------------------------------------------------------------------------------

function ClearBit(const Value: Word; const Bit: TBitRange): Word;
begin
  Result := Value and not (1 shl (Bit mod BitsPerWord));
end;

//--------------------------------------------------------------------------------------------------

function ClearBit(const Value: Cardinal; const Bit: TBitRange): Cardinal;
begin
  Result := Value and not (1 shl (Bit mod BitsPerCardinal));
end;

//--------------------------------------------------------------------------------------------------

function ClearBit(const Value: Integer; const Bit: TBitRange): Integer;
begin
  Result := Value and not (1 shl (Bit mod BitsPerInteger));
end;

//--------------------------------------------------------------------------------------------------

function ClearBit(const Value: Int64; const Bit: TBitRange): Int64;
begin
  Result := Value and not (Int64(1) shl (Bit mod BitsPerInt64));
end;

//--------------------------------------------------------------------------------------------------

procedure ClearBitBuffer(var Value; const Bit: TBitRange);
var
  P: PByte;
  BitOfs: TBitRange;
begin
  P := Addr(Value);
  Inc(P, Bit div 8);
  BitOfs := Bit mod 8;
  P^ := ClearBit(P^, BitOfs);
end;

//--------------------------------------------------------------------------------------------------

function CountBitsSet(X: Cardinal): Integer;
var
  Index: Integer;
begin
  Result := 0;
  for Index := 1 to BitsPerCardinal do
  begin
    if (X and 1) = 1 then
      Inc(Result);
    X := X shr 1;
  end;
end;

//--------------------------------------------------------------------------------------------------

function CountBitsSet(X: Byte): Integer;
var
  Index: Integer;
begin
  Result := 0;
  for Index := 1 to BitsPerByte do
  begin
    if (X and 1) = 1 then
      Inc(Result);
    X := X shr 1;
  end;
end;

//--------------------------------------------------------------------------------------------------

function CountBitsSet(X: Word): Integer;
var
  Index: Integer;
begin
  Result := 0;
  for Index := 1 to BitsPerWord do
  begin
    if (X and 1) = 1 then
      Inc(Result);
    X := X shr 1;
  end;
end;

//--------------------------------------------------------------------------------------------------

function CountBitsSet(X: Smallint): Integer;
begin
  Result := CountBitsSet(Word(X));
end;

//--------------------------------------------------------------------------------------------------

function CountBitsSet(X: ShortInt): Integer;
begin
  Result := CountBitsSet(Byte(X));
end;

//--------------------------------------------------------------------------------------------------

function CountBitsSet(X: Integer): Integer;
begin
  Result := CountBitsSet(Cardinal(X));
end;

//--------------------------------------------------------------------------------------------------

function CountBitsSet(X: Int64): Integer;
begin
  Result := CountBitsSet(TULargeInteger(X).LowPart) + CountBitsSet(TULargeInteger(X).HighPart);
end;

//--------------------------------------------------------------------------------------------------

function CountBitsCleared(X: Byte): Integer;
begin
  Result := BitsPerByte - CountBitsSet(Byte(X));
end;

//--------------------------------------------------------------------------------------------------

function CountBitsCleared(X: Shortint): Integer;
begin
  Result := BitsPerShortint - CountBitsSet(Byte(X));
end;

//--------------------------------------------------------------------------------------------------

function CountBitsCleared(X: Smallint): Integer;
begin
  Result := BitsPerSmallint - CountBitsSet(Word(X));
end;

//--------------------------------------------------------------------------------------------------

function CountBitsCleared(X: Word): Integer;
begin
  Result := BitsPerWord - CountBitsSet(Word(X));
end;

//--------------------------------------------------------------------------------------------------

function CountBitsCleared(X: Integer): Integer;
begin
  Result := BitsPerInteger - CountBitsSet(Integer(X));
end;

//--------------------------------------------------------------------------------------------------

function CountBitsCleared(X: Cardinal): Integer;
begin
  Result := BitsPerCardinal - CountBitsSet(Cardinal(X));
end;

//--------------------------------------------------------------------------------------------------

function CountBitsCleared(X: Int64): Integer;
begin
  Result := BitsPerInt64 - CountBitsSet(Int64(X));
end;

//--------------------------------------------------------------------------------------------------

function LRot(const Value: Byte; const Count: TBitRange): Byte; assembler;
asm
  MOV CL, Count
  ROL AL, CL
end;

//--------------------------------------------------------------------------------------------------

function LRot(const Value: Word; const Count: TBitRange): Word; assembler;
asm
   MOV     CL, Count
   ROL     AX, CL
end;

//--------------------------------------------------------------------------------------------------

function LRot(const Value: Integer; const Count: TBitRange): Integer; assembler;
asm
  MOV     CL, Count
  ROL     EAX, CL
end;

//--------------------------------------------------------------------------------------------------

const
  // Lookup table of bit reversed nibbles, used by simple overloads of ReverseBits
  RevNibbles: array [0..NibbleMask] of Byte =
    ($0, $8, $4, $C, $2, $A, $6, $E, $1, $9, $5, $D, $3, $B, $7, $F);

function ReverseBits(Value: Byte): Byte;
begin
  Result := RevNibbles[Value shr BitsPerNibble] or
    (RevNibbles[Value and NibbleMask] shl BitsPerNibble);
end;

//--------------------------------------------------------------------------------------------------

function ReverseBits(Value: Shortint): Shortint;
begin
  Result := RevNibbles[Byte(Value) shr BitsPerNibble] or
    (RevNibbles[Value and NibbleMask] shl BitsPerNibble);
end;

//--------------------------------------------------------------------------------------------------

function ReverseBits(Value: Smallint): Smallint;
begin
  Result := ReverseBits(Word(Value));
end;

//--------------------------------------------------------------------------------------------------

function ReverseBits(Value: Word): Word;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to NibblesPerWord - 1 do
  begin
    Result := (Result shl BitsPerNibble) or RevNibbles[Value and NibbleMask];
    Value := Value shr BitsPerNibble;
  end;
end;

//--------------------------------------------------------------------------------------------------

function ReverseBits(Value: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to NibblesPerInteger - 1 do
  begin
    Result := (Result shl BitsPerNibble) or RevNibbles[Value and NibbleMask];
    Value := Value shr BitsPerNibble;
  end;
end;

//--------------------------------------------------------------------------------------------------

function ReverseBits(Value: Cardinal): Cardinal;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to NibblesPerCardinal - 1 do
  begin
    Result := (Result shl BitsPerNibble) or RevNibbles[Value and NibbleMask];
    Value := Value shr BitsPerNibble;
  end;
end;

//--------------------------------------------------------------------------------------------------

function ReverseBits(Value: Int64): Int64;
begin
  TULargeInteger(Result).LowPart := ReverseBits(TULargeInteger(Value).HighPart);
  TULargeInteger(Result).HighPart := ReverseBits(TULargeInteger(Value).LowPart);
end;

//--------------------------------------------------------------------------------------------------

const
  // Lookup table of reversed bytes, used by pointer overload of ReverseBits
  ReverseTable: array [0..ByteMask] of Byte = (
    $00, $80, $40, $C0, $20, $A0, $60, $E0,
    $10, $90, $50, $D0, $30, $B0, $70, $F0,
    $08, $88, $48, $C8, $28, $A8, $68, $E8,
    $18, $98, $58, $D8, $38, $B8, $78, $F8,
    $04, $84, $44, $C4, $24, $A4, $64, $E4,
    $14, $94, $54, $D4, $34, $B4, $74, $F4,
    $0C, $8C, $4C, $CC, $2C, $AC, $6C, $EC,
    $1C, $9C, $5C, $DC, $3C, $BC, $7C, $FC,
    $02, $82, $42, $C2, $22, $A2, $62, $E2,
    $12, $92, $52, $D2, $32, $B2, $72, $F2,
    $0A, $8A, $4A, $CA, $2A, $AA, $6A, $EA,
    $1A, $9A, $5A, $DA, $3A, $BA, $7A, $FA,
    $06, $86, $46, $C6, $26, $A6, $66, $E6,
    $16, $96, $56, $D6, $36, $B6, $76, $F6,
    $0E, $8E, $4E, $CE, $2E, $AE, $6E, $EE,
    $1E, $9E, $5E, $DE, $3E, $BE, $7E, $FE,
    $01, $81, $41, $C1, $21, $A1, $61, $E1,
    $11, $91, $51, $D1, $31, $B1, $71, $F1,
    $09, $89, $49, $C9, $29, $A9, $69, $E9,
    $19, $99, $59, $D9, $39, $B9, $79, $F9,
    $05, $85, $45, $C5, $25, $A5, $65, $E5,
    $15, $95, $55, $D5, $35, $B5, $75, $F5,
    $0D, $8D, $4D, $CD, $2D, $AD, $6D, $ED,
    $1D, $9D, $5D, $DD, $3D, $BD, $7D, $FD,
    $03, $83, $43, $C3, $23, $A3, $63, $E3,
    $13, $93, $53, $D3, $33, $B3, $73, $F3,
    $0B, $8B, $4B, $CB, $2B, $AB, $6B, $EB,
    $1B, $9B, $5B, $DB, $3B, $BB, $7B, $FB,
    $07, $87, $47, $C7, $27, $A7, $67, $E7,
    $17, $97, $57, $D7, $37, $B7, $77, $F7,
    $0F, $8F, $4F, $CF, $2F, $AF, $6F, $EF,
    $1F, $9F, $5F, $DF, $3F, $BF, $7F, $FF);

function ReverseBits(P: Pointer; Count: Integer): Pointer;
var
  P1, P2: PByte;
  T: Byte;
begin
  if (P <> nil) and (Count > 0) then
  begin
    P1 := P;
    P2 := PByte(Integer(P) + Count - 1);
    while Integer(P1) < Integer(P2) do
    begin
      T := ReverseTable[P1^];
      P1^ := ReverseTable[P2^];
      P2^ := T;
      Inc(P1);
      Dec(P2);
    end;
    if P1 = P2 then
      P1^ := ReverseTable[P1^];
  end;
  Result := P;
end;

//--------------------------------------------------------------------------------------------------

function RRot(const Value: Byte; const Count: TBitRange): Byte; assembler;
asm
        MOV     CL, Count
        MOV     AL, Value
        ROR     AL, CL
        MOV     Result, AL
end;

//--------------------------------------------------------------------------------------------------

function RRot(const Value: Word; const Count: TBitRange): Word; assembler;
asm
        MOV     CL, Count
        MOV     AX, Value
        ROR     AX, CL
        MOV     Result, AX
end;

//--------------------------------------------------------------------------------------------------

function RRot(const Value: Integer; const Count: TBitRange): Integer; assembler;
asm
        MOV     CL, Count
        MOV     EAX, Value
        ROR     EAX, CL
        MOV     Result, EAX
end;

//--------------------------------------------------------------------------------------------------

function Sar(const Value: Shortint; const Count: TBitRange): Shortint; assembler;
asm
        MOV     CL, DL
        SAR     AL, CL
end;

//--------------------------------------------------------------------------------------------------

function Sar(const Value: Smallint; const Count: TBitRange): Smallint; assembler;
asm
        MOV     CL, DL
        SAR     AX, CL
end;

//--------------------------------------------------------------------------------------------------

function Sar(const Value: Integer; const Count: TBitRange): Integer; assembler;
asm
        MOV     CL, DL
        SAR     EAX, CL
end;

//--------------------------------------------------------------------------------------------------

function SetBit(const Value: Byte; const Bit: TBitRange): Byte;
begin
  Result := Value or (1 shl (Bit mod BitsPerByte));
end;

//--------------------------------------------------------------------------------------------------

function SetBit(const Value: Shortint; const Bit: TBitRange): Shortint;
begin
  Result := Value or (1 shl (Bit mod BitsPerShortint));
end;

//--------------------------------------------------------------------------------------------------

function SetBit(const Value: Smallint; const Bit: TBitRange): Smallint;
begin
  Result := Value or (1 shl (Bit mod BitsPerSmallint));
end;

//--------------------------------------------------------------------------------------------------

function SetBit(const Value: Word; const Bit: TBitRange): Word;
begin
  Result := Value or (1 shl (Bit mod BitsPerWord));
end;

//--------------------------------------------------------------------------------------------------

function SetBit(const Value: Cardinal; const Bit: TBitRange): Cardinal;
begin
  Result := Value or (1 shl (Bit mod BitsPerCardinal));
end;

//--------------------------------------------------------------------------------------------------

function SetBit(const Value: Integer; const Bit: TBitRange): Integer;
begin
  Result := Value or (1 shl (Bit mod BitsPerInteger));
end;

//--------------------------------------------------------------------------------------------------

function SetBit(const Value: Int64; const Bit: TBitRange): Int64;
begin
  Result := Value or (Int64(1) shl (Bit mod BitsPerInt64));
end;

//--------------------------------------------------------------------------------------------------

procedure SetBitBuffer(var Value; const Bit: TBitRange);
var
  P: PByte;
  BitOfs: TBitRange;
begin
  P := Addr(Value);
  Inc(P, Bit div 8);
  BitOfs := Bit mod 8;
  P^ := SetBit(P^, BitOfs);
end;

//--------------------------------------------------------------------------------------------------

function TestBit(const Value: Byte; const Bit: TBitRange): Boolean;
begin
  Result := (Value and (1 shl (Bit mod BitsPerByte))) <> 0;
end;

//--------------------------------------------------------------------------------------------------

function TestBit(const Value: Shortint; const Bit: TBitRange): Boolean;
begin
  Result := (Value and (1 shl (Bit mod BitsPerShortint))) <> 0;
end;

//--------------------------------------------------------------------------------------------------

function TestBit(const Value: Smallint; const Bit: TBitRange): Boolean;
begin
  Result := (Value and (1 shl (Bit mod BitsPerSmallint))) <> 0;
end;

//--------------------------------------------------------------------------------------------------

function TestBit(const Value: Word; const Bit: TBitRange): Boolean;
begin
  Result := (Value and (1 shl (Bit mod BitsPerWord))) <> 0;
end;

//--------------------------------------------------------------------------------------------------

function TestBit(const Value: Cardinal; const Bit: TBitRange): Boolean;
begin
  Result := (Value and (1 shl (Bit mod BitsPerCardinal))) <> 0;
end;

//--------------------------------------------------------------------------------------------------

function TestBit(const Value: Integer; const Bit: TBitRange): Boolean;
begin
  Result := (Value and (1 shl (Bit mod BitsPerInteger))) <> 0;
end;

//--------------------------------------------------------------------------------------------------

function TestBit(const Value: Int64; const Bit: TBitRange): Boolean;
begin
  Result := (Value and (Int64(1) shl (Bit mod BitsPerInt64))) <> 0;
end;

//--------------------------------------------------------------------------------------------------

function TestBitBuffer(const Value; const Bit: TBitRange): Boolean;
var
  P: PByte;
  BitOfs: TBitRange;
begin
  P := Addr(Value);
  Inc(P, Bit div 8);
  BitOfs := Bit mod 8;
  Result := TestBit(P^, BitOfs);
end;

//--------------------------------------------------------------------------------------------------

function TestBits(const Value, Mask: Byte): Boolean;
begin
  Result := (Value and Mask) = Mask;
end;

//--------------------------------------------------------------------------------------------------

function TestBits(const Value, Mask: Shortint): Boolean;
begin
  Result := (Value and Mask) = Mask;
end;

//--------------------------------------------------------------------------------------------------

function TestBits(const Value, Mask: Smallint): Boolean;
begin
  Result := (Value and Mask) = Mask;
end;

//--------------------------------------------------------------------------------------------------

function TestBits(const Value, Mask: Word): Boolean;
begin
  Result := (Value and Mask) = Mask;
end;

//--------------------------------------------------------------------------------------------------

function TestBits(const Value, Mask: Cardinal): Boolean;
begin
  Result := (Value and Mask) = Mask;
end;

//--------------------------------------------------------------------------------------------------

function TestBits(const Value, Mask: Integer): Boolean;
begin
  Result := (Value and Mask) = Mask;
end;

//--------------------------------------------------------------------------------------------------

function TestBits(const Value, Mask: Int64): Boolean;
begin
  Result := (Value and Mask) = Mask;
end;

//--------------------------------------------------------------------------------------------------

function ToggleBit(const Value: Byte; const Bit: TBitRange): Byte;
begin
  Result := Value xor (1 shl (Bit mod BitsPerByte));
end;

//--------------------------------------------------------------------------------------------------

function ToggleBit(const Value: Shortint; const Bit: TBitRange): Shortint;
begin
  Result := Value xor (1 shl (Bit mod BitsPerShortint));
end;

//--------------------------------------------------------------------------------------------------

function ToggleBit(const Value: Smallint; const Bit: TBitRange): Smallint;
begin
  Result := Value xor (1 shl (Bit mod BitsPerSmallint));
end;

//--------------------------------------------------------------------------------------------------

function ToggleBit(const Value: Word; const Bit: TBitRange): Word;
begin
  Result := Value xor (1 shl (Bit mod BitsPerWord));
end;

//--------------------------------------------------------------------------------------------------

function ToggleBit(const Value: Cardinal; const Bit: TBitRange): Cardinal;
begin
  Result := Value xor (1 shl (Bit mod BitsPerCardinal));
end;

//--------------------------------------------------------------------------------------------------

function ToggleBit(const Value: Integer; const Bit: TBitRange): Integer;
begin
  Result := Value xor (1 shl (Bit mod BitsPerInteger));
end;

//--------------------------------------------------------------------------------------------------

function ToggleBit(const Value: Int64; const Bit: TBitRange): Int64;
begin
  Result := Value xor (Int64(1) shl (Bit mod BitsPerInt64));
end;

//--------------------------------------------------------------------------------------------------

procedure ToggleBitBuffer(var Value; const Bit: TBitRange);
var
  P: PByte;
  BitOfs: TBitRange;
begin
  P := Addr(Value);
  Inc(P, Bit div 8);
  BitOfs := Bit mod 8;
  P^ := ToggleBit(P^, BitOfs);
end;

//--------------------------------------------------------------------------------------------------

procedure BooleansToBits(var Dest: Byte; const B: TBooleanArray);
var
  I, H: Integer;
begin
  Dest := 0;
  H := Min(Byte(BitsPerByte - 1), High(B));
  for I := 0 to H do
    if B[I] then
      Dest := SetBit(Dest, TBitRange(I));
end;

//--------------------------------------------------------------------------------------------------

procedure BooleansToBits(var Dest: Word; const B: TBooleanArray);
var
  I, H: Integer;
begin
  Dest := 0;
  H := Min(Word(BitsPerWord - 1), High(B));
  for I := 0 to H do
    if B[I] then
      Dest := SetBit(Dest, TBitRange(I));
end;

//--------------------------------------------------------------------------------------------------

procedure BooleansToBits(var Dest: Integer; const B: TBooleanArray);
var
  I, H: Integer;
begin
  Dest := 0;
  H := Min(Integer(BitsPerInteger - 1), High(B));
  for I := 0 to H do
    if B[I] then
      Dest := SetBit(Dest, TBitRange(I));
end;

//--------------------------------------------------------------------------------------------------

procedure BooleansToBits(var Dest: Int64; const B: TBooleanArray);
var
  I, H: Integer;
begin
  Dest := 0;
  H := Min(Int64(BitsPerInt64 - 1), High(B));
  for I := 0 to H do
    if B[I] then
      Dest := SetBit(Dest, TBitRange(I));
end;

//--------------------------------------------------------------------------------------------------

procedure BitsToBooleans(const Bits: Byte; var B: TBooleanArray; AllBits: Boolean);
var
  I: Integer;
begin
  if AllBits then
    SetLength(B, BitsPerByte)
  else
    SetLength(B, BitsNeeded(Bits));
  for I := 0 to High(B) do
    B[I] := TestBit(Bits, TBitRange(I));
end;

//--------------------------------------------------------------------------------------------------

procedure BitsToBooleans(const Bits: Word; var B: TBooleanArray; AllBits: Boolean);
var
  I: Integer;
begin
  if AllBits then
    SetLength(B, BitsPerWord)
  else
    SetLength(B, BitsNeeded(Bits));
  for I := 0 to High(B) do
    B[I] := TestBit(Bits, TBitRange(I));
end;

//--------------------------------------------------------------------------------------------------

procedure BitsToBooleans(const Bits: Integer; var B: TBooleanArray; AllBits: Boolean);
var
  I: Integer;
begin
  if AllBits then
    SetLength(B, BitsPerInteger)
  else
    SetLength(B, BitsNeeded(Bits));
  for I := 0 to High(B) do
    B[I] := TestBit(Bits, TBitRange(I));
end;

//--------------------------------------------------------------------------------------------------

procedure BitsToBooleans(const Bits: Int64; var B: TBooleanArray; AllBits: Boolean);
var
  I: Integer;
begin
  if AllBits then
    SetLength(B, BitsPerInt64)
  else
    SetLength(B, BitsNeeded(Bits));
  for I := 0 to High(B) do
    B[I] := TestBit(Bits, TBitRange(I));
end;

//--------------------------------------------------------------------------------------------------

function Digits(const X: Cardinal): Integer;
var
  Val: Cardinal;
begin
  Result := 0;
  Val := X;
  repeat
    Inc(Result);
    Val := Val div 10;
  until Val = 0;
end;

//--------------------------------------------------------------------------------------------------

function BitsNeeded(const X: Byte): Integer;
begin
  Result := BitsHighest(X) + 1;
  if Result = 0 then
    Result := 1;
end;

//--------------------------------------------------------------------------------------------------

function BitsNeeded(const X: Word): Integer;
begin
  Result := BitsHighest(X) + 1;
  if Result = 0 then
    Result := 1;
end;

//--------------------------------------------------------------------------------------------------

function BitsNeeded(const X: Integer): Integer;
begin
  Result := BitsHighest(X) + 1;
  if Result = 0 then
    Result := 1;
end;

//--------------------------------------------------------------------------------------------------

function BitsNeeded(const X: Int64): Integer;
begin
  Result := BitsHighest(X) + 1;
  if Result = 0 then
    Result := 1;
end;

//--------------------------------------------------------------------------------------------------

function ReverseBytes(Value: Word): Word;
begin
  Result := ((Value and Word($FF00)) shr BitsPerByte) or ((Value and Word($00FF)) shl BitsPerByte);
end;

//--------------------------------------------------------------------------------------------------

function ReverseBytes(Value: Smallint): Smallint;
begin
  Result := ((Value and Smallint($FF00)) shr BitsPerByte) or ((Value and Smallint($00FF)) shl BitsPerByte);
end;

//--------------------------------------------------------------------------------------------------

function ReverseBytes(Value: Integer): Integer;
var
  I: Integer;
begin
  Result := Value and ByteMask;
  Value := Value shr BitsPerByte;
  for I := 0 to SizeOf(Integer) - 2  do
  begin
    Result := (Result shl BitsPerByte) or (Value and ByteMask);
    Value := Value shr BitsPerByte;
  end;
end;

//--------------------------------------------------------------------------------------------------

function ReverseBytes(Value: Cardinal): Cardinal;
var
  I: Integer;
begin
  Result := Value and ByteMask;
  Value := Value shr BitsPerByte;
  for I := 0 to SizeOf(Cardinal) - 2 do
  begin
    Result := (Result shl BitsPerByte) or (Value and ByteMask);
    Value := Value shr BitsPerByte;
  end;
end;

//--------------------------------------------------------------------------------------------------

function ReverseBytes(Value: Int64): Int64;
var
  I: Integer;
begin
  Result := Value and ByteMask;
  Value := Value shr BitsPerByte;
  for I := 0 to SizeOf(Int64) - 2 do
  begin
    Result := (Result shl BitsPerByte) or (Value and ByteMask);
    Value := Value shr BitsPerByte;
  end;
end;

//--------------------------------------------------------------------------------------------------

function ReverseBytes(P: Pointer; Count: Integer): Pointer;
var
  P1, P2: PByte;
  T: Byte;
begin
  if (P <> nil) and (Count > 0) then
  begin
    P1 := P;
    P2 := PByte(Integer(P) + Count - 1);
    while Integer(P1) < Integer(P2) do
    begin
      T := P1^;
      P1^ := P2^;
      P2^ := T;
      Inc(P1);
      Dec(P2);
    end;
  end;
  Result := P;
end;

//==================================================================================================
// Arithmetic
//==================================================================================================

procedure SwapOrd(var I, J: Byte);
var
  T: Byte;
begin
  T := I;
  I := J;
  J := T;
end;

//--------------------------------------------------------------------------------------------------

procedure SwapOrd(var I, J: Cardinal);
var
  T: Cardinal;
begin
  T := I;
  I := J;
  J := T;
end;

//--------------------------------------------------------------------------------------------------

procedure SwapOrd(var I, J: Integer);
var
  T: Integer;
begin
  T := I;
  I := J;
  J := T;
end;

//--------------------------------------------------------------------------------------------------

procedure SwapOrd(var I, J: Int64);
var
  T: Int64;
begin
  T := I;
  I := J;
  J := T;
end;

//--------------------------------------------------------------------------------------------------

procedure SwapOrd(var I, J: Shortint);
var
  T: Shortint;
begin
  T := I;
  I := J;
  J := T;
end;

//--------------------------------------------------------------------------------------------------

procedure SwapOrd(var I, J: Smallint);
var
  T: Smallint;
begin
  T := I;
  I := J;
  J := T;
end;

//--------------------------------------------------------------------------------------------------

procedure SwapOrd(var I, J: Word);
var
  T: Word;
begin
  T := I;
  I := J;
  J := T;
end;

//--------------------------------------------------------------------------------------------------

function IncLimit(var B: Byte; const Limit, Incr: Byte): Byte;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimit(var B: Shortint; const Limit, Incr: Shortint): Shortint;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimit(var B: Smallint; const Limit, Incr: Smallint): Smallint;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimit(var B: Word; const Limit, Incr: Word): Word;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimit(var B: Integer; const Limit, Incr: Integer): Integer;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimit(var B: Cardinal; const Limit, Incr: Cardinal): Cardinal;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimit(var B: Int64; const Limit, Incr: Int64): Int64;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimit(var B: Byte; const Limit, Decr: Byte): Byte;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimit(var B: Shortint; const Limit, Decr: Shortint): shortint;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimit(var B: Smallint; const Limit, Decr: Smallint): Smallint;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimit(var B: Word; const Limit, Decr: Word): Word;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimit(var B: Integer; const Limit, Decr: Integer): Integer;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimit(var B: Cardinal; const Limit, Decr: Cardinal): Cardinal;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimit(var B: Int64; const Limit, Decr: Int64): Int64;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr);
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimitClamp(var B: Byte; const Limit, Incr: Byte): Byte;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimitClamp(var B: Shortint; const Limit, Incr: Shortint): Shortint;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimitClamp(var B: Smallint; const Limit, Incr: Smallint): Smallint;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimitClamp(var B: Word; const Limit, Incr: Word): Word;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimitClamp(var B: Integer; const Limit, Incr: Integer): Integer;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimitClamp(var B: Cardinal; const Limit, Incr: Cardinal): Cardinal;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function IncLimitClamp(var B: Int64; const Limit, Incr: Int64): Int64;
begin
  if (B + Incr) <= Limit then
    Inc(B, Incr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimitClamp(var B: Byte; const Limit, Decr: Byte): Byte;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimitClamp(var B: Shortint; const Limit, Decr: Shortint): Shortint;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimitClamp(var B: Smallint; const Limit, Decr: Smallint): Smallint;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimitClamp(var B: Word; const Limit, Decr: Word): Word;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimitClamp(var B: Integer; const Limit, Decr: Integer): Integer;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimitClamp(var B: Cardinal; const Limit, Decr: Cardinal): Cardinal;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function DecLimitClamp(var B: Int64; const Limit, Decr: Int64): Int64;
begin
  if (B - Decr) >= Limit then
    Dec(B, Decr)
  else
    B := Limit;
  Result := B;
end;

//--------------------------------------------------------------------------------------------------

function Max(const B1, B2: Byte): Byte;
begin
  if B1 > B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Min(const B1, B2: Byte): Byte;
begin
  if B1 < B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Max(const B1, B2: Shortint): Shortint;
begin
  if B1 > B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Max(const B1, B2: Smallint): Smallint;
begin
  if B1 > B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Min(const B1, B2: Shortint): Shortint;
begin
  if B1 < B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Min(const B1, B2: Smallint): Smallint;
begin
  if B1 < B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Max(const B1, B2: Word): Word;
begin
  if B1 > B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Max(const B1, B2: Int64): Int64;
begin
  if B1 > B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Min(const B1, B2: Word): Word;
begin
  if B1 < B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Max(const B1, B2: Integer): Integer;
begin
  if B1 > B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Min(const B1, B2: Integer): Integer;
begin
  if B1 < B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Max(const B1, B2: Cardinal): Cardinal;
begin
  if B1 > B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Min(const B1, B2: Cardinal): Cardinal;
begin
  if B1 < B2 then
    Result := B1
  else
    Result := B2;
end;

//--------------------------------------------------------------------------------------------------

function Min(const B1, B2: Int64): Int64;
begin
  if B1 < B2 then
    Result := B1
  else
    Result := B2;
end;

end.
