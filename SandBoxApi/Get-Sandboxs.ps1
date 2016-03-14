Function Get-Sandboxs
{
	param
	(
		[switch]
		$asJson = $false
	)
    if (Invoke-TokenExsists)
	{
		$response = Invoke-Get -Uri "$BaseURL/sandboxes"
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