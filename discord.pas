unit Discord;
interface

uses SysUtils, Classes;

procedure SendWebhook(Msg:WideString);

implementation

const WebhookURL = 'seu web hook aqui';

procedure SendWebhook(Msg:WideString);
var
  PSCommand, FullCommand: WideString;
begin
  PSCommand :=
    'powershell -Command "$webhookUrl = ''' + WebhookURL + '''; ' +
    '$message = ''' + Msg + '''; ' +
    '$payload = @{ content = $message } | ConvertTo-Json -Depth 3; ' +
    'Invoke-RestMethod -Uri $webhookUrl -Method Post -ContentType ''application/json'' -Body $payload"';

  ShellExecuteW(0, PChar('open'), PChar('cmd.exe'),
    PChar('/C ' + PSCommand), nil, 0);
end;

function ShellExecuteW(hwnd: cardinal;
    lpOperation, lpFile, lpParameters, lpDirectory: pwidechar;
    nShowCmd: integer): cardinal;
    stdcall; external 'shell32.dll' Name 'ShellExecuteW';

end.
