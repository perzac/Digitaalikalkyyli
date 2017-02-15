unit UInt512_arithmetic;

{$mode objfpc}{$H+}

interface

uses
  OWord_arithmetic, Arithmetic_assist, Character, UInt256_arithmetic;

Type
  UInt512 = Array [0..7] of QWord;

operator := (n : UInt256) m : UInt512; overload;
operator := (n : OWord) m : UInt512; overload;
operator := (n : QWord) m : UInt512; overload;
operator := (n : Int64) m : UInt512; overload;
operator := (n : DWord) m : UInt512; overload;
operator := (n : LongInt) m : UInt512; overload;
operator := (n : Word) m : UInt512; overload;
operator := (n : SmallInt) m : UInt512; overload;
operator := (n : Byte) m : UInt512; overload;
operator := (n : ShortInt) m : UInt512; overload;

operator := (n : UInt512) m : UInt256; overload;
operator := (n : UInt512) m : OWord; overload;
operator := (n : UInt512) m : QWord; overload;

function ToUInt512(n : UInt256) : UInt512; overload;
function ToUInt512(n : OWord) : UInt512; overload;
function ToUInt512(n : QWord) : UInt512; overload;
function ToUInt512(n : Int64) : UInt512; overload;
function ToUInt512(n : DWord) : UInt512; overload;
function ToUInt512(n : LongInt) : UInt512; overload;
function ToUInt512(n : Word) : UInt512; overload;
function ToUInt512(n : SmallInt) : UInt512; overload;
function ToUInt512(n : Byte) : UInt512; overload;
function ToUInt512(n : ShortInt) : UInt512; overload;

function clone(n : UInt512) : UInt512;

function ToUInt256(n : UInt512) : UInt256; overload;
function ToUInt256Shl(n : UInt512; i : Integer) : UInt256; overload;
function ToOWord(n : UInt512) : OWord; overload;
function ToOWordShl(n : UInt512; i : Integer) : OWord; overload;
function ToQWord(n : UInt512) : QWord; overload;

operator = (n : UInt512; m : UInt512) eq : boolean;
operator <> (n : UInt512; m : UInt512) neq : boolean;
operator < (n : UInt512; m : UInt512) less : boolean;
operator <= (n : UInt512; m : UInt512) leq : boolean;
operator > (n : UInt512; m : UInt512) greater : boolean;
operator >= (n : UInt512; m : UInt512) geq : boolean;

function ShLeft(n : UInt512; m : Integer) : UInt512;
function ShRight(n : UInt512; m : Integer) : UInt512;

operator shl (n : UInt512; m : Integer) shifted : UInt512; overload;
operator shr (n : UInt512; m : Integer) shifted : UInt512; overload;
operator or (n : UInt512; m : UInt512) ored : UInt512; overload;
operator and (n : UInt512; m : UInt512) anded : UInt512; overload;
operator not (n : UInt512) noted : UInt512; overload;

operator + (n : Uint512; m : Uint512) sum : Uint512; overload;
operator + (n : Uint512; m : Uint256) sum : Uint512; overload;
operator + (n : Uint256; m : Uint512) sum : Uint512; overload;
operator + (n : Uint512; m : OWord) sum : Uint512; overload;
operator + (n : OWord; m : Uint512) sum : Uint512; overload;
operator + (n : Uint512; m : QWord) sum : Uint512; overload;
operator + (n : QWord; m : Uint512) sum : Uint512; overload;
operator + (n : Uint512; m : Int64) sum : Uint512; overload;
operator + (n : Int64; m : Uint512) sum : Uint512; overload;
operator + (n : Uint512; m : DWord) sum : Uint512; overload;
operator + (n : DWord; m : Uint512) sum : Uint512; overload;
operator + (n : Uint512; m : LongInt) sum : Uint512; overload;
operator + (n : LongInt; m : Uint512) sum : Uint512; overload;
operator + (n : Uint512; m : Word) sum : Uint512; overload;
operator + (n : Word; m : Uint512) sum : Uint512; overload;
operator + (n : Uint512; m : SmallInt) sum : Uint512; overload;
operator + (n : SmallInt; m : Uint512) sum : Uint512; overload;
operator + (n : Uint512; m : Byte) sum : Uint512; overload;
operator + (n : Byte; m : Uint512) sum : Uint512; overload;
operator + (n : Uint512; m : ShortInt) sum : Uint512; overload;
operator + (n : ShortInt; m : Uint512) sum : Uint512; overload;

operator - (n : UInt512; m : UInt512) dif : UInt512; overload;
operator - (n : UInt512; m : UInt256) dif : UInt512; overload;
operator - (n : UInt512; m : OWord) dif : UInt512; overload;
operator - (n : UInt512; m : QWord) dif : UInt512; overload;
operator - (n : UInt512; m : DWord) dif : UInt512; overload;
operator - (n : UInt512; m : Word) dif : UInt512; overload;
operator - (n : UInt512; m : Byte) dif : UInt512; overload;

operator * (n : QWord; m : UInt512) prod : UInt512; overload;
operator * (n : UInt512; m : QWord) prod : UInt512; overload;
operator * (n : UInt512; m : UInt512) prod : UInt512; overload;

operator / (n : UInt512; d : QWord) quo : UInt512; overload;
operator / (n : UInt512; d : UInt512) quo : UInt512; overload;

operator mod (n : UInt512; d : QWord) rem : QWord; overload;
operator mod (n : UInt512; d : UInt512) rem : UInt512; overload;

function IntToStr(Value : UInt512) : String; overload;

function StrToUInt512(Value : String) : UInt512;

procedure Print(n : UInt512); overload;
procedure PrintLn(n : UInt512); overload;

implementation

// sijoitukset

operator := (n : UInt256) m : UInt512;
var
  i : Byte;
begin
  for i := 0 to 3 do m[i] := n[i];
  for i := 4 to 7 do m[i] := 0
end;

operator := (n : OWord) m : UInt512;
var
  i : Byte;
begin
  m[0] := n.a;
  m[1] := n.b;
  for i := 2 to 7 do m[i] := 0
end;

operator := (n : QWord) m : UInt512;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 7 do m[i] := 0
end;

operator := (n : Int64) m : UInt512;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 7 do m[i] := 0
end;

operator := (n : DWord) m : UInt512;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 7 do m[i] := 0
end;

operator := (n : LongInt) m : UInt512;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 7 do m[i] := 0
end;

operator := (n : Word) m : UInt512;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 7 do m[i] := 0
end;

operator := (n : SmallInt) m : UInt512;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 7 do m[i] := 0
end;

operator := (n : Byte) m : UInt512;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 7 do m[i] := 0
end;

operator := (n : ShortInt) m : UInt512;
var
  i : Byte;
begin
  m[0] := n;
  for i := 1 to 7 do m[i] := 0
end;

// "alaspäin"

operator := (n : UInt512) m : UInt256;
var
  i : Byte;
begin
  for i := 0 to 3 do m[i] := n[i]
end;

operator := (n : UInt512) m : OWord;
begin
  m.a := n[0];
  m.b := n[1]
end;

operator := (n : UInt512) m : QWord;
begin
  m := n[0]
end;

// Lyhyemmät esitykset 512 bittisiksi

function ToUInt512(n : UInt256) : UInt512;
begin
  ToUInt512 := n
end;

function ToUInt512(n : OWord) : UInt512;
begin
  ToUInt512 := n
end;

function ToUInt512(n : QWord) : UInt512;
begin
  ToUInt512 := n
end;

function ToUInt512(n : Int64) : UInt512;
begin
  ToUInt512 := n
end;

function ToUInt512(n : DWord) : UInt512;
begin
  ToUInt512 := n
end;

function ToUInt512(n : LongInt) : UInt512;
begin
  ToUInt512 := n
end;

function ToUInt512(n : Word) : UInt512;
begin
  ToUInt512 := n
end;

function ToUInt512(n : SmallInt) : UInt512;
begin
  ToUInt512 := n
end;

function ToUInt512(n : Byte) : UInt512;
begin
  ToUInt512 := n
end;

function ToUInt512(n : ShortInt) : UInt512;
begin
  ToUInt512 := n
end;

// kloonaus

function clone(n : UInt512) : UInt512;
var
  i : Byte;
begin
  for i:= 0 to 7 do clone[i] := n[i]
end;

// 512 bittinen esitys lyhyemmäksi

function ToUInt256(n : UInt512) : UInt256;
begin
  ToUInt256 := n
end;

function ToUInt256Shl(n : UInt512; i : Integer) : UInt256;
var
  j : Integer;
begin
  for j := 0 to i - 1 do TOUInt256shl[j] := 0;
  for j := i to i + 3 do
  begin
    if (j >= 0) and (j < 8) then ToUInt256shl[j] := n[j]
  end;
  for j := i + 4 to 7 do TOUInt256shl[j] := 0
end;

function ToOWord(n : UInt512) : OWord;
begin
  ToOWord := n
end;

function ToOWordShl(n : UInt512; i : Integer) : OWord;
begin
  case i of
       -1 :
         begin
              ToOWordShl.a := 0;
              ToOWordShl.b := n[0]
         end;
       0..6 :
         begin
              ToOWordShl.a := n[i];
              ToOWordShl.b := n[i + 1]
         end;
       7 :
         begin
              ToOWordShl.a := n[7];
              ToOWordShl.b := 0
         end
       else ToOWordShl := 0
  end
end;

function ToQWord(n : UInt512) : QWord;
begin
  ToQWord := n[0]
end;

// vertailuoperaatiot

operator = (n : UInt512; m : UInt512) eq : boolean;
var
  i : Byte;
begin
  eq := n[0] = m[0];
  for i := 1 to 7 do
  begin
    if eq then eq := n[i] = m[i]
    else break
  end
end;

operator <> (n : UInt512; m : UInt512) neq : boolean;
begin
  neq := not(n = m)
end;

operator < (n : UInt512; m : UInt512) less : boolean;
var
  i : Byte;
begin
  less := n[7] < m[7];
  for i := 7 downto 1 do
  begin
    if n[i] = m[i] then less := n[i - 1] < m[i - 1]
    else break
  end
end;

operator <= (n : UInt512; m : UInt512) leq : boolean;
var
  i : Byte;
begin
  leq := n[7] <= m[7];
  for i := 7 downto 1 do
  begin
    if n[i] = m[i] then leq := n[i - 1] <= m[i - 1]
    else break
  end
end;

operator > (n : UInt512; m : UInt512) greater : boolean;
var
  i : Byte;
begin
  greater := n[7] > m[7];
  for i := 7 downto 1 do
  begin
    if n[i] = m[i] then greater := n[i - 1] > m[i - 1]
    else break
  end
end;

operator >= (n : UInt512; m : UInt512) geq : boolean;
var
  i : Byte;
begin
  geq := n[7] >= m[7];
  for i := 6 downto 1 do
  begin
    if n[i] = m[i] then geq := n[i - 1] >= m[i - 1]
    else break
  end
end;

// siirrot "numeroittain"

// vasemmalle

function ShLeft(n : UInt512; m : Integer) : UInt512;
var
  i: Integer;
begin
  if m > 7 then ShLeft := 0
  else if m < 0 then ShLeft := ShRight(n, -m)
  else
  begin
    for i := 0 to m - 1 do ShLeft[i] := 0;
    for i := m to 7 do ShLeft[i] := n[i - m]
  end;
end;

function ShRight(n : UInt512; m : Integer) : UInt512;
var
  i: Integer;
begin
  if m > 7 then ShRight := 0
  else if m < 0 then ShRight := ShLeft(n, -m)
  else
  begin
    for i := 7 downto 8 - m  do ShRight[i] := 0;
    for i := 7 - m to 0 do ShRight[i] := n[i + m]
  end;
end;

// loogiset operaatiot

operator shl (n: UInt512; m : Integer) shifted : UInt512;
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
         1..7 : shifted := ShLeft(n, q);
         else shifted := 0
    end;
    if r <> 0 then
    begin
      for i := 7 downto 1 do shifted[i] := (shifted[i] shl r) or (shifted[i - 1] shr (64 - r));
      shifted[0] := shifted[0] shl r
    end
  end
end;

operator shr (n: UInt512; m : Integer) shifted : UInt512;
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
         1..7 : shifted := ShRight(n, q);
         else shifted := 0
    end;
    if r <> 0 then
    begin
      for i := 0 to 6 do shifted[i] := (shifted[i] shr r) or (shifted[i + 1] shl (64 - r));
      shifted[7] := shifted[7] shr r
    end
  end
end;

operator or (n: UInt512; m : UInt512) ored : UInt512;
var
  i : Byte;
begin
  for i := 0 to 7 do ored[i] := n[i] or m[i]
end;

operator and (n: UInt512; m : UInt512) anded : UInt512;
var
  i : Byte;
begin
  for i := 0 to 7 do anded[i] := n[i] and m[i]
end;

operator not (n : UInt512) noted : UInt512;
var
  i : Byte;
begin
  for i := 0 to 7 do noted[i] := not n[i]
end;

// laskutoimitukset

// yhteenlasku

operator + (n : Uint512; m : Uint512) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  for i:= 0 to 6 do sum[i] := AddWithCarryQWord(n[i], m[i], @c);
  sum[7] := n[7] + m[7] + c
end;

operator + (n : Uint512; m : Uint256) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  for i:= 0 to 3 do sum[i] := AddWithCarryQWord(n[i], m[i], @c);
  for i:= 4 to 6 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[7] := n[7] + c
end;

operator + (n : Uint256; m : Uint512) sum : Uint512;
begin
  sum := m + n;
end;

operator + (n : Uint512; m : OWord) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m.a, @c);
  sum[1] := AddWithCarryQWord(n[1], m.b, @c);
  for i:= 2 to 6 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[7] := n[7] + c
end;

operator + (n : OWord; m : Uint512) sum : Uint512;
begin
  sum := m + n;
end;

operator + (n : Uint512; m : QWord) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 6 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[7] := n[7] + c
end;

operator + (n : QWord; m : Uint512) sum : Uint512;
begin
  sum := m + n;
end;

operator + (n : Uint512; m : Int64) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 6 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[7] := n[7] + c
end;

operator + (n : Int64; m : Uint512) sum : Uint512;
begin
  sum := m + n;
end;

operator + (n : Uint512; m : DWord) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 6 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[7] := n[7] + c
end;

operator + (n : DWord; m : Uint512) sum : Uint512;
begin
  sum := m + n;
end;

operator + (n : Uint512; m : LongInt) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 6 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[7] := n[7] + c
end;

operator + (n : LongInt; m : Uint512) sum : Uint512;
begin
  sum := m + n;
end;

operator + (n : Uint512; m : Word) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 6 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[7] := n[7] + c
end;

operator + (n : Word; m : Uint512) sum : Uint512;
begin
  sum := m + n;
end;

operator + (n : Uint512; m : SmallInt) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 6 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[7] := n[7] + c
end;

operator + (n : SmallInt; m : Uint512) sum : Uint512;
begin
  sum := m + n;
end;

operator + (n : Uint512; m : Byte) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 6 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[7] := n[7] + c
end;

operator + (n : Byte; m : Uint512) sum : Uint512;
begin
  sum := m + n;
end;

operator + (n : Uint512; m : ShortInt) sum : Uint512;
var
  i : Byte;
  c : Byte = 0;
begin
  sum[0] := AddWithCarryQWord(n[0], m, @c);
  for i:= 1 to 6 do sum[i] := AddWithCarryQWord(n[i], 0, @c);
  sum[7] := n[7] + c
end;

operator + (n : ShortInt; m : Uint512) sum : Uint512;
begin
  sum := m + n;
end;

// vähennyslasku

operator - (n : UInt512; m : UInt512) dif : UInt512;
var
  i : Byte;
  c : Byte = 0;
begin
  for i := 0 to 6 do dif[i] := DifWithCarryQWord(n[i], m[i], @c);
  dif[7] := n[7] - m[7] - c
end;

operator - (n : UInt512; m : UInt256) dif : UInt512;
var
  i : Byte;
  c : Byte = 0;
begin
  for i := 0 to 3 do dif[i] := DifWithCarryQWord(n[i], m[i], @c);
  for i := 4 to 6 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[7] := n[7] - c
end;

operator - (n : UInt512; m : OWord) dif : UInt512;
var
  i : Byte;
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m.a, @c);
  dif[1] := DifWithCarryQWord(n[1], m.b, @c);
  for i := 2 to 6 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[7] := n[7] - c
end;

operator - (n : UInt512; m : QWord) dif : UInt512;
var
  i : Byte;
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  for i := 1 to 6 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[7] := n[7] - c
end;

operator - (n : UInt512; m : DWord) dif : UInt512;
var
  i : Byte;
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  for i := 1 to 6 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[7] := n[7] - c
end;

operator - (n : UInt512; m : Word) dif : UInt512;
var
  i : Byte;
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  for i := 1 to 6 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[7] := n[7] - c
end;

operator - (n : UInt512; m : Byte) dif : UInt512;
var
  i : Byte;
  c : Byte = 0;
begin
  dif[0] := DifWithCarryQWord(n[0], m, @c);
  for i := 1 to 6 do dif[i] := DifWithCarryQWord(n[i], 0, @c);
  dif[7] := n[7] - c
end;

// kertolasku

operator * (n : QWord; m : UInt512) prod : UInt512;
var
  i : Byte;
begin
  prod := 0;
  if n <> 0 then
  begin
    prod := Mul128(n, m[0]);
    for i := 1 to 6 do prod := prod + ShLeft(ToUInt512(Mul128(n, m[i])), i);
    prod[7] := prod[7] + n * m[7]
  end
end;

operator * (n : UInt512; m : QWord) prod : UInt512;
begin
  prod := m * n
end;

operator * (n : UInt512; m : UInt512) prod : UInt512;
var
  i : Byte;
begin
  prod := 0;
  if (n <> 0) then
  begin
    prod := n[0] * m;
    for i:= 1 to 6 do prod := prod + ShLeft(n[i] * m, i);
    prod[7] := prod[7] + n[7] * m[0];
  end;
end;

// jakolasku

// jakaja 64 bittinen etumerkitön luku

operator / (n : UInt512; d : QWord) quo : UInt512;
var
  part : OWord;
  i : Byte;
begin
  if d <> 0 then
  begin
    quo[7] := n[7] div d;
    part.b := n[7] mod d;
    part.a := n[6];
    for i := 6 downto 1 do
    begin
      quo[i] := (part / d).a;
      part.b := part mod d;
      part.a := n[i - 1];
    end;
    quo[0] := (part / d).a
  end
  else WriteLn('Error: UInt512_arithmetic: Can''t divide by zero.')
end;

// kahden UInt512:n osamäärä UInt512:na

operator / (n : UInt512; d : UInt512) quo : UInt512;
const
  u : UInt512 = (1, 0, 0, 0, 0, 0, 0, 0);
  l : Integer = 511;
var
  i : Integer = 7;
  j : Integer = 63;
  v, k : Integer;
  x, y : UInt512;
begin
  if d <> 0 then
  begin
    quo := 0;
    if d < n then
    begin
      while (d[i] = 0) do i := i - 1;
      if i = 0 then quo := n / d[0]
      else
      begin
      	   while (d[i] shr j) = 0 do j := j - 1;
           v := l - i * 64 - j;
           y := clone(d) shl v;
           x := clone(n);
           for k := v  downto 0 do
           begin
             if y <= x then
             begin
               x := x - y;
               quo := quo or (u shl k);
               if x < d then Break
             end;
             y := y shr 1
           end
      end
    end
    else if d = n then quo := 1
  end
  else WriteLn('Error: UInt512_arithmetic: Can''t divide by zero.')
end;

// jakojäännös

// jaettaessa 64 bittisellä etumerkittömällä luvulla

operator mod (n : UInt512; d : QWord) rem : QWord;
var
  part : OWord;
  i : Byte;
begin
  if d <> 0 then
  begin
    part.b := n[7] mod d;
    part.a := n[6];
    for i := 6 downto 1 do
    begin
      part.b := part mod d;
      part.a := n[i - 1];
    end;
    rem := part mod d;
  end
  else WriteLn('Error: UInt512_arithmetic: Can''t divide by zero.')
end;

// jaettaessa UInt512:lla, jakokäännös myös esitettynä UInt512:na

operator mod (n : UInt512; d : UInt512) rem : UInt512;
var
  x : UInt512;
  i : Integer = 0;
begin
  if d <> 0 then
  begin
    rem := clone(d);
    while (rem < n) and (rem[7] = 0) do
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
  else WriteLn('Error: UInt512_arithmetic: Can''t divide by zero.')
end;

// input/output toimintoja

function IntToStr(Value : UInt512) : String;
const
  d : QWord = 10;
var
  n : UInt512;
begin
  n := clone(Value);
  IntToStr := '';
  repeat
    IntToStr := IntToStr(n mod d) + IntToStr;
    n := n / d
  until n = 0;
end;

function StrToUInt512(Value : String) : UInt512;
const
  d : QWord = 10;
var
  i : Integer = 1;
begin
  StrToUInt512 := 0;
  if Value <> '' then
  begin
    while (IsNumber(Value[i])) do
    begin
         StrToUInt512 := d * StrToUInt512 + (ord(Value[i]) - ord('0'));
         i := i + 1
    end
  end
end;

procedure Print(n : UInt512);
begin
  Write(IntToStr(n));
end;

procedure PrintLn(n : UInt512);
begin
  WriteLn(IntToStr(n));
end;

end.
