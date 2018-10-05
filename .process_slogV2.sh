#!/bin/bash

show_usage()
{
    echo "Usage: .process_slogV2.sh [date]"
    exit 1
}

if [ $# -eq 1 ]
then
    date="$1"
elif [ $# -eq 0 ]
then
    date=`date --date="-1 day" '+%Y-%m-%d'`
else
    show_usage
fi
file="summary.$date.txt"
outfile="summary."$date"_fixes.txt"
gvim -S ../.process_slogV2.vim -c ":w temp.txt" +q! "$file" 2>/dev/null
sleep 2
[ -f "$outfile" ] && rm "$outfile"
awk -F "\t" -f ../.process_slog.awk "temp.txt" >> "$outfile"
mv "temp.txt" "$file"
gvim -p "$file" "$outfile"
exit 0
