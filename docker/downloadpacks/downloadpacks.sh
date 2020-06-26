#!/bin/bash -xe

workdir="$(dirname "$0")"

_download_pack() {
  _output_file=${1?"output file"}
  _pack_url=${2?"output file"}
  mkdir -p "target/downloadpacks"
  wget --progress=dot -e dotbytes=1M -c \
    -O "target/downloadpacks/$_output_file" "$_pack_url" || true
}

cmd_download() {
  if ! cmd_hashcheck; then
    _download_pack "zookeeper.tar.gz" 'http://us.mirrors.quenda.co/apache/zookeeper/zookeeper-3.6.1/apache-zookeeper-3.6.1-bin.tar.gz'
    _download_pack "kafka.tgz" 'https://downloads.apache.org/kafka/2.5.0/kafka-2.5.0-src.tgz'
  fi
}

cmd_hashgen(){
  find target -type f | xargs sha256sum -b > SHA256.downloadpacks.txt
}

cmd_hashcheck(){
  sha256sum -c SHA256.downloadpacks.txt
}

cd "$workdir"
_cmd=${1?'command'}
shift
cmd_${_cmd} "$@"
cd -
