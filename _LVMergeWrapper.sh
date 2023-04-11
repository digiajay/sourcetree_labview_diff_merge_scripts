#!/bin/bash

# Method to determine absolute path
# The -W parameter on the pwd command is necessary to return the Windows version of the path.
# Not using the -W parameter will result in a conversion of temp directory to a 'tmp' path meaningful only in the Linux #

environment.
# Piping the result through tr '/' '\\' translates the forward slashes to backslashes.
# Windows understands forward slashes, but LVMerge.exe does not.

abspath () {
(
DIR=$(dirname "$1")
FN=$(basename "$1")
cd "$DIR"
printf "%s/%s" "$(pwd -W)" "$FN" | tr '/' '\\'
)
}


lvmerge="C:\\Program Files\\National Instruments\\Shared\\LabVIEW Merge\\LVMerge.exe"
lvversion="C:\\Program Files\\National Instruments\\LabVIEW 2020\\LabVIEW.exe"
mine=$(abspath "$1")
theirs=$(abspath "$2")
base=$(abspath "$3")
merge_output=$(abspath "$4")

#Format it as: LVMerge LabVIEW base.vi theirs.vi yours.vi merge_output.vi.
exec "$lvmerge" "$base" "$theirs" "$mine" "$merge_output"
#Sourcetree configuration as \"$LOCAL\" \"$REMOTE\" \"$BASE\" \"$MERGED\"

#BACKUP exec "$lvmerge" -nobdpos -nofppos "$base" "$theirs" "$mine" "$merge_output"

# For the options, see https://www.ni.com/docs/en-US/bundle/labview/page/lvhowto/configmerge_thirdparty.html