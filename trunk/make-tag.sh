#!/bin/sh
url=$(svn info | awk '/^URL:/{gsub("/trunk$", "", $2); print $2}')
rev=$(svn info | awk '/^Revision:/{print $2}')

version=$(awk -F, '/AC_INIT/{print $2}' configure.ac | tr -d '[ ]')
tag="$version"

echo "Making tag: $tag at revision $rev"
echo ""
echo "Press ENTER to continue..."
read a

svn cp $url/trunk $url/tags/$tag
