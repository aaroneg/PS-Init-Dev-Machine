# Change directory to the running user's documents folder
Set-Location $env:userprofile\Documents\
# Make sure the powershell profile exists
if (!(Test-Path $PROFILE)) {
    New-Item $PROFILE -force -itemtype "file"
}
set-executionpolicy Bypass -Scope CurrentUser -Force
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
Install-Module posh-git -Force
install-module chocolatey
install-chocolateysoftware
install-chocolateypackage git -Force -Confirm:$false
install-chocolateypackage vscode -Force -Confirm:$false
Import-Module posh-git
# Make sure posh-git is loaded every time powershell is opened
'import-module posh-git'|out-file $PROFILE -Append -Encoding UTF8
