If (-NOT ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole(`
    [Security.Principal.WindowsBuiltInRole] "Administrator"))
{
    Write-Warning "You do not have Administrator rights to run this script!`nPlease re-run this script as an Administrator!"
    Break
}

$vundle = $env:home + "\.vim\bundle\vundle"
git clone git://github.com/gmarik/vundle.git $vundle
vim +BundleInstall +qall

$ftpath=$env:home + "\.vim\bundle\xml.vim\ftplugin"
ln -v $ftpath\xml.vim $ftpath\html.vim
ln -v $ftpath\xml.vim $ftpath\xhtml.vim
ln -v $ftpath\xml.vim $ftpath\jsp.vim

$gitpath = "C:\Program Files (x86)\Git\bin"
cp ack.bat $gitpath\ack.bat
cp ack-standalone.pl $gitpath\ack-standalone.pl
