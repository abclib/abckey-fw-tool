#!/bin/bash
# demo: ./mark.sh ./dist/mark.bin

readonly PBK_1="PBK_1"
readonly PBK_2="PBK_2"
readonly PBK_3="PBK_3"

f_sha256d() {
  echo -n $(sha256sum -b $1 | head -c 64) | xxd -r -p | sha256sum | cut -d ' ' -f 1
}

f_fileInfo() {
  echo ""
  echo "FileName: $1"
  echo "FileSize: $(wc -c <$1) bytes"
  echo "FileHash: $(f_sha256d $1)"
  echo ""
}

f_main() {
  rm -f $1
  echo -e -n 'TRZF' >>$1
  echo -e -n '\x00\x00\x00\x00' >>$1
   # key_index
  echo -e -n '\x00' >>$1
   # key_index
  echo -e -n '\x00' >>$1
   # key_index
  echo -e -n '\x00' >>$1
   # flags
  echo -e -n '\x00' >>$1
  # reserved
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  # signatures
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  # signatures
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  # signatures
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  echo -e -n '\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00\x00' >>$1
  
  f_fileInfo $1
}

f_main "$@"