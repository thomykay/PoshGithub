function Get-GithubGist
{
    [CmdletBinding(DefaultParameterSetName="Default")]
    param (
		[Parameter(Mandatory=$false, Position = 0)]
		[string]$Description = "*",
		
        [Parameter(Mandatory = $true, ParameterSetName="User")]
        [string]$UserName,

        [Parameter(Mandatory=$true, ParameterSetName="All")]
        [switch]$All,

        [Parameter(Mandatory=$true, ParameterSetName="Starred")]
        [switch]$Starred,

        [Parameter(Mandatory=$true, ParameterSetName="Id")]
        [int]$Id,

        [Parameter(Mandatory = $false)]
        $Session = (Get-GithubSession -Current)
    )
begin
{    
    switch ($psCmdlet.ParameterSetName)
    {
        "User"    {$uri = GetUri "/users/$UserName/gists"}
        "All"     {$uri = GetUri "/gists/public"}
        "Starred" {$uri = GetUri "/gists/starred"}
        "Id"      {$uri = GetUri "gists/$Id"}
        "Default" {$uri = GetUri "/gists"}
    }
}
process
{
    Invoke-RestMethod -Uri $uri -Credential $Session `
		| ConvertTo-Enumerable `
		<#| Where-Object {$_.description -Like $Description}#> `
        | ConvertTo-Type -TypeName "ThomyKay.PoshGithub.Gist"
		
}
end
{
}
}