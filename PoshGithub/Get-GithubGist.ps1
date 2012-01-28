function Get-GithubGist
{
    [CmdletBinding()]
    param (
		[Parameter(Mandatory=$false, Position = 0)]
		[string]$Description = "*",
		
        [Parameter(Mandatory = $false)]
        [string]$UserName,

        [Parameter(Mandatory = $false)]
        $Session = (Get-GithubSession -Current)
    )
begin
{    
	if ($psBoundParameters.ContainsKey('UserName'))
	{
		$uri = GetUri "/users/$UserName/gists"
	}
	else
	{
		$uri = GetUri "/gists/public"
	}

}
process
{
	Write-Verbose "Request from $uri"
    Invoke-RestMethod -Uri $uri -Credential $Session `
		| ConvertTo-Enumerable `
		<#| Where-Object {$_.description -Like $Description}#> `
        | ConvertTo-Type -TypeName "ThomyKay.PoshGithub.Gist"
		
}
end
{
}
}