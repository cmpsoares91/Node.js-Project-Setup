#Bash Script for installation testing

#Need to add commands to test it...
for cmd in "latex" "pandoc"; do
  printf "%-10s" "$cmd"
  if hash "$cmd" 2>/dev/null; then printf "OK\n"; else printf "missing\n"; fi
done
