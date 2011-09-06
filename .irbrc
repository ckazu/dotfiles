require 'pp'
require 'irb/completion'
require 'irb/ext/save-history'

# use rubygems
unless Class.const_defined?(:Rails)
  require 'awesome_print'
  require 'bond'
  require 'what_methods'
  require 'ir_b'
  require 'g'
  require 'wirble'
  Wirble.init(:skip_prompt => :DEFAULT)
  Wirble.colorize
end

# configuration
IRB.conf[:AUTO_INDENT] = true
IRB.conf[:USE_READLINE] = true
IRB.conf[:SAVE_HISTORY] = 1000
IRB.conf[:PROMPT_MODE]  = :SIMPLE
