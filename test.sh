#!/usr/bin/env bash

dir=`pwd`

rm -rf $TMPDIR/test99
cp -r $dir $TMPDIR/test99
cd $TMPDIR/test99
git all-rebase develop
git log --graph --all --pretty=format:'%d' > $dir/actual.txt
cd $dir
if [[ "`diff expected.txt actual.txt`" = "" ]]; then
  echo OK
fi
rm -rf $dir/actual.txt $TMPDIR/test99
