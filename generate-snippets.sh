#!/bin/bash

method_pattern='x[A-Z]\{1\}[^)]*'

kea_namespace_path=~/Code/kea.R/NAMESPACE
kea_snippets_path=~/Code/kea-snippets

find $kea_snippets_path -name '*.sublime-snippet' -delete

function makeMethodSnippet () {
	# create a snippet for a method.

	local method_name=$1
	local path=$kea_snippets_path/$method_name.sublime-snippet

	cat <<-EOL > $path

	<snippet>
	    <description>Kiwi-$method_name</description>
	    <content><![CDATA[$method_name]]></content>
		<scope>source.r</scope>
	    <tabTrigger>$method_name</tabTrigger>
	</snippet>

	EOL
}

grep -o $method_pattern $kea_namespace_path |
while read method_name
do
	makeMethodSnippet $method_name
done
