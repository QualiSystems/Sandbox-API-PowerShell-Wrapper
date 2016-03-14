Function Invoke-TokenExsists
{
    if ($Auth -eq $null)
    {
        Write-host 'Please logon first by running the Invoke-Login method'  -ForeGround Red
        return $false
    }
    return $true
}