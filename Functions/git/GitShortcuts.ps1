
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

function git-log {
    Write-Host "Print git log and with oneline custom format"
    git log --pretty=format:'%h %ad %s | %an' --date=short
}


function git-log-refs($refPath) {
    if ($refPath.Length -gt 3) {
        $ref = $refPath;
    }
    else {
        $ref = "refs/remotes/origin";
    }
    
    git for-each-ref --sort=committerdate $ref --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))' 
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
    git fetch --all
    git merge origin/master
}
function update-from-develop() {
    git fetch --all
    git merge origin/develop
}
function gco($message) {
    git add . | Out-Host
    git commit -am $message | Out-Host
}

function Edit-Git-Global-Config {
    editor $env:USERPROFILE\.gitconfig
}

Function Open-PullRequest-To([string]$targetRef = "master") {
    if (-not (Get-Command git)) {
        Write-Host 'Could not find git!' -ForegroundColor Red
        return;
    }

    $branch = git rev-parse --abbrev-ref HEAD
    $remote = git remote get-url origin

    # This repo uses SSH
    if ($remote.startsWith('git@ssh.')) {
        $remote = $remote.replace('git@ssh.dev.azure.com:v3/', '')
        $remote = $remote.split('/')
        $remote = "$($remote[0])/$($remote[1])/_git/$($remote[2])"
        $url = "https://dev.azure.com/$remote/pullrequestcreate?sourceRef=$branch&targetRef=$targetRef"

        # Open default browser
        Start-Process $url
    }
    # This repo uses HTTPS
    else {
        $remote = $remote.split('@')
        $remote = $remote[1]
        $url = "https://$remote/pullrequestcreate?sourceRef=$branch&targetRef=$targetRef"

        # Open default browser
        Start-Process $url
    }
}