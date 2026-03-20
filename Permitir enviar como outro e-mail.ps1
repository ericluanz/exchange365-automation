## Adicionar permissão a uma caixa de usuário/grupo/equipe
Se já tiver instalado, pula.

$Usuario = "email@empresa.com"
$Grupo   = "grupo@empresa.com"
Add-RecipientPermission -Identity $Usuario -Trustee $Grupo -AccessRights SendAs -Confirm:$false

$Usuario = "email@empresa.com"
$Grupo   = "grupo@empresa.com"
Set-UnifiedGroup -Identity $Grupo -GrantSendOnBehalfTo @{Add=$Usuario}

## Consultar permissões de uma caixa de equipe

$Grupo = "grupo@empresa.com"
Get-UnifiedGroup $Grupo | Select GrantSendOnBehalfTo
Get-RecipientPermission $Grupo | Where-Object { $_.AccessRights -contains "SendAs" }
