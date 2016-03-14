function Get-QualiCommands
{
    ((Get-Module -Name SandBoxAPi).ExportedCommands).Keys
}