#!/bin/bash

RECURSIVE=false
MOVE=false

while getopts ":rm" opt; do
  case $opt in
    r)
      RECURSIVE=true
      ;;
    m)
      MOVE=true
      ;;
    \?)
      echo "Geçersiz seçenek: -$OPTARG" >&2
      exit 1
      ;;
  esac
done

shift $((OPTIND -1))

SOURCE=$1
DEST=$2

if [ -z "$SOURCE" ] || [ -z "$DEST" ]; then
  echo "Kullanım: xcp [-r] [-m] kaynak hedef"
  exit 1
fi

if [ "$RECURSIVE" = true ]; then
  if [ ! -d "$SOURCE" ]; then
    echo "Hata: $SOURCE bir dizin değil."
    exit 1
  fi

  echo "Dizin kopyalanıyor: $SOURCE -> $DEST"

  mkdir -p "$DEST"

  (cd "$SOURCE" && tar cf - .) | pv | (cd "$DEST" && tar xvf -)

else
  # Dosya kopyalama
  if [ ! -f "$SOURCE" ]; then
    echo "Hata: $SOURCE bir dosya değil."
    exit 1
  fi

  echo "Dosya kopyalanıyor: $SOURCE -> $DEST"

  pv "$SOURCE" > "$DEST"
fi

if [ "$MOVE" = true ]; then
  echo "Kaynak siliniyor: $SOURCE"
  if [ "$RECURSIVE" = true ]; then
    rm -r "$SOURCE"
  else
    rm "$SOURCE"
  fi
fi

echo "İşlem tamamlandı"
