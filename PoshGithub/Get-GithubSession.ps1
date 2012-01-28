function Get-GithubSession
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [switch]$Current
    )

process
{
    $global:GithubSession
}
}