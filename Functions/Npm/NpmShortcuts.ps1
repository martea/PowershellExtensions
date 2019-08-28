function npm-publish-patch() {
    npm run pre-publish
    npm version patch
    npm publish
}
function npm-publish-minor() {
    npm run pre-publish
    npm version minor
    npm publish
}
function npm-publish-major() {
    npm run pre-publish
    npm version major
    npm publish
}

