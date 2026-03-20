## 1️⃣ Verificar limite global da organização
Esse limite afeta o tamanho máximo de mensagem permitido no tenant.

Get-TransportConfig | Select MaxSendSize, MaxReceiveSize

Exemplo de Saída: 
MaxSendSize    : 35 MB
MaxReceiveSize : 36 MB

## 2️⃣ Verificar limite de envio/recebimento de um usuário específico

Get-Mailbox admin@suaempresa.com | Select DisplayName, MaxSendSize, MaxReceiveSize

Exemplo: 
DisplayName   : Fulano
MaxSendSize   : 25 MB
MaxReceiveSize: 25 MB
⚠️ Se aparecer Unlimited, significa que o usuário está herdando o limite da organização.

## 3️⃣ Verificar todos os usuários

Get-Mailbox -ResultSize Unlimited | Select DisplayName, MaxSendSize, MaxReceiveSize

Verificar somente os que não possuem envio de 150MB:
Get-Mailbox -ResultSize Unlimited | Where-Object {$_.MaxSendSize -ne "150 MB (157,286,400 bytes)"} | Select DisplayName, MaxSendSize, MaxReceiveSize

## 4️⃣ Alterar limite de envio/recebimento de um usuário

Exemplo para 50 MB:
Set-Mailbox admin@suaempresa.com -MaxSendSize 150MB -MaxReceiveSize 150MB

## 5️⃣ Alterar limite global da organização

Set-TransportConfig -MaxSendSize 50MB -MaxReceiveSize 50MB

## 6️⃣ Verificar limite do conector (caso exista)
Às vezes o limite está no conector SMTP.

Get-ReceiveConnector | SelectName, MaxMessageSize ou Get-SendConnector | SelectName, MaxMessageSize

💡 Dica importante do Exchange Online

Mesmo alterando tudo, existe um limite técnico do serviço:

- Máximo envio: ~150 MB
- Máximo recebimento: ~150 MB
- Anexo prático no Outlook: ~35 MB por padrão
