#!/bin/bash

method_pattern='x[A-Z]\{1\}[^)]*'
arrow_namespace_path=~/Code/arrow.R/NAMESPACE

function makeMethodSnippet () {
	# create a snippet for a method.

	local method_name=$1
	local path=~/Code/arrow-snippets/$method_name.sublime-snippet

	cat <<-EOL > $path

	<snippet>
	    <description>Arrow-$method_name</description>
	    <content><![CDATA[$method_name]]></content>
		<scope>source.r</scope>
	    <tabTrigger>$method_name</tabTrigger>
	</snippet>

	EOL
}

grep -o $method_pattern $arrow_namespace_path |
while read method_name
do
	makeMethodSnippet $method_name
done
