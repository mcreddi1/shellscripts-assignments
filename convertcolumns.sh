#!/bin/bash

# Sample input file (file.txt)
# Replace this with your actual data file or provide input directly in the script
file=$1

USAGE(){

    echo "USAGE: sh <scriptname> <filename>"
}


if [ $# -lt 1 ]
then
    USAGE
    exit 1
fi

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

# columns back to rows using awk
#echo ""
echo "Converted back to rows:"
#awk '{
#    for (i=1; i<=NF; i++) {
#        if (NR == 1) {
#            row[i] = $i
#        } else {
#            row[i] = row[i] " " $i
#        }
#    }
#}
#END {
#    for (i=1; i<=NF; i++) {
#        print row[i]
#    }
#}' $file


#awk '{
#    for (i=1; i<=NF; i++) {
#        # Split the column into fields using space as delimiter
#        split($i, row_values, " ")
#        # Store values in row array based on index
#        for (j=1; j<=length(row_values); j++) {
#            row[j] = (NR == 1 ? row_values[j] : row[j] " " row_values[j])
#        }
#    }
#}
#END {
#    for (j=1; j<=length(row); j++) {
#        print row[j]
#    }
#}' "$file"

echo "Converted back to rows:"
awk '{
    for (i=1; i<=NF; i++) {
        if (NR == 1) {
            num_fields = NF  # Record the number of fields in the header row
        }
        row[i] = (row[i] ? row[i] " " : "") $i  # Concatenate each field into rows
    }
}
END {
    for (i=1; i<=num_fields; i++) {
        print row[i]
    }
}' "$file"