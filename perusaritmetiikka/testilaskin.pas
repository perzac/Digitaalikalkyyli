unit testilaskin;

{$mode objfpc}{$H+}

interface

uses
	Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
	StdCtrls, OWord_arithmetic, UInt256_arithmetic, UInt512_arithmetic,
    UInt1024_arithmetic, Character;

type

	{ TLaskimenPohja }

 TLaskimenPohja = class(TForm)
		btSumma: TButton;
		btErotus: TButton;
		btTulo: TButton;
		btOsamaara: TButton;
		btJaannos: TButton;
		btLisaa: TButton;
		btVahenna: TButton;
		btKerro: TButton;
		btJaa: TButton;
		btRedusoi: TButton;
		btLopetus: TButton;
		mLuku1: TMemo;
		mLuku2: TMemo;
		mTulos: TMemo;
		mAkku: TMemo;
		rbQWord: TRadioButton;
		rbOWord: TRadioButton;
		rbUInt256: TRadioButton;
		rbUInt512: TRadioButton;
		rbUInt1024: TRadioButton;
		rgIntType: TRadioGroup;
		Shape1: TShape;
		procedure btErotusClick(Sender: TObject);
		procedure btJaaClick(Sender: TObject);
		procedure btJaannosClick(Sender: TObject);
		procedure btKerroClick(Sender: TObject);
		procedure btLisaaClick(Sender: TObject);
        procedure btLopetusClick(Sender: TObject);
        procedure btOsamaaraClick(Sender: TObject);
		procedure btRedusoiClick(Sender: TObject);
		procedure btSummaClick(Sender: TObject);
		procedure btTuloClick(Sender: TObject);
		procedure btVahennaClick(Sender: TObject);
		procedure mAkkuExit(Sender: TObject);
		procedure mLuku1Exit(Sender: TObject);
		procedure mLuku2Exit(Sender: TObject);
        procedure lueA;
        procedure lueB;
        procedure lueC;
        procedure lueTulos;
        procedure luvuksiA;
        procedure luvuksiB;
        procedure luvuksiC;
        procedure luvuksiTulos;
        procedure kirjoita;
		procedure rbOWordClick(Sender: TObject);
		procedure rbQWordClick(Sender: TObject);
		procedure rbUInt1024Click(Sender: TObject);
		procedure rbUInt256Click(Sender: TObject);
		procedure rbUInt512Click(Sender: TObject);
	private
        A : String;
        B : String;
        C : String;
        Tulos : String;
        a64, b64, c64, tulos64 : QWord;
        a128, b128, c128, tulos128 : OWord;
        a256, b256, c256, tulos256 : UInt256;
        a512, b512, c512, tulos512 : UInt512;
        a1024, b1024, c1024, tulos1024 : UInt1024;
	public
		{ public declarations }
	end;

// Korvataan olemassa oleva funktio.
function StrToQWord(Value : String) : QWord; overload;

var
	LaskimenPohja: TLaskimenPohja;

implementation

// Oma "tyhmä" mutta toimiva toteutus
function StrToQWord(Value : String) : QWord;
const
  d : QWord = 10;
var
  i : Integer = 1;
begin
  StrToQWord := 0;
  if Value <> '' then
  begin
    while (IsNumber(Value[i])) do
    begin
         StrToQWord := d * StrToQWord + (ord(Value[i]) - ord('0'));
         i := i + 1
    end
  end
end;

{$R *.lfm}

{ TLaskimenPohja }

procedure TLaskimenPohja.btLopetusClick(Sender: TObject);
begin
    close
end;

procedure TLaskimenPohja.lueA;
var
    i : Byte = 0;
begin
    A := '';
    while(mLuku1.Lines.Count > i) do
	begin
      A := A + mLuku1.Lines[i];
      i := i + 1
    end;
    if i = 0 then A := '0';
end;

procedure TLaskimenPohja.lueB;
var
    i : Byte = 0;
begin
    B := '';
    while(mLuku2.Lines.Count > i) do
	begin
      B := B + mLuku2.Lines[i];
      i := i + 1
    end;
    if i = 0 then B := '0';
end;

procedure TLaskimenPohja.lueC;
var
    i : Byte = 0;
begin
    C := '';
    while(mAkku.Lines.Count > i) do
	begin
      C := C + mAkku.Lines[i];
      i := i + 1
    end;
    if i = 0 then C := '0';
end;

procedure TLaskimenPohja.lueTulos;
var
    i : Byte = 0;
begin
    Tulos := '';
    while(mTulos.Lines.Count > i) do
	begin
      Tulos := Tulos + mTulos.Lines[i];
      i := i + 1
    end;
    if i = 0 then Tulos := '0';
end;

procedure TLaskimenPohja.luvuksiA;
begin
    if rbQWord.Checked then a64 := StrToQWord(A)
    else if rbOWord.Checked then a128 := StrToOWord(A)
    else if rbUInt256.Checked then a256 := StrToUInt256(A)
    else if rbUInt512.Checked then a512 := StrToUInt512(A)
    else if rbUInt1024.Checked then a1024 := StrToUInt1024(A)
end;

procedure TLaskimenPohja.luvuksiB;
begin
    if rbQWord.Checked then b64 := StrToQWord(B)
    else if rbOWord.Checked then b128 := StrToOWord(B)
    else if rbUInt256.Checked then b256 := StrToUInt256(B)
    else if rbUInt512.Checked then b512 := StrToUInt512(B)
    else if rbUInt1024.Checked then b1024 := StrToUInt1024(B)
end;

procedure TLaskimenPohja.luvuksiC;
begin
    if rbQWord.Checked then c64 := StrToQWord(C)
    else if rbOWord.Checked then c128 := StrToOWord(C)
    else if rbUInt256.Checked then c256 := StrToUInt256(C)
    else if rbUInt512.Checked then c512 := StrToUInt512(C)
    else if rbUInt1024.Checked then c1024 := StrToUInt1024(C)
end;

procedure TLaskimenPohja.luvuksiTulos;
begin
    if rbQWord.Checked then tulos64 := StrToQWord(Tulos)
    else if rbOWord.Checked then tulos128 := StrToOWord(Tulos)
    else if rbUInt256.Checked then tulos256 := StrToUInt256(Tulos)
    else if rbUInt512.Checked then tulos512 := StrToUInt512(Tulos)
    else if rbUInt1024.Checked then tulos1024 := StrToUInt1024(Tulos)
end;

procedure TLaskimenPohja.kirjoita;
begin
    mLuku1.Lines.Clear;
    mLuku2.Lines.Clear;
    mAkku.Lines.Clear;
    mTulos.Lines.Clear;
    if rbQWord.Checked then
    begin
      mLuku1.Lines.Add(IntToStr(a64));
      mLuku2.Lines.Add(IntToStr(b64));
      mAkku.Lines.Add(IntToStr(c64));
      mTulos.Lines.Add(IntToStr(tulos64))
	end
    else if rbOWord.Checked then
    begin
      mLuku1.Lines.Add(IntToStr(a128));
      mLuku2.Lines.Add(IntToStr(b128));
      mAkku.Lines.Add(IntToStr(c128));
      mTulos.Lines.Add(IntToStr(tulos128))
	end
	else if rbUInt256.Checked then
    begin
      mLuku1.Lines.Add(IntToStr(a256));
      mLuku2.Lines.Add(IntToStr(b256));
      mAkku.Lines.Add(IntToStr(c256));
      mTulos.Lines.Add(IntToStr(tulos256))
	end
	else if rbUInt512.Checked then
    begin
      mLuku1.Lines.Add(IntToStr(a512));
      mLuku2.Lines.Add(IntToStr(b512));
      mAkku.Lines.Add(IntToStr(c512));
      mTulos.Lines.Add(IntToStr(tulos512))
	end
	else if rbUInt1024.Checked then
    begin
      mLuku1.Lines.Add(IntToStr(a1024));
      mLuku2.Lines.Add(IntToStr(b1024));
      mAkku.Lines.Add(IntToStr(c1024));
      mTulos.Lines.Add(IntToStr(tulos1024))
	end;
end;

procedure TLaskimenPohja.rbOWordClick(Sender: TObject);
begin
    luvuksiA;
    luvuksiB;
    luvuksiC;
    luvuksiTulos;
end;

procedure TLaskimenPohja.rbQWordClick(Sender: TObject);
begin
    luvuksiA;
    luvuksiB;
    luvuksiC;
    luvuksiTulos;
end;

procedure TLaskimenPohja.rbUInt1024Click(Sender: TObject);
begin
    luvuksiA;
    luvuksiB;
    luvuksiC;
    luvuksiTulos;
end;

procedure TLaskimenPohja.rbUInt256Click(Sender: TObject);
begin
    luvuksiA;
    luvuksiB;
    luvuksiC;
    luvuksiTulos;
end;

procedure TLaskimenPohja.rbUInt512Click(Sender: TObject);
begin
    luvuksiA;
    luvuksiB;
    luvuksiC;
    luvuksiTulos
end;

procedure TLaskimenPohja.mAkkuExit(Sender: TObject);
begin
    LueC;
    LuvuksiC
end;

procedure TLaskimenPohja.mLuku1Exit(Sender: TObject);
begin
    LueA;
    LuvuksiA
end;

procedure TLaskimenPohja.mLuku2Exit(Sender: TObject);
begin
    LueB;
    LuvuksiB
end;

procedure TLaskimenPohja.btSummaClick(Sender: TObject);
begin
    if rbQWord.Checked then tulos64 := a64 + b64
    else if rbOWord.Checked then tulos128 := a128 + b128
    else if rbUInt256.Checked then tulos256 := a256 + b256
    else if rbUInt512.Checked then tulos512 := a512 + b512
    else if rbUInt1024.Checked then tulos1024 := a1024 + b1024;
    kirjoita
end;

procedure TLaskimenPohja.btTuloClick(Sender: TObject);
begin
    if rbQWord.Checked then tulos64 := a64 * b64
    else if rbOWord.Checked then tulos128 := a128 * b128
    else if rbUInt256.Checked then tulos256 := a256 * b256
    else if rbUInt512.Checked then tulos512 := a512 * b512
    else if rbUInt1024.Checked then tulos1024 := a1024 * b1024;
    kirjoita
end;

procedure TLaskimenPohja.btErotusClick(Sender: TObject);
begin
    if rbQWord.Checked then tulos64 := a64 - b64
    else if rbOWord.Checked then tulos128 := a128 - b128
    else if rbUInt256.Checked then tulos256 := a256 - b256
    else if rbUInt512.Checked then tulos512 := a512 - b512
    else if rbUInt1024.Checked then tulos1024 := a1024 - b1024;
    kirjoita
end;

procedure TLaskimenPohja.btJaannosClick(Sender: TObject);
begin
    if rbQWord.Checked then tulos64 := a64 mod b64
    else if rbOWord.Checked then tulos128 := a128 mod b128
    else if rbUInt256.Checked then tulos256 := a256 mod b256
    else if rbUInt512.Checked then tulos512 := a512 mod b512
    else if rbUInt1024.Checked then tulos1024 := a1024 mod b1024;
    kirjoita
end;

procedure TLaskimenPohja.btOsamaaraClick(Sender: TObject);
begin
    if rbQWord.Checked then tulos64 := a64 div b64
    else if rbOWord.Checked then tulos128 := a128 / b128
    else if rbUInt256.Checked then tulos256 := a256 / b256
    else if rbUInt512.Checked then tulos512 := a512 / b512
    else if rbUInt1024.Checked then tulos1024 := a1024 / b1024;
    kirjoita
end;

procedure TLaskimenPohja.btLisaaClick(Sender: TObject);
begin
    if rbQWord.Checked then tulos64 := tulos64 + c64
    else if rbOWord.Checked then tulos128 := tulos128 + c128
    else if rbUInt256.Checked then tulos256 := tulos256 + c256
    else if rbUInt512.Checked then tulos512 := tulos512 + c512
    else if rbUInt1024.Checked then tulos1024 := tulos1024 + c1024;
    kirjoita
end;

procedure TLaskimenPohja.btVahennaClick(Sender: TObject);
begin
    if rbQWord.Checked then tulos64 := tulos64 - c64
    else if rbOWord.Checked then tulos128 := tulos128 - c128
    else if rbUInt256.Checked then tulos256 := tulos256 - c256
    else if rbUInt512.Checked then tulos512 := tulos512 - c512
    else if rbUInt1024.Checked then tulos1024 := tulos1024 - c1024;
    kirjoita
end;

procedure TLaskimenPohja.btKerroClick(Sender: TObject);
begin
    if rbQWord.Checked then tulos64 := tulos64 * c64
    else if rbOWord.Checked then tulos128 := tulos128 * c128
    else if rbUInt256.Checked then tulos256 := tulos256 * c256
    else if rbUInt512.Checked then tulos512 := tulos512 * c512
    else if rbUInt1024.Checked then tulos1024 := tulos1024 * c1024;
    kirjoita
end;

procedure TLaskimenPohja.btJaaClick(Sender: TObject);
begin
    if rbQWord.Checked then tulos64 := tulos64 div c64
    else if rbOWord.Checked then tulos128 := tulos128 / c128
    else if rbUInt256.Checked then tulos256 := tulos256 / c256
    else if rbUInt512.Checked then tulos512 := tulos512 / c512
    else if rbUInt1024.Checked then tulos1024 := tulos1024 mod b1024;
    kirjoita
end;

procedure TLaskimenPohja.btRedusoiClick(Sender: TObject);
begin
    if rbQWord.Checked then tulos64 := tulos64 mod c64
    else if rbOWord.Checked then tulos128 := tulos128 mod c128
    else if rbUInt256.Checked then tulos256 := tulos256 mod c256
    else if rbUInt512.Checked then tulos512 := tulos512 mod c512
    else if rbUInt1024.Checked then tulos1024 := tulos1024 mod c1024;
    kirjoita
end;




end.

