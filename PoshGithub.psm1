function Install-PoshGithub
{
	Uninstall-PoshGithub
	cp '~\Documents\Visual Studio 2010\Projects\PoshGithub\PoshGithub' ~\Documents\WindowsPowerShell\Modules -Force -Recurse
}

function Uninstall-PoshGithub
{
	rmdir ~\Documents\WindowsPowerShell\Modules\PoshGithub -ErrorAction Continue -Recurse
}