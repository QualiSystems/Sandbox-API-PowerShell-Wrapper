Function Get-SandboxByID
{
    param
    (
        [string]
        $SandboxId,
		[switch]
		$asJson = $false,
        [Parameter(Mandatory=$false)][bool]
        $printUrl = $true
    )
	if (Invoke-TokenExsists)
	{
		$response = Invoke-Get -Uri "$BaseURL/sandboxes/$SandboxId" -printUrl $printUrl
		if ($response.count -eq 0) 
		{
			Write-Host -Object 'No sandboxes'
		}
		else 
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