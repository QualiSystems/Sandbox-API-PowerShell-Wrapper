Function Invoke-StartBlueprint
{
    param
    (
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]$BlueprintId,
        [string]
        $SandboxName = "Default Name",
        [int]
        $DurationInMinuets = "30",
		[switch]
		$asJson = $false
    )
	if (Invoke-TokenExsists)
	{
        if ($BlueprintId.id -ne $null) {$BlueprintId = $BlueprintId.id}
        $Duration = [System.XML.XmlConvert]::ToString([System.TimeSpan]::FromMinutes($DurationInMinuets))
		$body = @{name = $SandboxName; duration = $Duration} | ConvertTo-Json
		$response = Invoke-Post -Uri "$BaseURL/blueprints/$BlueprintId/start" -body $body
		return $response.id
	}
}