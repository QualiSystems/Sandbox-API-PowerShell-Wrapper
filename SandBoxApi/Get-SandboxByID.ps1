Function Get-SandboxByID
{
    param
    (
        [string]
        $SandboxId,
		[switch]
		$asJson = $false
    )
	if (Invoke-TokenExsists)
	{
		$response = Invoke-Get -Uri "$BaseURL/sandboxes/$SandboxId"
		if ($response.count -eq 0) 
		{
			Write-Host -Object 'No sandboxe'
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