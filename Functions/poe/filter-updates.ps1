function poe-update-filter {
    ls '*.filter' | cp -Destination "$($env:userprofile)\Documents\My Games\Path of Exile\" -force
}