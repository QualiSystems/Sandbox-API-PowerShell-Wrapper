Function Get-Blueprints
{
	param
	(
		[switch]
		$asJson = $false
	)
    if (Invoke-TokenExsists)
	{
		$response = Invoke-Get -Uri "$BaseURL/blueprints"
		if ($response.count -eq 0) 
		{
			Write-Host -Object 'No blueprints'
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