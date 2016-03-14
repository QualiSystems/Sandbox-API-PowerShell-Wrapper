# Sandbox-API-PowerShell-Wrapper

### Installation
Open command line and copy those lines:
```
git clone https://github.com/QualiSystemsLab/Sandbox-API-PowerShell-Wrapper.git
cd Sandbox-API-PowerShell-Wrapper
powershell -NoExit -Command "Import-Module .\SandBoxAPi"
```

### Commands

Login
```powershell
Invoke-Login -User "MyUser" -Password "MyPass" -Domain "MyDomain" -TargetHost "ServerAdress" -Port "ServerPort"
```

Get Blueprints
```powershell
Get-Blueprints
```

Get blueprint with specific availability status
```powershell
Get-Blueprints | Where-Object -Property availability -eq "Available Now"
```

Get blueprint by Id
```powershell
Get-BlueprintByID -BlueprintId "9e43555f-d8a1-447b-bcd4-f00a54c957aa"
```

Start Sandbox
```powershell
Invoke-StartBlueprint -BlueprintId "9e43555f-d8a1-447b-bcd4-f00a54c957aa" -SandboxName "SandboxName" -DurationInMinuets 320
```

Start Sandbox after quering the blueprint
```powershell
Get-Blueprints | Where-Object -Property name -eq "BlueprintName" | Invoke-StartBlueprint -SandboxName "New Name"
```

Stopping a Sandbox:
```powershell
Stop-Sandbox -SandboxId "65f2710d-14f5-4e05-86a9-19ffd2e02f08"
```
```powershell
Get-Sandboxs | Where-Object -Property name -eq "StopME" | Stop-Sandbox
```


Get Sandboxes
```powershell
Get-Sandboxs
```

Get Sandbox by Id
```powershell
Get-SandboxByID -SandboxId "9e43555f-d8a1-447b-bcd4-f00a54c957aa"
```

All command support -AsJson switch. this switch will output the command result in a Json format and not as Powershell object
Example:
```powershell
Get-Blueprints -asjson
```

Have fun :-)
