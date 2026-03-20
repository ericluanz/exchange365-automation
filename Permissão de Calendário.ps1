Existem 2 formas principais de adicionar o calendário no Outlook Classic:

## 🔹1. Auto mapping (automático via PowerShell)

## ✅ Funciona apenas no Outlook Classic (não no “novo Outlook”).

## Conferir permissões atuais:
Get-MailboxFolderPermission -Identity "email@empresa.com:\Calendar"

## Calendário de Equipes:
Get-MailboxFolderPermission -Identity "email@empresa.com:\Calendar" -GroupMailbox

## Se estiver em PT-BR:
Get-MailboxFolderPermission -Identity "email@empresa.com:\Calendário"

Isso vai listar todas as permissões atuais.

## Adicionar a permissão ao calendário:
Add-MailboxFolderPermission -Identity "email@empresa.com:\Calendário" -User "email@empresa.com" -AccessRights Editor

## Adicionar/Modificar a permissão ao calendário da Equipe:
Get-MailboxFolderPermission -Identity "email@empresa.com:\Calendar" -GroupMailbox | Set-MailboxFolderPermission -User "Member@local" -AccessRights Reviewer

## Listar todas as pastas da caixa (inclusive calendários):
Get-MailboxFolderStatistics -Identity "email@empresa.com" | Select-Object Name, FolderPath

## Isso vai mostrar algo assim:
Name            FolderPath
----            ----------
Calendar        \Calendar
Inbox           \Inbox
Sent Items      \Sent Items
...

## Remover permissão de um usuário no calendário:
Remove-MailboxFolderPermission -Identity "email@empresa.com:\Calendário" -User "email@empresa.com"

Isso apaga completamente a entrada dessa usuária da lista de permissões.
