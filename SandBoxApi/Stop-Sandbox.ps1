Function Stop-Sandbox
{
    param
    (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]$SandboxId,
		[switch]$asJson = $false
    )
    if (Invoke-TokenExsists)
	{
        if ($SandboxId.id -ne $null) {$SandboxId = $SandboxId.id}
		$response = Invoke-Post -Uri "$BaseURL/sandboxes/$SandboxId/stop"
		if ($response -ne $null)
		{
			if ($asJson.IsPresent)
			{
				return $response | ConvertTo-Json
			}
			else
			{
				return $response
			}
		}
	}
}