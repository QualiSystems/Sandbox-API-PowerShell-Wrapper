Function Invoke-Get
{
    param
    (
        [string]
        $Uri
    )
    Write-Host 'Sending GET: ' $Uri -ForegroundColor Yellow
    return Invoke-RestMethod -Uri $Uri -Method Get -ContentType $ContentTypeJson -Headers @{
        Authorization = "Basic $Auth"
    }
}