function Remove-GithubGist
{
    [CmdletBinding(SupportsShouldProcess=$true, ConfirmImpact = 'High')]
    param (
        [Parameter(Mandatory = $true, Position = 0, ValueFromPipeline = $true)]
        $Gist,

        [Parameter(Mandatory = $false)]
        $Session = (Get-GithubSession -Current)
    )

begin
{
}
process
{
    if ($psCmdlet.ShouldProcess("Delete Gist", $Gist.Description))
    {
        Invoke-RestMethod -Uri (GetUri "/gists/$($Gist.id)") -Method Delete -Credential $Session
    }
}
end
{
}
}