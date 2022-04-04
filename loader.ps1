$root = Split-Path -Parent $Script:MyInvocation.MyCommand.Path
try
{
    Write-Verbose "Loading static variables..."
    $json = Get-Content $root/lib/AdventOfCodeConfig.json
    New-Variable -Name AdventOfCodeConfig -Value ($json | ConvertFrom-Json) -Option ReadOnly -Force
}
catch
{
    throw "Failed while trying to load static variables! Exception Message: $($_.Exception.Message)"
}
try
{
    $function = (Get-ChildItem $root/src -File -Filter "*.ps1").FullName
    . $function
}
catch {
    throw "Failed while trying to load function! Exception Message: $($_.Exception.Message)"
}
