
#Git shortcuts
function fetch {
    git.exe fetch --all --verbose
}
function master {
    git.exe fetch origin 
    git.exe checkout master
}
function dev {
    git.exe fetch origin
    git.exe checkout dev
}
function new-release($name) {
    $name = "release/$($name)"
    git.exe pull
    git.exe checkout -b "$($name)"
    git.exe push -u origin "$($name)"
}

function new-feature($name) {
    $name = "feature/$($name)"
    git.exe checkout -b "$($name)"
    git.exe push -u origin "$($name)"
}
function new-hotfix($name) {
    $name = "hotfix/$($name)"
    git.exe checkout -b "$($name)"
    git.exe push -u origin "$($name)"
}

function glog {
    Write-Host "Print git log and with oneline custom format"
    git.exe log --pretty=format:'%h %ad %s | %an' --date=short
}



function gs {
    git.exe status
}
function clone($url) {
    git.exe clone --recursive -j 8 $url
}
function update() {
    git.exe pull
    git.exe submodule update --recursive
}
function prune-check() {
    git.exe remote prune origin --dry-run
}
function prune() {
    git.exe remote prune origin
}

function gco($message) {
    git.exe add . | Out-Host
    git.exe commit -am $message | Out-Host
}

function git-cherry($url) {

    #TODO: Update with pullrequest commit, it has more segemnts, isolate the commit/<commitId> instead
    #url ex 
    #split
    #0 https:
    #1
    #2 SRC
    #3 ORG
    #4 REPO
    #5 commit
    #6 <commitid>
    $urlData = $url.Split("/")
    $repo = "$($urlData[3])/$($urlData[4])"
    $hash = $urlData[6]
    git.exe remote add $repo "git@github.com:$($repo).git"
    git.exe fetch $repo
    git.exe cherry-pick $hash -x
    git.exe status
    # $KeyOption = 'Y','N'
    # while ($KeyOption -notcontains $KeyPress.Character) {
    #  $KeyPress = $host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    # }
    # if($KeyPress -eq 'Y'){
    #     git mergetool
    # }
    # git add --all
    # git commit -m "CODESHARE: $($repo):$($hash)"
}

function Edit-Git-Global-Config {
    editor $env:USERPROFILE\.gitconfig
}