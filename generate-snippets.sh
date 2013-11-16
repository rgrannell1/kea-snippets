#!/bin/bash

method_pattern='x[A-Z]\{1\}[^)]*'
arrow_namespace_path=/home/ryan/Code/Arrow/arrow-clean/NAMESPACE

function makeMethodSnippet () {
	# create a snippet for a method.

	local method_name=$1

	local path=/home/ryan/Code/Arrow/arrow-snippets/$method_name.sublime-snippet

	cat <<-EOL > $path

	<snippet>
	<content><![CDATA[$method_name()]]></content>
	<tabtrigger>x</tabtrigger>
	<scope>text.R</scope>
	<description>Method-$method_name</description>
	</snippet>

	EOL
}

grep -o $method_pattern $arrow_namespace_path |
while read method_name
do
	makeMethodSnippet $method_name
done
