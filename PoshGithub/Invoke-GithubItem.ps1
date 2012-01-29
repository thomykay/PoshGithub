function Invoke-GithubItem
{
	param (
		[Parameter(Mandatory=$true, Position=0, ValueFromPipelineByPropertyName=$true)]
		[Alias("Url")]
		[Uri]$Uri
	)
process
{
	[Diagnostics.Process]::Start($Uri)
}
}