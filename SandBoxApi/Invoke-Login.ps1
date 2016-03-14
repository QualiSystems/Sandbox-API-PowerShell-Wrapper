Function Invoke-Login
{
    param
    (
        [string]
        $User = 'MyUser', 
        [string]
        $Password = 'MuPassword',
        [string]
        $Domain = 'MyDomain',
        [string]
        $TargetHost = 'ServerIp',
        [int]
        $Port = 8032,
        [int]
        $Version = 1
    )
	
	Set-Variable -Name 'ContentTypeXWWW' -Value 'application/x-www-form-urlencoded' -Scope Global	
	Set-Variable -Name 'ContentTypeJson' -Value 'application/json' -Scope Global	

    $url = "http://$TargetHost`:$Port/Api"
    Set-Variable -Name 'BaseURL' -Value $url -Scope Global	
    $body = @{ username = $User; password = $Password; domain = $Domain } | ConvertTo-Json
    Try
	{
		$Auth = Invoke-Put -Uri "$BaseURL/Login" -Body $body
		Set-Variable -Name 'BaseURL' -Value "http://$TargetHost`:$Port/Api/v$Version" -Scope Global	
		$Auth = $Auth -replace '"'
		Write-Host 'Authentication Token set to: ' $Auth
		Write-Host 'Setting ' $BaseURL 'as base url' -ForegroundColor Magenta
		Set-Variable -Name 'Auth' -Value $Auth -Scope Global
		Write-Host -Object 'You Are Now Loged In!' -ForegroundColor Green
	}
	Catch
	{
		Write-host $_
	}
}