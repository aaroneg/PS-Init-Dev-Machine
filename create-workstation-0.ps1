set-location ([Environment]::GetFolderPath("MyDocuments"))
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
'import-module posh-git' | out-file $PROFILE -Append -Encoding UTF8

install-chocolateypackage googlechrome -Force -Confirm:$false
install-chocolateypackage firefox -Force -Confirm:$false
install-chocolateypackage 7zip -Force -Confirm:$false
install-chocolateypackage vlc -Force -Confirm:$false
install-chocolateypackage python3 -Force -Confirm:$false
install-chocolateypackage sysinternals -Force -Confirm:$false
install-chocolateypackage putty.install -Force -Confirm:$false
install-chocolateypackage treesizefree -Force -Confirm:$false
install-chocolateypackage winscp.install -Force -Confirm:$false
install-chocolateypackage wireshark -Force -Confirm:$false
install-chocolateypackage powershell-core -Force -Confirm:$false
install-chocolateypackage slack -Force -Confirm:$false
install-chocolateypackage discord -Force -Confirm:$false
install-chocolateypackage powertoys -Force -Confirm:$false
install-chocolateypackage tortoisegit -Force -Confirm:$false
dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart

restart-computer
