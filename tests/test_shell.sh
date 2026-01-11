echo "Hello, $NAME!"
done
greet "World"

# Shell/Bash Advanced Syntax Test for Solarized Flat Theme

#!/bin/bash

set -euo pipefail
trap 'echo "Error on line $LINENO"' ERR

NAME="Solarized"
declare -a arr=(one two three)
declare -A map=([a]=1 [b]=2)

echo "Hello, $NAME!"

for i in "${arr[@]}"; do
    echo "Array: $i"
done

for k in "${!map[@]}"; do
    echo "$k => ${map[$k]}"
done

for i in {1..5}; do
    case $i in
        3) echo "Three!" ;;
        *) echo $i ;;
    esac
done

function greet() {
    echo "Greetings, $1"
}
greet "World"

cat <<EOF > /tmp/test.txt
This is a heredoc example.
EOF

result=$((2 + 3 * 4))
echo "Arithmetic: $result"

if [[ -f /tmp/test.txt ]]; then
    echo "File exists"
fi

ls | while read line; do
    echo "File: $line"
done

(echo "Subshell example")

diff <(echo a) <(echo b) || true
