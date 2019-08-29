#!/usr/bin/env bash
function installHomebrew() {
    echo 'install homebrew start'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    echo 'homebrew install end'
}

function installIterm2AndOhMyZsh() {
    echo 'install iterm2 start'
    brew cask install iterm2
    echo 'install iterm2 complete'
    echo 'install oh my zsh start'
    sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    echo 'install oh my zsh end,but you should restart your terminal later'
}

function installIdea() {
    echo 'install idea start,it will take long time,just wait'
    brew cask install intellij-idea
    echo 'install idea end'
}

function installAndConfigGit() {
    echo 'install git start'
    brew cask install git
    echo 'install git complete'
    echo 'config git start'

    echo 'please enter your git name'
    read userName
    git config --global user.name $userName
    echo 'please enter your git email'
    read emailAddress
    git config --global user.email $emailAddress

    echo 'git config success'
}

function transferMavenSettingFile() {
    echo 'download maven settingFiles start'
    curl -o ~/Desktop/settings.xml http://s3plus.vip.sankuai.com/v1/mss_8b80ba092e4145088a62d10f25a14f36/resource/maven/local/settings.xml
    echo 'download maven settingFiles end,you can see this file at http://s3plus.vip.sankuai.com/v1/mss_8b80ba092e4145088a62d10f25a14f36/resource/maven/local/settings.xml'
    echo 'you should not install maven,because IDEA include embedded maven,trasfer settingFiles start'
    mv ~/Desktop/settings.xml ~/.m2/settings.xml
    echo 'transfer MavenSettingFile end'
}

function Main() {
  echo 'config your mac start'
  installHomebrew
  installIdea
  installIterm2AndOhMyZsh
  installAndConfigGit
  transferMavenSettingFile
  echo 'config your mac end'
  echo 'now you can start codeing'
}

#start
Main




