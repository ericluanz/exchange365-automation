Requisitos:
- Powershell 7
- [Módulo PNP Online](https://www.notion.so/PnP-Online-304db6e71f2980dc9839d9fb1d77e6e5?pvs=21) com App Registration do Entra ID para autenticar

Para alterar o endereço URL da lista para outro endereço:
- Parâmetro ClientId é a chave de acesso criada no processo de App Registration

# Endereco raiz do site
$url = (site do sharepoint)

# Credencial do App Registration
$clientID = f2f7c315-947c-4d37-802d-b90bddf2d49c

# Conectar no site
Connect-PnPOnline -Url $url -Interactive -ClientId $clientID

# Pegar a lista
$list = Get-PnPList -Identity "Sua lista do Sharepoint"

# Mudar a URL
$list.Rootfolder.MoveTo("Lists/Sua lista do Sharepoint")
Invoke-PnPQuery

# (Opcional) mudar o nome exibido
Set-PnPList -Identity "Sua lista do Sharepoint" -Title "seu titulo"

Isso literalmente move a lista para o novo caminho.
