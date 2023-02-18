function poe-update-filter {
    ls '(STYLE) VAAL/*.filter' | cp -Destination "$($env:userprofile)\Documents\My Games\Path of Exile\" -force
}