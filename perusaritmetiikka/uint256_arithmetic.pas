unit UInt256_arithmetic;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, OWord_arithmetic, Arithmetic_assist, Character;

type
  UInt256 = Array [0..3] of QWord;

operator := (n : OWord) m : UInt256; overload;
operator := (n : QWord) m : UInt256; overload;
operator := (n : Int64) m : UInt256; overload;
operator := (n : DWord) m : UInt256; overload;
operator := (n : LongInt) m : UInt256; overload;
operator := (n : Word) m : UInt256; overload;
operator := (n : SmallInt) m : UInt256; overload;
operator := (n : Byte) m : UInt256; overload;
operator := (n : ShortInt) m : UInt256; overload;

operator := (n : UInt256) m : OWord; overload;
operator := (n : UInt256) m : QWord; overload;

function ToUInt256(n : OWord) : UInt256; overload;
function ToUInt256(n : QWord) : UInt256; overload;
function ToUInt256(n : Int64) : UInt256; overload;
function ToUInt256(n : DWord) : UInt256; overload;
function ToUInt256(n : LongInt) : UInt256; overload;
function ToUInt256(n : Word) : UInt256; overload;
function ToUInt256(n : SmallInt) : UInt256; overload;
function ToUInt256(n : Byte) : UInt256; overload;
function ToUInt256(n : ShortInt) : UInt256; overload;

function ToUInt256(n : OWord; m : OWord) : UInt256; overload;
function ToUInt256(n : OWord; m : QWord; l : QWord) : UInt256; overload;
function ToUInt256(n : QWord; m : OWord; l : QWord) : UInt256; overload;
function ToUInt256(n : QWord; m : QWord; l : OWord) : UInt256; overload;
function ToUInt256(n : OWord; m : QWord) : UInt256; overload;
function ToUInt256(n : QWord; m : OWord) : UInt256; overload;

function clone(n : UInt256) : UInt256;

function ToOWord(n : UInt256) : OWord; overload;
function ToOWordShl(n : UInt256; i : Integer) : OWord; overload;
function ToQWord(n : UInt256) : QWord; overload;

operator = (n : UInt256; m : UInt256) eq : boolean;
operator <> (n : UInt256; m : UInt256) neq : boolean;
operator < (n : UInt256; m : UInt256) less : boolean;
operator <= (n : UInt256; m : UInt256) leq : boolean;
operator > (n : UInt256; m : UInt256) greater : boolean;
operator >= (n : UInt256; m : UInt256) geq : boolean;

function shl1(n : UInt256) : UInt256;
function shl2(n : UInt256) : UInt256;
function shl3(n : UInt256) : UInt256;

function shr1(n : UInt256) : UInt256;
function shr2(n : UInt256) : UInt256;
function shr3(n : UInt256) : UInt256;

operator shl (n : UInt256; m : Integer) shifted : UInt256;
operator shr (n : UInt256; m : Integer) shifted : UInt256;
operator or (n : UInt256; m : UInt256) ored : UInt256;
operator and (n : UInt256; m : UInt256) anded : UInt256;

function ToUInt256Shl1(n : OWord) : UInt256; overload;
function ToUInt256Shl2(n : OWord) : UInt256; overload;
function ToUInt256Shl3(n : OWord) : UInt256; overload;

function ToUInt256Shl1(n : QWord) : UInt256; overload;
function ToUInt256Shl2(n : QWord) : UInt256; overload;
function ToUInt256Shl3(n : QWord) : UInt256; overload;

function ToUInt256Shl1(n : DWord) : UInt256; overload;
function ToUInt256Shl2(n : DWord) : UInt256; overload;
function ToUInt256Shl3(n : DWord) : UInt256; overload;

operator + (n : UInt256; m : UInt256) sum : UInt256; overload;
operator + (n : UInt256; m : OWord) sum : UInt256; overload;
operator + (n : OWord; m : UInt256) sum : UInt256; overload;
operator + (n : UInt256; m : QWord) sum : UInt256; overload;
operator + (n : QWord; m : UInt256) sum : UInt256; overload;
operator + (n : UInt256; m : Int64) sum : UInt256; overload;
operator + (n : Int64; m : UInt256) sum : UInt256; overload;
operator + (n : UInt256; m : DWord) sum : UInt256; overload;
operator + (n : DWord; m : UInt256) sum : UInt256; overload;
operator + (n : UInt256; m : LongInt) sum : UInt256; overload;
operator + (n : LongInt; m : UInt256) sum : UInt256; overload;
operator + (n : UInt256; m : Word) sum : UInt256; overload;
operator + (n : Word; m : UInt256) sum : UInt256; overload;
operator + (n : UInt256; m : SmallInt) sum : UInt256; overload;
operator + (n : SmallInt; m : UInt256) sum : UInt256; overload;
operator + (n : UInt256; m : Byte) sum : UInt256; overload;
operator + (n : Byte; m : UInt256) sum : UInt256; overload;
operator + (n : UInt256; m : ShortInt) sum : UInt256; overload;
operator + (n : ShortInt; m : UInt256) sum : UInt256; overload;

operator - (n : UInt256; m : UInt256) dif : UInt256; overload;
operator - (n : UInt256; m : OWord) dif : UInt256; overload;
operator - (n : UInt256; m : QWord) dif : UInt256; overload;
operator - (n : UInt256; m : DWord) dif : UInt256; overload;
operator - (n : UInt256; m : Word) dif : UInt256; overload;
operator - (n : UInt256; m : Byte) dif : UInt256; overload;

operator * (n : QWord; m : UInt256) prod : UInt256; overload;
operator * (n : UInt256; m : QWord) prod : UInt256; overload;
operator * (n : UInt256; m : UInt256) prod : UInt256; overload;

operator / (n : UInt256; d : QWord) quo : UInt256; overload;
operator / (n : UInt256; d : OWord) quo : UInt256; overload;
operator / (n : UInt256; d : UInt256) quo : UInt256; overload;

operator mod (n : UInt256; d : QWord) rem : QWord; overload;
operator mod (n : UInt256; d : OWord) rem : OWord; overload;
operator mod (n : UInt256; d : UInt256) rem : UInt256; overload;

function IntToStr(Value : UInt256) : String; overload;

function StrToUInt256(Value : String) : UInt256;

procedure Print(n : UInt256); overload;
procedure PrintLn(n : UInt256); overload;

implementation

// sijoitukset

operator := (n : OWord) m : UInt256;
begin
  m[0] := n.a;
  m[1] := n.b;
  m[2] := 0;
  m[3] := 0
end;

operator := (n : QWord) m : UInt256;
begin
  m[0] := n;
  m[1] := 0;
  m[2] := 0;
  m[3] := 0
end;

operator := (n : Int64) m : UInt256;
begin
  m[0] := n;
  m[1] := 0;
  m[2] := 0;
  m[3] := 0
end;

operator := (n : DWord) m : UInt256;
begin
  m[0] := n;
  m[1] := 0;
  m[2] := 0;
  m[3] := 0
end;

operator := (n : LongInt) m : UInt256;
begin
  m[0] := n;
  m[1] := 0;
  m[2] := 0;
  m[3] := 0
end;

operator := (n : Word) m : UInt256;
begin
  m[0] := n;
  m[1] := 0;
  m[2] := 0;
  m[3] := 0
end;

operator := (n : SmallInt) m : UInt256;
begin
  m[0] := n;
  m[1] := 0;
  m[2] := 0;
  m[3] := 0
end;

operator := (n : Byte) m : UInt256;
begin
  m[0] := n;
  m[1] := 0;
  m[2] := 0;
  m[3] := 0
end;

operator := (n : ShortInt) m : UInt256;
begin
  m[0] := n;
  m[1] := 0;
  m[2] := 0;
  m[3] := 0
end;

// "alaspäin"

operator := (n : UInt256) m : OWord;
begin
  m.a := n[0];
  m.b := n[1]
end;

operator := (n : UInt256) m : QWord;
begin
  m := n[0];
end;

// Lyhyemmät esitykset 256 bittisiksi

function ToUInt256(n : OWord) : UInt256;
begin
  ToUInt256 := n
end;

function ToUInt256(n : QWord) : UInt256;
begin
  ToUInt256 := n
end;

function ToUInt256(n : Int64) : UInt256;
begin
  ToUInt256 := n
end;

function ToUInt256(n : DWord) : UInt256;
begin
  ToUInt256 := n
end;

function ToUInt256(n : LongInt) : UInt256;
begin
  ToUInt256 := n
end;

function ToUInt256(n : Word) : UInt256;
begin
  ToUInt256 := n
end;

function ToUInt256(n : SmallInt) : UInt256;
begin
  ToUInt256 := n
end;

function ToUInt256(n : Byte) : UInt256;
begin
  ToUInt256 := n
end;

function ToUInt256(n : ShortInt) : UInt256;
begin
  ToUInt256 := n
end;

// UInt256:ksi eri kombinaatioista

function ToUInt256(n : OWord; m : OWord) : UInt256;
begin
  ToUInt256[0] := n.a;
  ToUInt256[1] := n.b;
  ToUInt256[2] := m.a;
  ToUInt256[3] := m.b
end;

function ToUInt256(n : OWord; m : QWord; l : QWord) : UInt256;
begin
  ToUInt256[0] := n.a;
  ToUInt256[1] := n.b;
  ToUInt256[2] := m;
  ToUInt256[3] := l
end;

function ToUInt256(n : QWord; m : OWord; l : QWord) : UInt256;
begin
  ToUInt256[0] := n;
  ToUInt256[1] := m.a;
  ToUInt256[2] := m.b;
  ToUInt256[3] := l
end;

function ToUInt256(n : QWord; m : QWord; l : OWord) : UInt256;
begin
  ToUInt256[0] := n;
  ToUInt256[1] := m;
  ToUInt256[2] := l.a;
  ToUInt256[3] := l.b
end;

function ToUInt256(n : OWord; m : QWord) : UInt256;
begin
  ToUInt256[0] := n.a;
  ToUInt256[1] := n.b;
  ToUInt256[2] := m;
  ToUInt256[3] := 0
end;

function ToUInt256(n : QWord; m : OWord) : UInt256;
begin
  ToUInt256[0] := n;
  ToUInt256[1] := m.a;
  ToUInt256[2] := m.b;
  ToUInt256[3] := 0
end;

// kloonaus

function clone(n : UInt256) : UInt256;
var
  i : Byte;
begin
  for i:= 0 to 3 do clone[i] := n[i]
end;

// 256 bittinen esitys lyhyemmäksi

function ToOWord(n : UInt256) : OWord;
begin
  ToOWord := n
end;

function ToOWordShl(n : UInt256; i : Integer) : OWord;
begin
  case i of
       -1 :
         begin
              ToOWordShl.a := 0;
              ToOWordShl.b := n[0]
         end;
       0..2 :
         begin
              ToOWordShl.a := n[i];
              ToOWordShl.b := n[i + 1]
         end;
       3 :
         begin
              ToOWordShl.a := n[3];
              ToOWordShl.b := 0
         end
       else ToOWordShl := 0
  end
end;

function ToQWord(n : UInt256) : QWord;
begin
  ToQWord := n;
end;

// vertailut

operator = (n : UInt256; m : UInt256) eq : boolean;
begin
  eq := (n[0] = m[0]);
  if eq then
  begin
    eq := (n[1] = m[1]);
    if eq then
    begin
      eq := (n[2] = m[2]);
      if eq then eq := (n[3] = m[3])
    end
  end
end;

operator <> (n : UInt256; m : UInt256) neq : boolean;
begin
  neq := not(n = m)
end;

operator < (n : UInt256; m : UInt256) less : boolean;
begin
  less := (n[3] < m[3]);
  if n[3] = m[3] then
  begin
    less := (n[2] < m[2]);
    if n[2] = m[2] then
    begin
      less := (n[1] < m[1]);
      if n[1] = m[1] then less := (n[0] < m[0])
    end
  end
end;

operator <= (n : UInt256; m : UInt256) leq : boolean;
begin
  leq := (n[3] <= m[3]);
  if n[3] = m[3] then
  begin
    leq := (n[2] <= m[2]);
    if n[2] = m[2] then
    begin
      leq := (n[1] <= m[1]);
      if n[1] = m[1] then leq := (n[0] <= m[0])
    end
  end
end;

operator > (n : UInt256; m : UInt256) greater : boolean;
begin
  greater := not(n <= m)
end;

operator >= (n : UInt256; m : UInt256) geq : boolean;
begin
  geq := not(n < m)
end;

// siirrot "numeroittain"

// vasemmalle

function shl1(n : UInt256) : UInt256;
begin
  shl1[3] := n[2];
  shl1[2] := n[1];
  shl1[1] := n[0];
  shl1[0] := 0;
end;

function shl2(n : UInt256) : UInt256;
begin
  shl2[3] := n[1];
  shl2[2] := n[0];
  shl2[1] := 0;
  shl2[0] := 0;
end;

function shl3(n : UInt256) : UInt256;
begin
  shl3[3] := n[0];
  shl3[2] := 0;
  shl3[1] := 0;
  shl3[0] := 0;
end;

// oikealle

function shr1(n : UInt256) : UInt256;
begin
  shr1[0] := n[1];
  shr1[1] := n[2];
  shr1[2] := n[3];
  shr1[3] := 0;
end;

function shr2(n : UInt256) : UInt256;
begin
  shr2[0] := n[2];
  shr2[1] := n[3];
  shr2[2] := 0;
  shr2[3] := 0;
end;

function shr3(n : UInt256) : UInt256;
begin
  shr3[0] := n[3];
  shr3[1] := 0;
  shr3[2] := 0;
  shr3[3] := 0;
end;

// sijoitus ja siirto yhdessä

// 128 bittisestä

function ToUInt256Shl1(n : OWord) : UInt256;
begin
  ToUInt256Shl1[0] := 0;
  ToUInt256Shl1[1] := n.a;
  ToUInt256Shl1[2] := n.b;
  ToUInt256Shl1[3] := 0;
end;

function ToUInt256Shl2(n : OWord) : UInt256;
begin
  ToUInt256Shl2[0] := 0;
  ToUInt256Shl2[1] := 0;
  ToUInt256Shl2[2] := n.a;
  ToUInt256Shl2[3] := n.b;
end;

function ToUInt256Shl3(n : OWord) : UInt256;
begin
  ToUInt256Shl3[0] := 0;
  ToUInt256Shl3[1] := 0;
  ToUInt256Shl3[2] := 0;
  ToUInt256Shl3[3] := n.a;
end;

// 64 bittisestä

function ToUInt256Shl1(n : QWord) : UInt256;
begin
  ToUInt256Shl1[0] := 0;
  ToUInt256Shl1[1] := n;
  ToUInt256Shl1[2] := 0;
  ToUInt256Shl1[3] := 0;
end;

function ToUInt256Shl2(n : QWord) : UInt256;
begin
  ToUInt256Shl2[0] := 0;
  ToUInt256Shl2[1] := 0;
  ToUInt256Shl2[2] := n;
  ToUInt256Shl2[3] := 0;
end;

function ToUInt256Shl3(n : QWord) : UInt256;
begin
  ToUInt256Shl3[0] := 0;
  ToUInt256Shl3[1] := 0;
  ToUInt256Shl3[2] := 0;
  ToUInt256Shl3[3] := n;
end;

// 32 bittisestä

function ToUInt256Shl1(n : DWord) : UInt256;
begin
  ToUInt256Shl1[0] := 0;
  ToUInt256Shl1[1] := n;
  ToUInt256Shl1[2] := 0;
  ToUInt256Shl1[3] := 0;
end;

function ToUInt256Shl2(n : DWord) : UInt256;
begin
  ToUInt256Shl2[0] := 0;
  ToUInt256Shl2[1] := 0;
  ToUInt256Shl2[2] := n;
  ToUInt256Shl2[3] := 0;
end;

function ToUInt256Shl3(n : DWord) : UInt256;
begin
  ToUInt256Shl3[0] := 0;
  ToUInt256Shl3[1] := 0;
  ToUInt256Shl3[2] := 0;
  ToUInt256Shl3[3] := n;
end;

// loogiset operaatiot

operator shl (n : UInt256; m : Integer) shifted : UInt256;
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
         1 : shifted := shl1(n);
         2 : shifted := shl2(n);
         3 : shifted := shl3(n);
         else shifted := 0
    end;
    if r <> 0 then
    begin
      for i := 3 downto 1 do shifted[i] := (shifted[i] shl r) or (shifted[i - 1] shr (64 - r));
      shifted[0] := shifted[0] shl r
    end
  end
end;

operator shr (n : UInt256; m : Integer) shifted : UInt256;
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
         1 : shifted := shr1(n);
         2 : shifted := shr2(n);
         3 : shifted := shr3(n);
         else shifted := 0
    end;
    if r <> 0 then
    begin
      for i := 0 to 2 do shifted[i] := (shifted[i] shr r) or (shifted[i - 1] shl (64 - r));
      shifted[3] := shifted[3] shr r
    end
  end
end;

operator or (n : UInt256; m : UInt256) ored : UInt256;
var
  i : Byte;
begin
  for i := 0 to 3 do ored[i] := n[i] or m[i]
end;

operator and (n : UInt256; m : UInt256) anded : UInt256;
var
  i : Byte;
begin
  for i := 0 to 3 do anded[i] := n[i] and m[i]
end;

// laskutoimitukset

// yhteenlasku

operator + (n : UInt256; m : UInt256) sum : UInt256;
var
  i : Byte;
  c : Byte = 0;
begin
  for i:= 0 to 2 do sum[i] := AddWithCarryQWord(n[i], m[i], @c);
  sum[3] := n[3] + m[3] + c
end;

operator + (n : UInt256; m : OWord) sum : UInt256;
var
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m.a, @c);
  sum[1] := AddWithCarryQWord(n[1], m.b, @c);
  sum[2] := AddWithCarryQWord(n[2], 0, @c);
  sum[3] := n[3] + c
end;

operator + (n : OWord; m : UInt256) sum : UInt256;
begin
  sum := m + n;
end;

operator + (n : UInt256; m : QWord) sum : UInt256;
var
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  sum[1] := AddWithCarryQWord(n[1], 0, @c);
  sum[2] := AddWithCarryQWord(n[2], 0, @c);
  sum[3] := n[3] + c
end;

operator + (n : QWord; m : UInt256) sum : UInt256;
begin
  sum := m + n;
end;

operator + (n : UInt256; m : Int64) sum : UInt256;
var
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  sum[1] := AddWithCarryQWord(n[1], 0, @c);
  sum[2] := AddWithCarryQWord(n[2], 0, @c);
  sum[3] := n[3] + c
end;

operator + (n : Int64; m : UInt256) sum : UInt256;
begin
  sum := m + n;
end;

operator + (n : UInt256; m : DWord) sum : UInt256;
var
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  sum[1] := AddWithCarryQWord(n[1], 0, @c);
  sum[2] := AddWithCarryQWord(n[2], 0, @c);
  sum[3] := n[3] + c
end;

operator + (n : DWord; m : UInt256) sum : UInt256;
begin
  sum := m + n;
end;

operator + (n : UInt256; m : LongInt) sum : UInt256;
var
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  sum[1] := AddWithCarryQWord(n[1], 0, @c);
  sum[2] := AddWithCarryQWord(n[2], 0, @c);
  sum[3] := n[3] + c
end;

operator + (n : LongInt; m : UInt256) sum : UInt256;
begin
  sum := m + n;
end;

operator + (n : UInt256; m : Word) sum : UInt256;
var
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  sum[1] := AddWithCarryQWord(n[1], 0, @c);
  sum[2] := AddWithCarryQWord(n[2], 0, @c);
  sum[3] := n[3] + c
end;

operator + (n : Word; m : UInt256) sum : UInt256;
begin
  sum := m + n;
end;

operator + (n : UInt256; m : SmallInt) sum : UInt256;
var
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  sum[1] := AddWithCarryQWord(n[1], 0, @c);
  sum[2] := AddWithCarryQWord(n[2], 0, @c);
  sum[3] := n[3] + c
end;

operator + (n : SmallInt; m : UInt256) sum : UInt256;
begin
  sum := m + n;
end;

operator + (n : UInt256; m : Byte) sum : UInt256;
var
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  sum[1] := AddWithCarryQWord(n[1], 0, @c);
  sum[2] := AddWithCarryQWord(n[2], 0, @c);
  sum[3] := n[3] + c
end;

operator + (n : Byte; m : UInt256) sum : UInt256;
begin
  sum := m + n;
end;

operator + (n : UInt256; m : ShortInt) sum : UInt256;
var
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  sum[1] := AddWithCarryQWord(n[1], 0, @c);
  sum[2] := AddWithCarryQWord(n[2], 0, @c);
  sum[3] := n[3] + c
end;

operator + (n : ShortInt; m : UInt256) sum : UInt256;
begin
  sum := m + n;
end;

// vähennyslasku

operator - (n : UInt256; m : UInt256) dif : UInt256;
var
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m[0], @c);
  dif[1] := DifWithCarryQWord(n[1], m[1], @c);
  dif[2] := DifWithCarryQWord(n[2], m[2], @c);
  dif[3] := DifWithCarryQWord(n[3], m[3], @c);
end;

operator - (n : UInt256; m : OWord) dif : UInt256;
var
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m.a, @c);
  dif[1] := DifWithCarryQWord(n[1], m.b, @c);
  dif[2] := DifWithCarryQWord(n[2], 0, @c);
  dif[3] := DifWithCarryQWord(n[3], 0, @c);
end;

operator - (n : UInt256; m : QWord) dif : UInt256;
var
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  dif[1] := DifWithCarryQWord(n[1], 0, @c);
  dif[2] := DifWithCarryQWord(n[2], 0, @c);
  dif[3] := DifWithCarryQWord(n[3], 0, @c);
end;

operator - (n : UInt256; m : DWord) dif : UInt256;
var
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  dif[1] := DifWithCarryQWord(n[1], 0, @c);
  dif[2] := DifWithCarryQWord(n[2], 0, @c);
  dif[3] := DifWithCarryQWord(n[3], 0, @c);
end;

operator - (n : UInt256; m : Word) dif : UInt256;
var
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  dif[1] := DifWithCarryQWord(n[1], 0, @c);
  dif[2] := DifWithCarryQWord(n[2], 0, @c);
  dif[3] := DifWithCarryQWord(n[3], 0, @c);
end;

operator - (n : UInt256; m : Byte) dif : UInt256;
var
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  dif[1] := DifWithCarryQWord(n[1], 0, @c);
  dif[2] := DifWithCarryQWord(n[2], 0, @c);
  dif[3] := DifWithCarryQWord(n[3], 0, @c);
end;

// kertolasku

operator * (n : QWord; m : UInt256) prod : UInt256;
begin
  prod := 0;
  if (n <> 0) then
  begin
    prod := Mul128(n, m[0]);
    prod := prod + ToUInt256Shl1(Mul128(n, m[1]));
    prod := prod + ToUInt256Shl2(Mul128(n, m[2]));
    prod[3] := prod[3] + n * m[3]
  end
end;

operator * (n : UInt256; m : QWord) prod : UInt256;
begin
  prod := m * n
end;

operator * (n : UInt256; m : UInt256) prod : UInt256;
begin
  prod := 0;
  if (n <> 0) then
  begin
    prod := n[0] * m;
    prod := prod + shl1(n[1] * m);
    prod := prod + shl2(n[2] * m);
    prod[3] := prod[3] + n[3] * m[0]
  end
end;

// jakolasku

// jakaja 64 bittinen etumerkitön luku

operator / (n : UInt256; d : QWord) quo : UInt256;
var
  part : OWord;
begin
  if d <> 0 then
  begin
    quo[3] := n[3] div d;
    part := ToOWord(n[2], n[3] mod d);
    quo[2] := (part / d).a;
    part := ToOWord(n[1], part mod d);
    quo[1] := (part / d).a;
    part := ToOWord(n[0], part mod d);
    quo[0] := (part / d).a
  end
  else WriteLn('Error: UInt256_arithmetic: Can''t divide by zero.')
end;

// jakaja 128 bittinen etumerkitön luku

operator / (n : UInt256; d : OWord) quo : UInt256;
const
  u : UInt256 = (1, 0, 0, 0);
var
  r_part1 : OWord;
  r_part2, x : UInt256;
  i : Byte;
  j : Byte = 0;
begin
  if d <> 0 then
  begin
    if d.b = 0 then quo := n / d.a
    else
    begin
      r_part1 := ToOWordShl(n, 2);
      quo := ToUInt256shl2(r_part1 / d);
      r_part2 := ToUInt256shl2(r_part1 mod d);
      r_part2[1] := n[1];
      r_part2[0] := n[0];
      x := d;
      while x < r_part2 do
      begin
           x := x shl 1;
           j := j + 1
      end;
      if x = r_part2 then quo := quo or (x shl j)
      else
      begin
           for i := j - 1 downto 0 do
           begin
                x := x shr 1;
                if x < r_part2 then
                begin
                  quo := quo or (u shl i);
                  r_part2 := r_part2 - x
                end
           end
      end
    end
  end
  else WriteLn('Error: UInt256_arithmetic: Can''t divide by zero.')
end;

// kahden UInt256:n osamäärä UInt256:na

operator / (n : UInt256; d : UInt256) quo : UInt256;
const
  test : UInt256 = (0, 0, 1, 0);
var
  x, y : UInt256;
  i : Byte;
  j : Byte = 0;
begin
  if d <> 0 then
  begin
    if d < test then quo := n / ToOWord(d)
    else
    begin
         quo := 0;
         x := clone(d);
         while x < n do
         begin
              x := x shl 1;
              j := j + 1;
         end;
         if x = n then quo := test shr (128 - j)
         else
         begin
              y := clone(n);
              for i := j - 1 downto 0 do
              begin
                   x := x shr 1;
                   if x < y then
                   begin
                     quo := quo or (test shr (128 - j));
                     y := y - x
                   end
              end
         end
    end
  end
  else WriteLn('Error: UInt256_arithmetic: Can''t divide by zero.')
end;

// jakojäännös

// jaettaessa 64 bittisellä etumerkittömällä luvulla

operator mod (n : UInt256; d : QWord) rem : QWord;
var
  part : OWord;
begin
  if d <> 0 then
  begin
    part := ToOWord(n[2], n[3] mod d);
    part := ToOWord(n[1], part mod d);
    part := ToOWord(n[0], part mod d);
    rem := part mod d
  end
  else WriteLn('Error: UInt256_arithmetic: Can''t divide by zero.')
end;

// jaettaessa 128 bittisellä etumerkittömällä luvulla

operator mod (n : UInt256; d : OWord) rem : OWord;
var
  x, dd, dFix : UInt256;
  part : OWord;
begin
  if d <> 0 then
  begin
    if d.b = 0 then rem := n mod d.a
    else
    begin
      part := ToOWordShl(n, 2);
      part := part mod d;
      x := ToUInt256(n[0], n[1], part);
      dFix := d;
      dd := shl2(dFix);
      while x >= dFix do
      begin
           dd := dd shr 1;            // siirretään ensin, koska suurimman jään-
           if dd <= x then x := x - dd// nös on jo otettu.
      end;
      rem := x  // kaksi vähiten merkitsevää "numeroa"
    end
  end
  else WriteLn('Error: UInt256_arithmetic: Can''t divide by zero.')
end;

// jaettaessa UInt256:lla, jakojäännös myös esitettynä UInt256:na

operator mod (n : UInt256; d : UInt256) rem : UInt256;
var
  dd : UInt256;
  i : Byte = 0;
begin
  if d <> 0 then
  begin
    if (d[3] = 0) and (d[2] = 0) then rem := n mod ToOWord(d)
    else
    begin
      dd := clone(d);
      while dd < n do
      begin
           dd := dd shl 1;
           i := i + 1
      end;
      if dd = n then rem := 0
      else
      begin
        rem := n;
        while rem >= d do
        begin
             dd := dd shr 1;
             if dd <= rem then rem := rem - dd
        end
      end
    end
  end
  else WriteLn('Error: UInt256_arithmetic: Can''t divide by zero.')
end;

// input/output toimintoja

function IntToStr(Value : UInt256) : String;
const
  d : QWord = 10;
var
  n : UInt256;
begin
  n := clone(Value);
  IntToStr := '';
  repeat
    IntToStr := IntToStr(n mod d) + IntToStr;
    n := n / d
  until n = 0;
end;

function StrToUInt256(Value : String) : UInt256;
const
  d : QWord = 10;
var
  i : Integer = 1;
begin
  StrToUInt256 := 0;
  if Value <> '' then
  begin
    while (IsNumber(Value[i])) do
    begin
         StrToUInt256 := d * StrToUInt256 + (ord(Value[i]) - ord('0'));
         i := i + 1
    end
  end
end;

procedure Print(n : UInt256);
begin
  Write(IntToStr(n));
end;

procedure PrintLn(n : UInt256);
begin
  WriteLn(IntToStr(n));
end;

end.
