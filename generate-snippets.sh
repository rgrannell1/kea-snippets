#!/bin/bash

method_pattern='x[A-Z]\{1\}[^)]*'
arrow_namespace_path=/home/ryan/Code/Arrow/arrow-clean/NAMESPACE

function makeSnippet () {

	local method_name=$1
	local snippet_path=/home/ryan/Code/Arrow/arrow-snippets/$method_name.sublime-snippet

	"
	<snippet>
		<content><![CDATA[$method_name()]]></content>
	 	<tabtrigger>x</tabtrigger>
		<scope>text.R</scope>
		<description>Method-$method_name</description>
	</snippet>" > $snippet_path
}

grep -o $method_pattern $arrow_namespace_path |
while read line
do
	makeSnippet $line
done
