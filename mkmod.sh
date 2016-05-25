#!/bin/bash
branch=$(git rev-parse --abbrev-ref HEAD)
mkdir -p "ParrotMod/$branch"
mv ParrotMod_N7105_${branch}_2*.zip $branch/ 2>/dev/null
date=$(date +%Y-%m-%d_%H.%M.%S)
cd "$(dirname "$0")/zip"
rm -rf ../ParrotMod_N7105_${branch}_${date}.zip
find . -name '.DS_Store' -delete
zip -9 -r -q ../ParrotMod_N7105_${branch}_${date}.zip * 
du -h ../ParrotMod_N7105_${branch}_${date}.zip
cd ..
mv ParrotMod_N7105_${branch}_2*.zip ParrotMod/$branch/ 2>/dev/null
cd ParrotMod/$branch
cn=1
for i in `echo ParrotMod_N7105_${branch}_2*.zip | tr ' ' '\n' | sort -r`; do 
	[ "$cn" -gt 4 ] && rm "$i"
	cn=$(($cn+1))
done
