function New-GithubGist
{
    [CmdletBinding(DefaultParameterSetName="ContentOnly")]
    param (
        [Parameter(Mandatory=$false)]
        [string]$Description,

        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ParameterSetName="ContentOnly")]
        [string]$Content,

        [Parameter(Mandatory=$true, Position=0, ValueFromPipeline=$true, ParameterSetName="Files")]
        [System.IO.FileInfo[]]$File,

        [Parameter(Mandatory=$false)]
        [switch]$Private,

        [Parameter(Mandatory = $false)]
        $Session = (Get-GithubSession -Current)
    )
begin
{
}
process
{
    $uri = GetUri "/gists"

    $bodyContent = new-object psobject -Property @{
        
    }

    $body = new-object psobject -Property @{
        "description" = $description 
    }
    Invoke-RestMethod -Method Post -Uri $uri -Credential $Session -Body $body
}
end
{
}
}