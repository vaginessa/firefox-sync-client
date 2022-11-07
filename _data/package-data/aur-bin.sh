#!/bin/bash

set -o nounset   # disallow usage of unset vars  ( set -u )
set -o errexit   # Exit immediately if a pipeline returns non-zero.  ( set -e )
set -o errtrace  # Allow the above trap be inherited by all functions in the script.  ( set -E )
set -o pipefail  # Return value of a pipeline is the value of the last (rightmost) command to exit with a non-zero status
IFS=$'\n\t'      # Set $IFS to only newline and tab.

cd "$(dirname "$0")/aur-bin"

version="$(cd ../../../ && git tag --sort=-v:refname | grep -P 'v[0-9\.]' | head -1 | cut -c2-)"
cs0="$(cd ../../../ && sha256sum _out/ffsclient_linux-amd64 | cut -d ' ' -f 1)"

echo "Version: ${version} (${cs0})"

sed --regexp-extended  -i "s/pkgver=[0-9\.]+/pkgver=${version}/g"         PKGBUILD
sed --regexp-extended  -i "s/_bin_sha='[A-Za-z0-9]'+/_bin_sha='${cs0}'/g" PKGBUILD

namcap PKGBUILD
makepkg --printsrcinfo > .SRCINFO
# makepkg #(do not makepkg, release is probably not live)

git clean -ffdX


cd ../../../
git clone ssh://aur@aur.archlinux.org/ffsclient-bin.git _out/ffsclient-bin
cp -v _data/package-data/aur-bin/PKGBUILD _out/ffsclient-bin/PKGBUILD
cp -v _data/package-data/aur-bin/.SRCINFO _out/ffsclient-bin/.SRCINFO


cd _out/ffsclient-bin

git add PKGBUILD
git add .SRCINFO

git commit -m "v${version}"

# git push manually (!)
