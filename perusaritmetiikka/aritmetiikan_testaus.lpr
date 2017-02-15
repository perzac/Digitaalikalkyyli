program aritmetiikan_testaus;

{$mode objfpc}{$H+}

uses
	{$IFDEF UNIX}{$IFDEF UseCThreads}
	cthreads,
	{$ENDIF}{$ENDIF}
	Interfaces, // this includes the LCL widgetset
	Forms, testilaskin
	{ you can add units after this };

{$R *.res}

begin
	RequireDerivedFormResource:=True;
	Application.Initialize;
	Application.CreateForm(TLaskimenPohja, LaskimenPohja);
	Application.Run;
end.

