
program Project1;

uses
  {$ifdef FASTXX}
  FastMM4,
  FastCode,
  FastMove,
  {$endif}
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  WinSock2 in 'WinSock2.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
