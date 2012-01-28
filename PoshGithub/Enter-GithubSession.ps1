function Enter-GithubSession
{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
	    [Management.Automation.Credential()]
	    [Management.Automation.PSCredential]$Credential
    )

begin
{
}
process
{
    $global:GitHubSession = $Credential
}
end
{
}
}