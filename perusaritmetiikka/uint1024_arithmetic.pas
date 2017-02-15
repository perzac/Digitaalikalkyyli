unit UInt1024_arithmetic;

{$mode objfpc}{$H+}

interface

uses
  OWord_arithmetic, Arithmetic_assist, Character, UInt256_arithmetic, UInt512_arithmetic;

Type
  UInt1024 = Array [0..15] of QWord;

operator := (n : UInt512) m : Uint1024; overload;
operator := (n : UInt256) m : Uint1024; overload;
operator := (n : OWord) m : Uint1024; overload;
operator := (n : QWord) m : Uint1024; overload;
operator := (n : Int64) m : Uint1024; overload;
operator := (n : DWord) m : Uint1024; overload;
operator := (n : LongInt) m : Uint1024; overload;
operator := (n : Word) m : Uint1024; overload;
operator := (n : SmallInt) m : Uint1024; overload;
operator := (n : Byte) m : Uint1024; overload;
operator := (n : ShortInt) m : Uint1024; overload;

operator := (n : UInt1024) m : UInt512; overload;
operator := (n : UInt1024) m : UInt256; overload;
operator := (n : UInt1024) m : OWord; overload;
operator := (n : UInt1024) m : QWord; overload;

function ToUint1024(n : UInt512) : Uint1024; overload;
function ToUint1024(n : UInt256) : Uint1024; overload;
function ToUint1024(n : OWord) : Uint1024; overload;
function ToUint1024(n : QWord) : Uint1024; overload;
function ToUint1024(n : Int64) : Uint1024; overload;
function ToUint1024(n : DWord) : Uint1024; overload;
function ToUint1024(n : LongInt) : Uint1024; overload;
function ToUint1024(n : Word) : Uint1024; overload;
function ToUint1024(n : SmallInt) : Uint1024; overload;
function ToUint1024(n : Byte) : Uint1024; overload;
function ToUint1024(n : ShortInt) : Uint1024; overload;

function clone(n : Uint1024) : Uint1024;

function ToUInt512(n : UInt1024) : UInt512; overload;
function ToUInt512Shl(n : UInt1024; i : Integer) : UInt512; overload;
function ToUInt256(n : UInt1024) : UInt256; overload;
function ToUInt256Shl(n : UInt1024; i : Integer) : UInt256; overload;
function ToOWord(n : UInt1024) : OWord; overload;
function ToOWordShl(n : UInt1024; i : Integer) : OWord; overload;
function ToQWord(n : UInt1024) : QWord; overload;

operator = (n : Uint1024; m : Uint1024) eq : boolean;
operator <> (n : Uint1024; m : Uint1024) neq : boolean;
operator < (n : Uint1024; m : Uint1024) less : boolean;
operator <= (n : Uint1024; m : Uint1024) leq : boolean;
operator > (n : Uint1024; m : Uint1024) greater : boolean;
operator >= (n : Uint1024; m : Uint1024) geq : boolean;

function ShLeft(n : Uint1024; m : Integer) : Uint1024;
function ShRight(n : Uint1024; m : Integer) : Uint1024;

operator shl (n : UInt1024; m : Integer) shifted : UInt1024; overload;
operator shr (n : UInt1024; m : Integer) shifted : UInt1024; overload;
operator or (n : UInt1024; m : UInt1024) ored : UInt1024; overload;
operator and (n : UInt1024; m : UInt1024) anded : UInt1024; overload;
operator not (n : UInt1024) noted : UInt1024; overload;

operator + (n : Uint1024; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : Uint512) sum : Uint1024; overload;
operator + (n : Uint512; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : Uint256) sum : Uint1024; overload;
operator + (n : Uint256; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : OWord) sum : Uint1024; overload;
operator + (n : OWord; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : QWord) sum : Uint1024; overload;
operator + (n : QWord; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : Int64) sum : Uint1024; overload;
operator + (n : Int64; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : DWord) sum : Uint1024; overload;
operator + (n : DWord; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : LongInt) sum : Uint1024; overload;
operator + (n : LongInt; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : Word) sum : Uint1024; overload;
operator + (n : Word; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : SmallInt) sum : Uint1024; overload;
operator + (n : SmallInt; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : Byte) sum : Uint1024; overload;
operator + (n : Byte; m : Uint1024) sum : Uint1024; overload;
operator + (n : Uint1024; m : ShortInt) sum : Uint1024; overload;
operator + (n : ShortInt; m : Uint1024) sum : Uint1024; overload;

operator - (n : Uint1024; m : Uint1024) dif : Uint1024; overload;
operator - (n : Uint1024; m : UInt512) dif : Uint1024; overload;
operator - (n : Uint1024; m : UInt256) dif : Uint1024; overload;
operator - (n : Uint1024; m : OWord) dif : Uint1024; overload;
operator - (n : Uint1024; m : QWord) dif : Uint1024; overload;
operator - (n : Uint1024; m : DWord) dif : Uint1024; overload;
operator - (n : Uint1024; m : Word) dif : Uint1024; overload;
operator - (n : Uint1024; m : Byte) dif : Uint1024; overload;

operator * (n : QWord; m : Uint1024) prod : Uint1024; overload;
operator * (n : Uint1024; m : QWord) prod : Uint1024; overload;
operator * (n : Uint1024; m : Uint1024) prod : Uint1024; overload;

operator / (n : Uint1024; d : QWord) quo : Uint1024; overload;
operator / (n : UInt1024; d : UInt1024) quo : UInt1024; overload;

operator mod (n : Uint1024; d : QWord) rem : QWord; overload;
operator mod (n : UInt1024; d : UInt1024) rem : UInt1024; overload;

function IntToStr(Value : Uint1024) : String; overload;

function StrToUint1024(Value : String) : Uint1024;

procedure Print(n : Uint1024); overload;
procedure PrintLn(n : Uint1024); overload;


implementation

// sijoitukset

operator := (n : UInt512) m : Uint1024;
var
  i : Byte;
begin
  for i := 0 to 7 do m[i] := n[i];
  for i := 8 to 15 do m[i] := 0
end;

operator := (n : UInt256) m : Uint1024;
var
  i : Byte;
begin
  for i := 0 to 3 do m[i] := n[i];
  for i := 4 to 15 do m[i] := 0
end;

operator := (n : OWord) m : Uint1024;
var
  i : Byte;
begin
  m[0] := n.a;
  m[1] := n.b;
  for i := 2 to 15 do m[i] := 0
end;

operator := (n : QWord) m : Uint1024;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 15 do m[i] := 0
end;

operator := (n : Int64) m : Uint1024;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 15 do m[i] := 0
end;

operator := (n : DWord) m : Uint1024;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 15 do m[i] := 0
end;

operator := (n : LongInt) m : Uint1024;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 15 do m[i] := 0
end;

operator := (n : Word) m : Uint1024;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 15 do m[i] := 0
end;

operator := (n : SmallInt) m : Uint1024;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 15 do m[i] := 0
end;

operator := (n : Byte) m : Uint1024;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 15 do m[i] := 0
end;

operator := (n : ShortInt) m : Uint1024;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 15 do m[i] := 0
end;

// "alaspäin"

operator := (n : UInt1024) m : UInt512;
var
  i : Byte;
begin
  for i := 0 to 7 do m[i] := n[i]
end;

operator := (n : UInt1024) m : UInt256;
var
  i : Byte;
begin
  for i := 0 to 3 do m[i] := n[i]
end;

operator := (n : UInt1024) m : OWord;
begin
  m.a := n[0];
  m.b := n[1]
end;

operator := (n : UInt1024) m : QWord;
begin
  m := n[0]
end;

// Lyhyemmät esitykset 512 bittisiksi

function ToUint1024(n : UInt512) : Uint1024;
begin
  ToUint1024 := n
end;

function ToUint1024(n : UInt256) : Uint1024;
begin
  ToUint1024 := n
end;

function ToUint1024(n : OWord) : Uint1024;
begin
  ToUint1024 := n
end;

function ToUint1024(n : QWord) : Uint1024;
begin
  ToUint1024 := n
end;

function ToUint1024(n : Int64) : Uint1024;
begin
  ToUint1024 := n
end;

function ToUint1024(n : DWord) : Uint1024;
begin
  ToUint1024 := n
end;

function ToUint1024(n : LongInt) : Uint1024;
begin
  ToUint1024 := n
end;

function ToUint1024(n : Word) : Uint1024;
begin
  ToUint1024 := n
end;

function ToUint1024(n : SmallInt) : Uint1024;
begin
  ToUint1024 := n
end;

function ToUint1024(n : Byte) : Uint1024;
begin
  ToUint1024 := n
end;

function ToUint1024(n : ShortInt) : Uint1024;
begin
  ToUint1024 := n
end;

// kloonaus

function clone(n : Uint1024) : Uint1024;
var
  i : Byte;
begin
  for i:= 0 to 15 do clone[i] := n[i]
end;

// 1024 bittinen esitys lyhyemmäksi

function ToUInt512(n : UInt1024) : UInt512;
begin
  ToUInt512 := n;
end;

function ToUInt512Shl(n : UInt1024; i : Integer) : UInt512;
var
  j : Integer;
begin
  for j := 0 to i - 1 do TOUInt512shl[j] := 0;
  for j := i to i + 7 do if (j >= 0) and (j < 8) then ToUInt512shl[j] := n[j];
  for j := i + 4 to 7 do TOUInt512shl[j] := 0
end;

function ToUInt256(n : UInt1024) : UInt256;
begin
  ToUInt256 := n;
end;

function ToUInt256Shl(n : UInt1024; i : Integer) : UInt256;
var
  j : Integer;
begin
  for j := 0 to i - 1 do TOUInt256shl[j] := 0;
  for j := i to i + 3 do if (j >= 0) and (j < 8) then ToUInt256shl[j] := n[j];
  for j := i + 4 to 7 do TOUInt256shl[j] := 0
end;

function ToOWord(n : UInt1024) : OWord;
begin
  ToOWord := n;
end;

function ToOWordShl(n : UInt1024; i : Integer) : OWord;
begin
  case i of
       -1 :
         begin
              ToOWordShl.a := 0;
              ToOWordShl.b := n[0]
         end;
       0..14 :
         begin
              ToOWordShl.a := n[i];
              ToOWordShl.b := n[i + 1]
         end;
       15 :
         begin
              ToOWordShl.a := n[7];
              ToOWordShl.b := 0
         end
       else ToOWordShl := 0
  end
end;

function ToQWord(n : UInt1024) : QWord;
begin
  ToQWord := n;
end;

// vertailuoperaatiot

operator = (n : Uint1024; m : Uint1024) eq : boolean;
var
  i : Byte;
begin
  eq := n[0] = m[0];
  for i := 1 to 15 do
  begin
    if eq then eq := n[i] = m[i]
    else break
  end
end;

operator <> (n : Uint1024; m : Uint1024) neq : boolean;
begin
  neq := not(n = m)
end;

operator < (n : Uint1024; m : Uint1024) less : boolean;
var
  i : Byte;
begin
  less := n[15] < m[15];
  for i := 15 downto 1 do
  begin
    if n[i] = m[i] then less := n[i - 1] < m[i - 1]
    else break
  end
end;

operator <= (n : Uint1024; m : Uint1024) leq : boolean;
var
  i : Byte;
begin
  leq := n[15] <= m[15];
  for i := 15 downto 1 do
  begin
    if n[i] = m[i] then leq := n[i - 1] <= m[i - 1]
    else break
  end
end;

operator > (n : Uint1024; m : Uint1024) greater : boolean;
var
  i : Byte;
begin
  greater := n[15] > m[15];
  for i := 15 downto 1 do
  begin
    if n[i] = m[i] then greater := n[i - 1] > m[i - 1]
    else break
  end
end;

operator >= (n : Uint1024; m : Uint1024) geq : boolean;
var
  i : Byte;
begin
  geq := n[15] >= m[15];
  for i := 15 downto 1 do
  begin
    if n[i] = m[i] then geq := n[i - 1] >= m[i - 1]
    else break
  end
end;

// siirrot "numeroittain"

// vasemmalle

function ShLeft(n : Uint1024; m : Integer) : Uint1024;
var
  i: Integer;
begin
  if m > 15 then ShLeft := 0
  else if m < 0 then ShLeft := ShRight(n, -m)
  else
  begin
    for i := 0 to m - 1 do ShLeft[i] := 0;
    for i := m to 15 do ShLeft[i] := n[i - m]
  end;
end;

function ShRight(n : Uint1024; m : Integer) : Uint1024;
var
  i: Integer;
begin
  if m > 15 then ShRight := 0
  else if m < 0 then ShRight := ShLeft(n, -m)
  else
  begin
    for i := 15 downto 16 - m  do ShRight[i] := 0;
    for i := 15 - m downto 0 do ShRight[i] := n[i + m]
  end;
end;

// loogiset operaatiot

operator shl (n : UInt1024; m : Integer) shifted : UInt1024;
var
  q, r : Integer;
  i : Byte;
begin
  if m < 0 then shifted := n shr (-m)
  else
  begin
    q := m div 64;
    r := m mod 64;
    case q of
         0 : shifted := clone(n);
         1..15 : shifted := ShLeft(n, q);
         else shifted := 0
    end;
    if r <> 0 then
    begin
      for i := 15 downto 1 do shifted[i] := (shifted[i] shl r) or (shifted[i - 1] shr (64 - r));
      shifted[0] := shifted[0] shl r
    end
  end
end;

operator shr (n : UInt1024; m : Integer) shifted : UInt1024;
var
  q, r : Integer;
  i : Byte;
begin
  if m < 0 then shifted := n shl (-m)
  else
  begin
    q := m div 64;
    r := m mod 64;
    case q of
         0 : shifted := clone(n);
         1..15 : shifted := ShRight(n, q);
         else shifted := 0
    end;
    if r <> 0 then
    begin
      for i := 0 to 14 do shifted[i] := (shifted[i] shr r) or (shifted[i + 1] shl (64 - r));
      shifted[15] := shifted[15] shr r
    end
  end
end;

operator or (n : UInt1024; m : UInt1024) ored : UInt1024;
var
  i : Byte;
begin
  for i := 0 to 7 do ored[i] := n[i] or m[i]
end;

operator and (n : UInt1024; m : UInt1024) anded : UInt1024;
var
  i : Byte;
begin
  for i := 0 to 7 do anded[i] := n[i] and m[i]
end;

operator not (n : UInt1024) noted : UInt1024;
var
  i : Byte;
begin
  for i := 0 to 7 do noted[i] := not n[i]
end;

// laskutoimitukset

// yhteenlasku

operator + (n : Uint1024; m : Uint1024) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  for i:= 0 to 14 do sum[i] := AddWithCarryQWord(n[i], m[i], @c);
  sum[15] := n[15] + m[15] + c
end;

operator + (n : Uint1024; m : Uint512) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  for i:= 0 to 7 do sum[i] := AddWithCarryQWord(n[i], m[i], @c);
  for i:= 8 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : Uint512; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

operator + (n : Uint1024; m : Uint256) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  for i:= 0 to 3 do sum[i] := AddWithCarryQWord(n[i], m[i], @c);
  for i:= 4 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : Uint256; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

operator + (n : Uint1024; m : OWord) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m.a, @c);
  sum[1] := AddWithCarryQWord(n[1], m.b, @c);
  for i:= 2 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : OWord; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

operator + (n : Uint1024; m : QWord) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : QWord; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

operator + (n : Uint1024; m : Int64) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : Int64; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

operator + (n : Uint1024; m : DWord) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : DWord; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

operator + (n : Uint1024; m : LongInt) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : LongInt; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

operator + (n : Uint1024; m : Word) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : Word; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

operator + (n : Uint1024; m : SmallInt) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : SmallInt; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

operator + (n : Uint1024; m : Byte) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : Byte; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

operator + (n : Uint1024; m : ShortInt) sum : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 14 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[15] := n[15] + c
end;

operator + (n : ShortInt; m : Uint1024) sum : Uint1024;
begin
  sum := m + n;
end;

// vähennyslasku

operator - (n : Uint1024; m : Uint1024) dif : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  for i := 0 to 14 do dif[i] := DifWithCarryQWord(n[i], m[i], @c);
  dif[15] := n[15] - m[15] - c
end;

operator - (n : Uint1024; m : UInt512) dif : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  for i := 0 to 7 do dif[i] := DifWithCarryQWord(n[i], m[i], @c);
  for i := 8 to 14 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[15] := n[15] - c
end;

operator - (n : Uint1024; m : UInt256) dif : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  for i := 0 to 3 do dif[i] := DifWithCarryQWord(n[i], m[i], @c);
  for i := 4 to 14 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[15] := n[15] - c
end;

operator - (n : Uint1024; m : OWord) dif : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m.a, @c);
  dif[1] := DifWithCarryQWord(n[1], m.b, @c);
  for i := 2 to 14 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[15] := n[15] - c
end;

operator - (n : Uint1024; m : QWord) dif : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  for i := 1 to 14 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[15] := n[15] - c
end;

operator - (n : Uint1024; m : DWord) dif : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  for i := 1 to 14 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[15] := n[15] - c
end;

operator - (n : Uint1024; m : Word) dif : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  for i := 1 to 14 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[15] := n[15] - c
end;

operator - (n : Uint1024; m : Byte) dif : Uint1024;
var
  i : Byte;
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  for i := 1 to 14 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[15] := n[15] - c
end;

// kertolasku

operator * (n : QWord; m : Uint1024) prod : Uint1024;
var
  i : Byte;
begin
  prod := 0;
  if n <> 0 then
  begin
    prod := Mul128(n, m[0]);
    for i := 1 to 14 do prod := prod + ShLeft(ToUint1024(Mul128(n, m[i])), i);
    prod[15] := prod[15] + n * m[15]
  end
end;

operator * (n : Uint1024; m : QWord) prod : Uint1024;
begin
  prod := m * n
end;

operator * (n : Uint1024; m : Uint1024) prod : Uint1024;
var
  i : Byte;
begin
  prod := 0;
  if (n <> 0) then
  begin
    prod := n[0] * m;
    for i:= 1 to 14 do prod := prod + ShLeft(n[i] * m, i);
    prod[15] := prod[15] + n[15] * m[0];
  end;
end;

// jakolasku

// jakaja 64 bittinen etumerkitön luku

operator / (n : Uint1024; d : QWord) quo : Uint1024;
var
  part : OWord;
  i : Byte;
begin
  if d <> 0 then
  begin
    quo[15] := n[15] div d;
    part.b := n[15] mod d;
    part.a := n[14];
    for i := 14 downto 1 do
    begin
      quo[i] := (part / d).a;
      part.b := part mod d;
      part.a := n[i - 1];
    end;
    quo[0] := (part / d).a
  end
  else WriteLn('Error: Uint1024_arithmetic: Can''t divide by zero.')
end;

// kahden UInt1024:n osamäärä UInt1024:na

operator / (n : UInt1024; d : UInt1024) quo : UInt1024;
const
  u : UInt1024 = (1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0);
  TopBit : QWord = QWord($8FFFFFFF);
var
  x, r : UInt1024;
  i : Integer = 0;
  j : Integer;
begin
  if d <> 0 then
  begin
    quo := 0;
    if d < n then
    begin
      x := clone(d);
      while (x < n) and (x[15] = 0) do
      begin
        x := ShLeft(x, 1);
        i := i + 64;
	  end;
      if x = n then quo := ShLeft(u , i div 64)
      else
      begin
        if x > n then
        begin
          i := i - 64;
          x := ShRight(x, 1);
          while (x < n) do
          begin
            x := x shl 1;
            i := i + 1
          end
        end
        else
        begin
          while (x < n) and (x[15] < TopBit) do
          begin
            x := x shl 1;
            i := i + 1
          end
        end;
        if x = n then quo := u shl i
        else
        begin
          if x > n then
          begin
            x := x shr 1;
            i := i - 1
          end;
          r := clone(n);
          for j := i downto 0 do
          begin
            if x <= r then
            begin
              r := r - x;
              quo := quo or (u shl j)
            end;
            if r < d then Break;
            x := x shr 1
          end
        end
      end
	end
	else if d = n then quo := 1
  end
  else WriteLn('Error: Uint1024_arithmetic: Can''t divide by zero.')
end;

// jakojäännös

// jaettaessa 64 bittisellä etumerkittömällä luvulla

operator mod (n : Uint1024; d : QWord) rem : QWord;
var
  part : OWord;
  i : Byte;
begin
  if d <> 0 then
  begin
    part.b := n[15] mod d;
    part.a := n[14];
    for i := 14 downto 1 do
    begin
      part.b := part mod d;
      part.a := n[i - 1];
    end;
    rem := part mod d;
  end
  else WriteLn('Error: Uint1024_arithmetic: Can''t divide by zero.')
end;

// jaettaessa UInt1024:lla, jakokäännös myös esitettynä UInt1024:na

operator mod (n : Uint1024; d : UInt1024) rem : UInt1024;
var
  x : UInt1024;
  i : Integer = 0;
begin
  if d <> 0 then
  begin
    rem := clone(d);
    while (rem < n) and (rem[15] = 0) do
    begin
      rem := ShLeft(rem, 1);
      i := i + 1;
    end;
    if rem = n then rem := 0
    else
    begin
      if rem > n then i := i - 1;
      rem := clone(n);
      if i > -1 then
      begin
        x := ShLeft(d, i);
        while (x < rem) do x := x shl 1;
        if x = rem then rem := 0
        else
        begin
          x := x shr 1;
          rem := rem - x;
          while d <= rem do
          begin
            if x <= rem then rem := rem - x;
            x := x shr 1
          end
        end
      end
    end
  end
  else WriteLn('Error: UInt1024_arithmetic: Can''t divide by zero.')
end;

// input/output toimintoja

function IntToStr(Value : Uint1024) : String;
const
  d : QWord = 10;
var
  n : Uint1024;
begin
  n := clone(Value);
  IntToStr := '';
  repeat
    IntToStr := IntToStr(n mod d) + IntToStr;
    n := n / d
  until n = 0;
end;

function StrToUint1024(Value : String) : Uint1024;
const
  d : QWord = 10;
var
  i : Integer = 1;
begin
  StrToUint1024 := 0;
  if Value <> '' then
  begin
    while (IsNumber(Value[i])) do
    begin
         StrToUint1024 := d * StrToUint1024 + (ord(Value[i]) - ord('0'));
         i := i + 1
    end
  end
end;

procedure Print(n : Uint1024);
begin
  Write(IntToStr(n));
end;

procedure PrintLn(n : Uint1024);
begin
  WriteLn(IntToStr(n));
end;

end.
