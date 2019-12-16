#!/bin/bash
# demo: ./align.sh ./test/boot.bin ./dist/_boot.bin 32768

f_sha256d() {
  echo -n `sha256sum -b $1 | head -c 64` | xxd -r -p | sha256sum | head -c 64
}

f_fileInfo() {
  echo ""
  echo "FileName: $1"
  echo "FileSize: `wc -c < $1` bytes"
  echo "FileHash: `f_sha256d $1`"
  echo ""
}

f_main() {
  cp -f -p $1 $2
  readonly file_size=`wc -c < $2`
  readonly total_size=$3
  echo `printf %0$[$[$total_size - $file_size] * 2]d 0` | xxd -r -ps >> $2
  f_fileInfo $1 
  f_fileInfo $2
}

f_main "$@"
