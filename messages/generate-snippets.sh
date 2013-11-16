#!/bin/bash

namespace_location=/home/ryan/Code/Arrow/arrow-clean/NAMESPACE





grep 'x[A-Z]\{1\}[^)]*' namespace_location |
while read line; do
	echo $line
done
