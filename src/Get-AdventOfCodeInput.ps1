<#
.SYNOPSIS
    Retrieves advent of code input to the Powershell terminal session.

.DESCRIPTION
    Retrieves advent of code input to the Powershell terminal session.

.PARAMETER SessionVariable
    Provides an authentcated Web Session object from AdventOfCode website.
    See example at: https://swimburger.net/blog/web/copy-http-requests-from-chrome-edge-devtools-to-powershell-curl-fetch

.PARAMETER Year
    Provides the challenge year.

.PARAMETER Day
    Provides the challenge day.

.EXAMPLE
    $input = Get-AdventOfCodeInput -SessionVariable $session -Year 2015 -Day 1
    This command will return Advent of Code challenge from year 2015 day 1 and save it in the $input variable.
#>
function Get-AdventOfCodeInput {
    param (
        [Parameter(Mandatory = $true, HelpMessage = "
        1. Get the session object using Chrome
        2. Developer tool > network > refresh the page (while authenticated), right click the first doc > copy > copy as powershell
        3. paste the command on terminal and run it to load session variable to the memory")]
        [object]$SessionVariable,

        [Parameter(Mandatory = $true)]
        [ArgumentCompleter({
                param($Command, $Parameter, $WordToComplete, $CommandAst, $FakeBoundParams)
                $AdventOfCodeConfig.Years | Where-Object { $_ -like "$WordToComplete*" } |
                Foreach-Object { $_ }
            })]
        [ValidateScript({
                $_ -in $AdventOfCodeConfig.Years
            })]
        [string]$Year,

        [Parameter(Mandatory = $true)]
        [ArgumentCompleter({
                param($Command, $Parameter, $WordToComplete, $CommandAst, $FakeBoundParams)
                $AdventOfCodeConfig.Days | Where-Object { $_ -like "$WordToComplete*" } |
                Foreach-Object { $_ }
            })]
        [ValidateScript({
                $_ -in $AdventOfCodeConfig.Days
            })]
        [string]$Day
    )
    $url = "https://adventofcode.com/{0}/day/{1}/input" -f $Year, $Day
    $output = Invoke-WebRequest -Uri $url -WebSession $SessionVariable | Select-Object -ExpandProperty Content
    return $output
}
