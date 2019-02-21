PAGE_HASH = '{ revisions: Array<Hash<Symbol, String>>, title: String, fullurl: String, editurl: String, extract: String, summary: String, categories: Array<{ title: String }>, links: Array<{ title: String }>, extlinks: Array<Hash<Symbol, String>>, langlinks: Array<Hash<Symbol, String>>, thumbnail: Array<Hash<Symbol, String>>, pageid: Integer, ns: String, images: Array<Hash<Symbol, String>> }'

require 'rdl'
require 'types/core'
require 'wikipedia'
require 'json'

puts "Type checking Wikipedia Gem methods..."

# Type checked methods below
RDL.type Wikipedia::Page, :initialize, '(String) -> self', wrap: false, typecheck: :later
RDL.type Wikipedia::Page, :page, "() -> #{PAGE_HASH}", wrap: false, typecheck: :never
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
RDL.type Wikipedia::Page, :images, '() -> Array<String>', wrap: false, typecheck: :later

# Type annotations for variables and unchecked methods are below.
RDL.var_type Wikipedia::Page, '@json', 'String'
RDL.var_type Wikipedia::Page, '@data', "{ normalized: Array<Hash<Symbol, String>>, query: { pages: { k: #{PAGE_HASH} } } }"
RDL.type JSON, 'self.parse', '(String, { symbolize_names: true }) -> %bot', wrap: false


## Call `do_typecheck` to type check methods with :later tag
## The second argument is optional and is used for printing configurations.
RDL.do_typecheck :later, (ENV["NODYNCHECK"] || ENV["TYPECHECK"])

