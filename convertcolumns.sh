#!/bin/bash

# Sample input file (rows.txt)
# Replace this with your actual data file or provide input directly in the script
file=$1

echo "Original data (rows):"
cat $file
echo ""

# Convert rows to columns using awk
echo "Converted to columns:"
awk '{
    for (i=1; i<=NF; i++) {
        if (NR == 1) {
            col[i] = $i
        } else {
            col[i] = col[i] " " $i
        }
    }
}
END {
    for (i=1; i<=NF; i++) {
        print col[i]
    }
}' $file

# Convert columns back to rows using awk
echo ""
echo "Converted back to rows:"
awk '{
    for (i=1; i<=NF; i++) {
        if (NR == 1) {
            row[i] = $i
        } else {
            row[i] = row[i] " " $i
        }
    }
}
END {
    for (i=1; i<=NF; i++) {
        print row[i]
    }
}' $file
