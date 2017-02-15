unit Arithmetic_assist;

{$mode objfpc}{$H+}

interface

type
  Carry = ^Byte;

function AddWithCarryQWord(n : QWord; m : QWord; c : Carry) : QWord;

function DifWithCarryQWord(n : QWord; m : QWord; c : Carry) : QWord;

implementation

// Yhteenlasku muistinumerolla

function AddWithCarryQWord(n : QWord; m : QWord; c : Carry) : QWord;
begin
  AddWithCarryQWord := n + m + c^;
  if AddWithCarryQWord < m + c^ then c^ := 1
  else c^ := 0
end;

// Vähennyslasku muistinumerolla

function DifWithCarryQWord(n : QWord; m : QWord; c : Carry) : QWord;
begin
  n := n - c^;
  DifWithCarryQWord := n - m;
  if (m > n) or ((n = $FFFFFFFF) and (c^ = 1)) then c^ := 1
  else c^ := 0;
end;

end.
