#Bash Script for installation testing

#Need to add commands to test it...
echo "Testing Basic dependencies:"
for cmd in "git" "gcc" "g++" "autoconf" "automake" "libtool" "python" "make" ; do
  printf "%-30s" "$cmd"
  if hash "$cmd" 2>/dev/null; then printf "OK\n"; else printf "missing\n"; fi
done

echo -e "\nTesting Basic command line editor installations:"
for cmd in "rlwrap" "emacs" "nano"; do
  printf "%-10s" "$cmd"
  if hash "$cmd" 2>/dev/null; then printf "OK\n"; else printf "missing\n"; fi
done

echo -e "\nTesting Node.JS installations:"
for cmd in "node" "nvm" "npm" "heroku" "foreman"; do
  printf "%-30s" "$cmd"
  if hash "$cmd" 2>/dev/null; then printf "OK\n"; else printf "missing\n"; fi
done

echo -e "\nTesting MEAN JS Stack installations:"
for cmd in "mongo" "mongod" "mean" "bower" "grunt"; do
  printf "%-30s" "$cmd"
  if hash "$cmd" 2>/dev/null; then printf "OK\n"; else printf "missing\n"; fi
done
