unit OWord_arithmetic;

{$mode objfpc}{$H+}

interface

uses
  SysUtils, Character;

type
  OWord = record
    a : QWord;
    b : QWord;
  end;

  POWord = ^OWord;

function ToOWord(n : QWord) : OWord; overload;
function ToOWord(n : Int64) : OWord; overload;
function ToOWord(n : Longword) : OWord; overload;
function ToOWord(n : Longint) : OWord; overload;
function ToOWord(n : Word) : OWord; overload;
function ToOWord(n : Smallint) : OWord; overload;
function ToOWord(n : byte) : OWord; overload;
function ToOWord(n : Shortint) : OWord; overload;

function ToOWord(n : QWord; m : QWord) : OWord; overload;

function ToQWord(n : OWord) : QWord; overload;

function hi(n : OWord) : QWord; overload;
function lo(n : OWord) : QWord; overload;

operator := (n : QWord) m : OWord; overload;
operator := (n : Int64) m : OWord; overload;
operator := (n : Longword) m : OWord; overload;
operator := (n : Longint) m : OWord; overload;
operator := (n : Word) m : OWord; overload;
operator := (n : Smallint) m : OWord; overload;
operator := (n : byte) m : OWord; overload;
operator := (n : Shortint) m : OWord; overload;

function clone(n : OWord) : OWord;

operator := (n : OWord) m : QWord; overload;

operator = (n : OWord; m : OWord) eq : boolean; overload;
operator = (n : OWord; m : QWord) eq : boolean; overload;
operator = (n : QWord; m : OWord) eq : boolean; overload;
operator <> (n : OWord; m : OWord) neq : boolean; overload;
operator <> (n : OWord; m : QWord) neq : boolean; overload;
operator <> (n : QWord; m : OWord) neq : boolean; overload;
operator < (n : OWord; m : OWord) less : boolean; overload;
operator < (n : OWord; m : QWord) less : boolean; overload;
operator < (n : QWord; m : OWord) less : boolean; overload;
operator <= (n : OWord; m : OWord) leq : boolean; overload;
operator <= (n : OWord; m : QWord) leq : boolean; overload;
operator <= (n : QWord; m : OWord) leq : boolean; overload;
operator > (n : OWord; m : OWord) greater : boolean; overload;
operator > (n : OWord; m : QWord) greater : boolean; overload;
operator > (n : QWord; m : OWord) greater : boolean; overload;
operator >= (n : OWord; m : OWord) geq : boolean; overload;
operator >= (n : OWord; m : QWord) geq : boolean; overload;
operator >= (n : QWord; m : OWord) geq : boolean; overload;

operator shl (n : OWord; m : Integer) shifted : OWord;
operator shr (n : OWord; m : Integer) shifted : OWord;
operator or (n : OWord; m : OWord) ored : OWord;
operator and (n : OWord; m : OWord) anded : OWord;

operator + (n : OWord; m : OWord) sum : OWord; overload;
operator + (n : QWord; m : OWord) sum : OWord; overload;
operator + (n : OWord; m : QWord) sum : OWord; overload;
operator + (n : Int64; m : OWord) sum : OWord; overload;
operator + (n : OWord; m : Int64) sum : OWord; overload;
operator + (n : DWord; m : OWord) sum : OWord; overload;
operator + (n : OWord; m : DWord) sum : OWord; overload;
operator + (n : Longint; m : OWord) sum : OWord; overload;
operator + (n : OWord; m : Longint) sum : OWord; overload;
operator + (n : Word; m : OWord) sum : OWord; overload;
operator + (n : OWord; m : Word) sum : OWord; overload;
operator + (n : Smallint; m : OWord) sum : OWord; overload;
operator + (n : OWord; m : Smallint) sum : OWord; overload;
operator + (n : Byte; m : OWord) sum : OWord; overload;
operator + (n : OWord; m : Byte) sum : OWord; overload;
operator + (n : Shortint; m : OWord) sum : OWord; overload;
operator + (n : OWord; m : Shortint) sum : OWord; overload;

operator - (n : OWord; m : OWord) dif : OWord; overload;

operator * (n : OWord; m : OWord) prod : OWord; overload;
operator * (n : QWord; m : OWord) prod : OWord; overload;
operator * (n : OWord; m : QWord) prod : OWord; overload;
operator * (n : DWord; m : OWord) prod : OWord; overload;
operator * (n : OWord; m : DWord) prod : OWord; overload;
operator * (n : Word; m : OWord) prod : OWord; overload;
operator * (n : OWord; m : Word) prod : OWord; overload;
operator * (n : Byte; m : OWord) prod : OWord; overload;
operator * (n : OWord; m : Byte) prod : OWord; overload;

function Mul128(n : QWord; m : QWord) : OWord; overload;
function Mul128(n : QWord; m : DWord) : OWord; overload;
function Mul128(n : DWord; m : QWord) : OWord; overload;
function Mul128(n : DWord; m : DWord) : OWord; overload;

operator / (n : OWord; d : OWord) quo : OWord; overload;

operator / (n : OWord; d : DWord) quo : OWord; overload;
operator / (n : OWord; d : QWord) quo : OWord; overload;

operator mod (n : OWord; d : DWord) rem : DWord; overload;
operator mod (n : OWord; d : QWord) rem : QWord; overload;
operator mod (n : OWord; d : OWord) rem : OWord; overload;

function sqrt(n : OWord) : QWord;

function IntToHex(Value : OWord) : String; overload; overload;
function IntToHex(Value : OWord; Digits : Integer) : String; overload;

function IntToStr(Value : OWord) : String; overload;

function StrToOWord(Value : String) : OWord;

procedure Print(n : OWord); overload;
Procedure PrintLn(n : OWord); overload;


implementation

function ToOWord(n : QWord) : OWord;
begin
  ToOWord.a := n;
  ToOWord.b := 0;
end;

function ToOWord(n : Int64) : OWord;
begin
  ToOWord.a := n;
  ToOWord.b := 0
end;

function ToOWord(n : Longword) : OWord;
begin
  ToOWord.a := n;
  ToOWord.b := 0
end;

function ToOWord(n : Longint) : OWord;
begin
  ToOWord.a := n;
  ToOWord.b := 0
end;

function ToOWord(n : Word) : OWord;
begin
  ToOWord.a := n;
  ToOWord.b := 0
end;

function ToOWord(n : Smallint) : OWord;
begin
  ToOWord.a := n;
  ToOWord.b := 0
end;

function ToOWord(n : byte) : OWord;
begin
  ToOWord.a := n;
  ToOWord.b := 0
end;

function ToOWord(n : Shortint) : OWord;
begin
  ToOWord.a := n;
  ToOWord.b := 0;
end;

function ToOWord(n : QWord; m : QWord) : OWord;
begin
  ToOWord.a := n;
  ToOWord.b := m;
end;

// lyhyemmäksi esitykseksi

function ToQWord(n : OWord) : QWord;
begin
  ToQWord := n.a;
end;

function hi(n : OWord) : QWord;
begin
  hi := n.b;
end;

function lo(n : OWord) : QWord;
begin
  lo := n.a;
end;

//---------------------------------

operator := (n : QWord) m : OWord;
begin
  m := ToOWord(n);
end;

operator := (n : Int64) m : OWord;
begin
  m := ToOWord(n);
end;

operator := (n : Longword) m : OWord;
begin
  m := ToOWord(n);
end;

operator := (n : Longint) m : OWord;
begin
  m := ToOWord(n);
end;

operator := (n : Word) m : OWord;
begin
  m := ToOWord(n);
end;

operator := (n : Smallint) m : OWord;
begin
  m := ToOWord(n);
end;

operator := (n : byte) m : OWord;
begin
  m := ToOWord(n);
end;

operator := (n : Shortint) m : OWord;
begin
  m := ToOWord(n);
end;

// --------------------------

function clone(n : OWord) : OWord;
begin
  clone.a := n.a;
  clone.b := n.b;
end;

// sijoitus alaspäin

operator := (n : OWord) m : QWord;
begin
  m := ToQWord(n);
end;

// Vertailuoperaatiot

operator = (n : OWord; m : OWord) eq : boolean;
begin
  eq := (n.a = m.a) and (n.b = m.b)
end;

operator = (n : OWord; m : QWord) eq : boolean;
begin
  eq := (n.a = m) and (n.b = 0)
end;

operator = (n : QWord; m : OWord) eq : boolean;
begin
  eq := m = n
end;

operator <> (n : OWord; m : OWord) neq : boolean;
begin
  neq := not(n = m);
end;

operator <> (n : OWord; m : QWord) neq : boolean;
begin
  neq := not(n = m);
end;

operator <> (n : QWord; m : OWord) neq : boolean;
begin
  neq := not(n = m);
end;

operator < (n : OWord; m : OWord) less : boolean;
begin
  less := n.b < m.b;
  if (n.b = m.b) then less := n.a < m.a;
end;

operator < (n : OWord; m : QWord) less : boolean;
begin
  less := (n.b = 0) and (n.a < m)
end;

operator < (n : QWord; m : OWord) less : boolean;
begin
  less := (n < m.a) or (m.b <> 0)
end;

operator <= (n : OWord; m : OWord) leq : boolean;
begin
  leq := n.b < m.b;
  if (n.b = m.b) then leq := n.a <= m.a;
end;

operator <= (n : OWord; m : QWord) leq : boolean;
begin
  leq := (n.b = 0) and (n.a <= m)
end;

operator <= (n : QWord; m : OWord) leq : boolean;
begin
  leq := (n <= m.a) or (m <> 0)
end;

operator > (n : OWord; m : OWord) greater : boolean;
begin
  greater := n.b > m.b;
  if (n.b = m.b) then greater := n.a > m.a;
end;

operator > (n : OWord; m : QWord) greater : boolean;
begin
  greater := (n.b <> 0) or (n.a > m)
end;

operator > (n : QWord; m : OWord) greater : boolean;
begin
  greater := (n > m.a) and (m.b = 0)
end;

operator >= (n : OWord; m : OWord) geq : boolean;
begin
  geq := n.b > m.b;
  if (n.b = m.b) then geq := n.a >= m.a;
end;

operator >= (n : OWord; m : QWord) geq : boolean;
begin
  geq := (n.b <> 0) or (n.a >= m)
end;

operator >= (n : QWord; m : OWord) geq : boolean;
begin
  geq := (n >= m.a) and (m.b = 0)
end;

// loogiset operaatiot

operator shl (n : OWord; m : Integer) shifted : OWord;
begin
  if m = 0 then shifted := clone(n)
  else if m = 64 then
  begin
    shifted.a := 0;
    shifted.b := n.a
  end
  else if m > 64 then
  begin
    shifted.a := 0;
    shifted.b := n.a shl (m - 64)
  end
  else
  begin
       shifted.b := (n.b shl m) or (n.a shr (64 - m));
       shifted.a := n.a shl m
  end;
end;

operator shr (n : OWord; m : Integer) shifted : OWord;
begin
  if m = 0 then shifted := clone(n)
  else if m = 64 then
  begin
    shifted.a := n.b;
    shifted.b := 0
  end
  else if m > 64 then
  begin
    shifted.a := n.b shr (m - 64);
    shifted.b := 0
  end
  else
  begin
       shifted.a := (n.a shr m) or (n.b shl (64 - m));
       shifted.b := n.b shr m
  end;
end;

operator or (n : OWord; m : OWord) ored : OWord;
begin
  ored.a := n.a or m.a;
  ored.b := n.b or m.b
end;

operator and (n : OWord; m : OWord) anded : OWord;
begin
  anded.a := n.a and m.a;
  anded.b := n.b and m.b
end;

// laskutoimitukset

// summa

operator + (n : OWord; m : OWord) sum : OWord;
var
  c : byte = 0;
begin
  sum.a := n.a + m.a;
  if sum.a < n.a then c := 1;
  sum.b := n.b + m.b + c;
end;

operator + (n : QWord; m : OWord) sum : OWord;
begin
  sum.b := m.b;
  sum.a := n + m.a;
  if sum.a < n then sum.b := sum.b + 1;
end;

operator + (n : OWord; m : QWord) sum : OWord;
begin
  sum := m + n;
end;

operator + (n : Int64; m : OWord) sum : OWord;
begin
  sum.b := m.b;
  sum.a := n + m.a;
  if sum.a < n then sum.b := sum.b + 1;
end;

operator + (n : OWord; m : Int64) sum : OWord;
begin
  sum := m + n;
end;

operator + (n : DWord; m : OWord) sum : OWord;
begin
  sum.b := m.b;
  sum.a := n + m.a;
  if sum.a < n then sum.b := sum.b + 1;
end;

operator + (n : OWord; m : DWord) sum : OWord;
begin
  sum := m + n;
end;

operator + (n : Longint; m : OWord) sum : OWord;
begin
  sum.b := m.b;
  sum.a := n + m.a;
  if sum.a < n then sum.b := sum.b + 1;
end;

operator + (n : OWord; m : Longint) sum : OWord;
begin
  sum := m + n;
end;

operator + (n : Word; m : OWord) sum : OWord;
begin
  sum.b := m.b;
  sum.a := n + m.a;
  if sum.a < n then sum.b := sum.b + 1;
end;

operator + (n : OWord; m : Word) sum : OWord;
begin
  sum := m + n;
end;

operator + (n : Smallint; m : OWord) sum : OWord;
begin
  sum.b := m.b;
  sum.a := n + m.a;
  if sum.a < n then sum.b := sum.b + 1;
end;

operator + (n : OWord; m : Smallint) sum : OWord;
begin
  sum := m + n;
end;

operator + (n : Byte; m : OWord) sum : OWord;
begin
  sum.b := m.b;
  sum.a := n + m.a;
  if sum.a < n then sum.b := sum.b + 1;
end;

operator + (n : OWord; m : Byte) sum : OWord;
begin
  sum := m + n;
end;

operator + (n : Shortint; m : OWord) sum : OWord;
begin
  sum.b := m.b;
  sum.a := n + m.a;
  if sum.a < n then sum.b := sum.b + 1;
end;

operator + (n : OWord; m : Shortint) sum : OWord;
begin
  sum := m + n;
end;

// erotus

operator - (n : OWord; m : OWord) dif : OWord;
var
  c : byte = 0;
begin
  if n = m then dif := 0
  else if n < m then dif := m - n
  else
  begin
    dif.a := n.a - m.a;
    if dif.a > n.a then c := 1;
    dif.b := n.b - m.b - c
  end;
end;

// tulo

operator * (n : OWord; m : OWord) prod : OWord;
var
  x : OWord;
  y : OWord;
  b, c, d : QWord;
begin
  prod := 0;
  if n.a <> 0 then
  begin
    prod.a := QWord(lo(n.a)) * QWord(lo(m.a));
    b := QWord(lo(n.a)) * QWord(hi(m.a));
    c := QWord(hi(n.a)) * QWord(lo(m.a));
    d := QWord(hi(n.a)) * QWord(hi(m.a));
    x.a := QWord(lo(b)) shl 32;
    x.b := hi(b);
    y.a := QWord(lo(c)) shl 32;
    y.b := hi(c);
    y.b := y.b + d;
    prod := prod + x + y;
    prod.b := prod.b + n.a*m.b
  end;
  if n.b <> 0 then prod.b := prod.b + n.b*m.a;
end;

operator * (n : QWord; m : OWord) prod : OWord;
var
  low, high, al, ah, bl, bh, x : QWord;
begin
  prod := 0;
  if n <> 0 then
  begin
    low := QWord(lo(n));
    high := QWord(hi(n));
    al := QWord(lo(m.a));
    ah := QWord(hi(m.a));
    bl := QWord(lo(m.b));
    bh := QWord(hi(m.b));
    prod.a := low * al;
    x := low * ah;
    prod := prod + (QWord(lo(x)) shl 32);
    prod.b := prod.b + hi(x) + low * bl + ((low * bh) shl 32);
    if high <> 0 then
    begin
      x := high * al;
      prod := prod + (QWord(lo(x)) shl 32);
      prod.b := prod.b + hi(x) + high * ah + ((high * bl) shl 32)
    end
  end
end;

operator * (n : OWord; m : QWord) prod : OWord;
begin
  prod := m * n;
end;

operator * (n : DWord; m : OWord) prod : OWord;
var
  x : QWord;
begin
  prod := 0;
  if n <> 0 then
  begin
    prod.a := n * lo(m.a);
    x := n * hi(m.a);
    prod := prod + (x shl 32);
    prod.b := prod.b + hi(x);
    prod.b := prod.b + n*m.b
  end
end;


operator * (n : OWord; m : DWord) prod : OWord;
begin
  prod := m * n;
end;

operator * (n : Word; m : OWord) prod : OWord;
begin
  prod := DWord(n) * m;
end;

operator * (n : OWord; m : Word) prod : OWord;
begin
  prod := m * n;
end;

operator * (n : Byte; m : OWord) prod : OWord;
begin
  prod := DWord(n) * m;
end;

operator * (n : OWord; m : Byte) prod : OWord;
begin
  prod := m * n;
end;

// kahden lyhyemmän luvun tulo OWordinä

function Mul128(n : QWord; m : QWord) : OWord;
var
  nl, nh, ml, mh : QWord;
  lh, hl : OWord;
begin
  nl := lo(n);
  nh := hi(n);
  ml := lo(m);
  mh := hi(m);
  lh := nl * mh;
  hl := nh * ml;
  Mul128.a := nl * ml;
  Mul128.b := nh * mh;
  Mul128 := Mul128 + (lh shl 32);
  Mul128 := Mul128 + (hl shl 32)
end;

function Mul128(n : DWord; m : QWord) : OWord;
var
  l, h, nn : QWord;
begin
  nn := QWord(n);
  l := nn * lo(m);
  h := nn * hi(m);
  Mul128.a := l;
  Mul128.b := hi(h);
  Mul128 := Mul128 + (QWord(lo(h)) shl 32);
end;

function Mul128(n : QWord; m : DWord) : OWord;
begin
  Mul128 := Mul128(m, n);
end;

function Mul128(n : DWord; m : DWord) : OWord;
begin
  Mul128.a := QWord(n) * m;
  Mul128.b := 0;
end;

// Osamäärä
// Osamäärä jaettaessa 32 bittisellä etumerkittömällä luvulla

operator / (n : OWord; d : DWord) quo : OWord;
var
  x : QWord;
  al, ah, bl, bh : DWord;
begin
  if (d <> 0) then
  begin
    al := lo(n.a);
    ah := hi(n.a);
    bl := lo(n.b);
    bh := hi(n.b);
    quo.b := QWord(bh div d) shl 32;
    x :=(QWord(bh mod d) shl 32) + bl;
    quo.b := quo.b + (x div d);
    x := ((x mod d) shl 32) + ah;
    quo.a := (x div d) shl 32;;
    x := ((x mod d) shl 32) + al;
    quo.a := quo.a + (x div d);
  end
  else WriteLn('Error: OWord_arithmetic: Can''t divide by zero.')
end;

// Osamäärä jaettaessa 64 bittisellä etumerkittömällä luvulla

operator / (n : OWord; d : QWord) quo : OWord;
const
  u : QWord = 1;
var
  x, y: OWord;
  i : Byte;
begin
  if (d <> 0) then
  begin
    if d < $100000000 then quo := n / DWord(d)
    else
    begin
      quo.b := n.b div d;
      x.b := n.b mod d;
      x.a := n.a;    // x on "jakokulman ensimmäinen jakojäännös".
      y.a := 0;
      y.b := d;      // y on testiluku, aluksi d siirrettynä 63 bittiä
      y := y shr 1;  // vasemmalle, ei 64, koska x.b on jo < d
      quo.a := 0;
      for i := 63 downto 0 do
      begin
           if y <= x then  // testataan millä kakkosen potensseilla voidaan
           begin           // kertoa ja lisätä ennen kuin menee yli x:n
             quo.a := quo.a or (u shl i);     // lisätään oikea bitti osamäärään
             x := x - y
           end;
           y := y shr 1
      end
    end
  end
  else WriteLn('Error: OWord_arithmetic: Can''t divide by zero.')
end;

// Kahden OWordin osamäärä OWordinä

operator / (n : OWord; d : OWord) quo : OWord; overload;
const
  u : QWord = 1;
var
  x, y : OWord;
  i : Byte;
  j : Byte = 0;
begin
  if (d <> 0) then
  begin
    if d.b = 0 then quo := n / d.a
    else
    begin
      quo := 0;
      if n >= d then
      begin
        x := clone(n);
        y := clone(d);
        while y < x do
        begin
             y := y shl 1;
             j := j + 1
        end;
        if y = x then quo.a := u shl j  // osoittaja on kakkosen potenssi
        else                            // kertaa nimittäjä (2^0 = 1 mukana)
        begin
             quo.a := u shl j - 1;
             y := y shr 1;
             x := x - y;
             for i := j - 2 downto 0 do
             begin
                  y := y shr 1;
                  if y < x then
                  begin
                    x := x - y;
                    quo.a := quo.a or (u shl i)
                  end
             end
        end
      end
    end
  end
  else WriteLn('Error: OWord_arithmetic: Can''t divide by zero.')
end;

// Jakojäännös
// Jakojäännös jaettaessa 32 bittisellä etumerkittömällä luvulla

operator mod (n : OWord; d : DWord) rem : DWord;
begin
  if (d <> 0) then rem := lo((((((((QWord(hi(n.b) mod d) shl 32 + lo(n.b)) mod d) shl 32) + hi(n.a)) mod d) shl 32) + lo(n.a)) mod d)
  else WriteLn('Error: OWord_arithmetic: Can''t divide by zero.')
end;

// Jakojäännös jaettaessa 64 bittisellä etumerkittömällä luvulla

operator mod (n : OWord; d : QWord) rem : QWord;
var
  x, y, z : OWord;
  i : Byte;
begin
  if (d <> 0) then
  begin
    if d < $100000000 then rem := n mod DWord(d)
    else
    begin
         x.a := n.a;
         x.b := n.b mod d;
         y := ToOWord(d);
         for i := 64 downto 0 do
         begin
              if x = 0 then Break;
              z := y shl i;
              if (z <= x) then x := x - z
         end;
         rem := x.a
    end
  end
  else WriteLn('Error: OWord_arithmetic: Can''t divide by zero.')
end;

// jakojäännös jaettaessa OWordillä

operator mod (n : OWord; d : OWord) rem : OWord;
var
  x : OWord;
begin
  if (d <> 0) then
  begin
    if d.b = 0 then rem := n mod d.a
    else
    begin
      rem := clone(n);
      x := clone(d);
      while x < rem do
      begin
           x := x shl 1;
      end;
      if x = rem then rem := 0
      else
      begin
           while rem < d do
           begin
                x := x shr 1;
                if x <= rem then rem := rem - x
           end
      end
    end
  end
  else WriteLn('Error: OWord_arithmetic: Can''t divide by zero.')
end;

// funktioita

// neliöjuuri

function sqrt(n : OWord) : QWord;
var
  x : QWord = QWord($8FFFFFFFFFFFFFFF);
  i : Byte;
begin
  sqrt := 0;
  for i := 63 downto 0 do
  begin
       if Mul128(sqrt or x, sqrt or x) < n then sqrt := sqrt or x;
       x := x shr 1;
  end;
end;

// Luku merkkijonona esitettynä hexana

function IntToHex(Value : OWord) : String;
begin
  if Value.b <> 0 then IntToHex := IntToHex(Value.b, 1) + IntToHex(Value.a, 16)
  else IntToHex := IntToHex(Value.a, 1)
end;

// Luku merkkijonona esitettynä hexana, esityksen minimipituus parametrina

function IntToHex(Value : OWord; Digits : Integer) : String;
begin
  if Value.b <> 0 then IntToHex := IntToHex(Value.b, Digits - 16) + IntToHex(Value.a, 16)
  else IntToHex := IntToHex(Value.a, Digits)
end;

// Luku desimaalimerkkijonona

function IntToStr(Value : OWord) : String;
const
  d : DWord = 10;
var
  n : OWord;
begin
  n := clone(Value);
  IntToStr := '';
  repeat
    IntToStr := IntToStr(n mod d) + IntToStr;
    n := n / d;
  until n = 0;
end;

// Merkkijonona oleva desimaaliluku OWordiksi

function StrToOWord(Value : String) : OWord;
const
  d : DWord = 10;
var
  i : Integer = 1;
begin
  StrToOWord := 0;
  if Value <> '' then
  begin
    while (IsNumber(Value[i])) do
    begin
         StrToOWord := d * StrToOWord + (ord(Value[i]) - ord('0'));
         i := i + 1
    end
  end
end;

procedure Print(n : OWord);
begin
  Write(IntToStr(n));
end;

Procedure PrintLn(n : OWord);
begin
  WriteLn(IntToStr(n));
end;

end.
