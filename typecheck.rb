PAGE_HASH = '{ revisions: Array<String>, title: String, fullurl: String, editurl: String, extract: String, summary: String, categories: Array<{ title: String }>, links: Array<{ title: String }>, extlinks: Array<Hash<String, String>>, langlinks: Array<Hash<String, String>> }'

require 'rdl'
require 'types/core'
require 'wikipedia'
require 'json'

RDL.var_type Wikipedia::Page, '@json', 'String'
RDL.var_type Wikipedia::Page, '@data', "{ query: { pages: { k: #{PAGE_HASH} } } }"
RDL.type JSON, 'self.parse', '(String) -> %bot', wrap: false

RDL.type Wikipedia::Page, :initialize, '(String) -> self', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :page, "() -> #{PAGE_HASH}", wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :content, '() -> String', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :sanitized_content, '() -> String', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, 'self.sanitize', '(String) -> String', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :redirect?, '() -> MatchData or String', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :redirect_title, '() -> String', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :title, '() -> String', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :fullurl, '() -> String', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :editurl, '() -> String', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :text, '() -> String', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :summary, '() -> String', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :categories, '() -> Array<String>', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :links, '() -> Array<String>', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :extlinks, '() -> Array<String>', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :langlinks, '() -> Hash<String, String>', wrap: false, typecheck: :later
# RDL.type Wikipedia::Page, :images, '() -> Array<String>', wrap: false, typecheck: :later
# RDL.type Wikipedia::Page, :image_url, '() -> Array<String>', wrap: false, typecheck: :later
# RDL.type Wikipedia::Page, :image_thumburl, '() -> Array<String>', wrap: false, typecheck: :later
# RDL.type Wikipedia::Page, :image_descriptionurl, '() -> Array<String>', wrap: false, typecheck: :later


start = Time.now
RDL.do_typecheck :later
finish = Time.now
puts(finish - start)
