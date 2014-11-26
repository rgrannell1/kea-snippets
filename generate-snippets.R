#!/usr/bin/env Rscript

require(kea)





"
<snippet>
<description>%s</description>
<content><![CDATA[%s]]></content>
<scope>source.r</scope>
<tabTrigger>%s</tabTrigger>
</snippet>
" -> template

make_snippet <- (method_name : description) := {
	sprintf(template, description, method_name, method_name)
}





x_(ls('package:kea'))                             $
xSelect(
	xIsMatch('^x[A-Z].*?'))                       $
xRelate(fn_name := {

	args <- x_( getNamespace('kea') [[fn_name]] ) $ xParamsOf() $ x_Implode(', ')

	xFromChars_(fn_name, '(', args, ')')

})                                                $
xMap(
	xJuxtapose_(
		xFirstOf,
		xApply(make_snippet)) )                   $
xMap(
	xJuxtapose_(
		xFirstOf %then% (str := xFromChars_(str, '.sublime-snippet')),
		xSecondOf))                               $
xDo(
	xApply(xWrite))
