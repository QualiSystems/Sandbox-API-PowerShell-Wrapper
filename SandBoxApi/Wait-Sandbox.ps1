Function Wait-Sandbox
{
	param
	(
		[Parameter(Mandatory=$true,ValueFromPipeline=$true)]$SandboxId,
		[SandBoxStatus]
        $Status
	)
    if (Invoke-TokenExsists)
	{
        Write-host "Waiting for status: " $Status
		$state = ""
		While ($state -ne $Status)
		{
			$response = Get-SandboxByID -SandboxId $SandboxId -printUrl $false
			$state = $response.state
			Start-sleep -s 2
		}
	}
}