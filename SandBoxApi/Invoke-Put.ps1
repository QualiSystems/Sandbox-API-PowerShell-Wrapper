Function Invoke-Put
{
    param
    (
        [string]
        $Uri,

        [object]
        $Body
    )
    Write-Host 'Sending PUT: ' $Uri -ForegroundColor Yellow
    return Invoke-WebRequest -Uri $Uri -Body $Body -ContentType $ContentTypeJson -Method Put
	#return Invoke-RestMethod -Uri $Uri -Method Put -ContentType $ContentTypeJson -Body $Body
}