
#Git shortcuts
function fetch {
    git fetch --all --verbose
}
function master {
    git fetch origin 
    git checkout master
}
function dev {
    git fetch origin
    git checkout dev
}
function new-release($name) {
    $name = "release/$($name)"
    git pull
    git checkout -b "$($name)"
    git push -u origin "$($name)"
}

function new-feature($name) {
    $name = "feature/$($name)"
    git checkout -b "$($name)"
    git push -u origin "$($name)"
}
function new-hotfix($name) {
    $name = "hotfix/$($name)"
    git checkout -b "$($name)"
    git push -u origin "$($name)"
}

function glog {
    Write-Host "Print git log and with oneline custom format"
    git log --pretty=format:'%h %ad %s | %an' --date=short
}



function gs {
    git status
}
function clone($url) {
    git clone --recursive -j 8 $url
}
function update() {
    git pull
    git pull --recurse-submodules
}
function update-latest() {
    git pull
    git submodule update --recursive --remote
}
function prune-check() {
    git remote prune origin --dry-run
}
function prune() {
    git remote prune origin
}
function update-from-master() {
    git fetch
    git merge origin/master
    update

}
function update-from-develop() {
    git fetch
    git merge origin/develop
    update
}
function gco($message) {
    git add . | Out-Host
    git commit -am $message | Out-Host
}
# function gcob($message) {
#     $featName = $message

#     $newBranch = "feature/${$featName}";
#     git checkout -b $newBranch
#     git add . | Out-Host
#     git commit -am $message | Out-Host
#     git push -u origin $newBranch
# }

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
    git remote add $repo "git@github.com:$($repo).git"
    git fetch $repo
    git cherry-pick $hash -x
    git status
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