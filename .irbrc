require 'pp'
# require 'irb/completion'
require 'irb/ext/save-history'

# use rubygems
require 'awesome_print'
require 'wirble'
require 'bond'
require 'what_methods'
Wirble.init(:skip_prompt => :DEFAULT)
Wirble.colorize

# configuration
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT_MODE]  = :SIMPLE
