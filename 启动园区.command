#!/bin/sh
set -eu

cd "$(dirname "$0")"
port=8785
url="http://127.0.0.1:$port/"

serves_this_project() {
  curl --noproxy '*' -fsS --max-time 2 "$url" 2>/dev/null | cmp -s - index.html
}

if serves_this_project; then
  open "$url"
  exit
fi

python3 -m http.server "$port" --bind 127.0.0.1 &
server_pid=$!
trap 'kill "$server_pid" 2>/dev/null || true' EXIT
trap 'exit 0' INT TERM

for attempt in 1 2 3 4 5; do
  if ! kill -0 "$server_pid" 2>/dev/null; then
    break
  fi
  if serves_this_project; then
    open "$url"
    wait "$server_pid"
    exit
  fi
  sleep 1
done

printf '无法启动园区预览。请检查 Python 3 是否可用、%s 端口是否被占用。\n' "$port" >&2
exit 1
