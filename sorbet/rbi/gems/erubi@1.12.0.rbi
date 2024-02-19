# typed: false

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `erubi` gem.
# Please instead update this file by running `bin/tapioca gem erubi`.

# source://erubi//lib/erubi.rb#3
module Erubi
  class << self
    def h(_arg0); end
  end
end

# source://erubi//lib/erubi.rb#54
class Erubi::Engine
  # Initialize a new Erubi::Engine.  Options:
  # +:bufval+ :: The value to use for the buffer variable, as a string (default <tt>'::String.new'</tt>).
  # +:bufvar+ :: The variable name to use for the buffer variable, as a string.
  # +:chain_appends+ :: Whether to chain <tt><<</t> calls to the buffer variable. Offers better
  #                     performance, but can cause issues when the buffer variable is reassigned during
  #                     template rendering (default +false+).
  # +:ensure+ :: Wrap the template in a begin/ensure block restoring the previous value of bufvar.
  # +:escapefunc+ :: The function to use for escaping, as a string (default: <tt>'::Erubi.h'</tt>).
  # +:escape+ :: Whether to make <tt><%=</tt> escape by default, and <tt><%==</tt> not escape by default.
  # +:escape_html+ :: Same as +:escape+, with lower priority.
  # +:filename+ :: The filename for the template.
  #              the resulting source code.  Note this may cause problems if you are wrapping the resulting
  #              source code in other code, because the magic comment only has an effect at the beginning of
  #              the file, and having the magic comment later in the file can trigger warnings.
  # +:freeze_template_literals+ :: Whether to suffix all literal strings for template code with <tt>.freeze</tt>
  #                                (default: +true+ on Ruby 2.1+, +false+ on Ruby 2.0 and older).
  #                                Can be set to +false+ on Ruby 2.3+ when frozen string literals are enabled
  #                                in order to improve performance.
  # +:literal_prefix+ :: The prefix to output when using escaped tag delimiters (default <tt>'<%'</tt>).
  # +:literal_postfix+ :: The postfix to output when using escaped tag delimiters (default <tt>'%>'</tt>).
  # +:outvar+ :: Same as +:bufvar+, with lower priority.
  # +:postamble+ :: The postamble for the template, by default returns the resulting source code.
  # +:preamble+ :: The preamble for the template, by default initializes the buffer variable.
  # +:regexp+ :: The regexp to use for scanning.
  # +:src+ :: The initial value to use for the source code, an empty string by default.
  # +:trim+ :: Whether to trim leading and trailing whitespace, true by default.
  #
  # @return [Engine] a new instance of Engine
  #
  # source://erubi//lib/erubi.rb#94
  def initialize(input, properties = T.unsafe(nil)); end

  # The variable name used for the buffer variable.
  #
  # source://erubi//lib/erubi.rb#65
  def bufvar; end

  # The filename of the template, if one was given.
  #
  # source://erubi//lib/erubi.rb#62
  def filename; end

  # The frozen ruby source code generated from the template, which can be evaled.
  #
  # source://erubi//lib/erubi.rb#59
  def src; end

  private

  # Add ruby code to the template
  #
  # source://erubi//lib/erubi.rb#226
  def add_code(code); end

  # Add the given ruby expression result to the template,
  # escaping it based on the indicator given and escape flag.
  #
  # source://erubi//lib/erubi.rb#235
  def add_expression(indicator, code); end

  # Add the result of Ruby expression to the template
  #
  # source://erubi//lib/erubi.rb#244
  def add_expression_result(code); end

  # Add the escaped result of Ruby expression to the template
  #
  # source://erubi//lib/erubi.rb#249
  def add_expression_result_escaped(code); end

  # Add the given postamble to the src.  Can be overridden in subclasses
  # to make additional changes to src that depend on the current state.
  #
  # source://erubi//lib/erubi.rb#255
  def add_postamble(postamble); end

  # Add raw text to the template.  Modifies argument if argument is mutable as a memory optimization.
  # Must be called with a string, cannot be called with nil (Rails's subclass depends on it).
  #
  # source://erubi//lib/erubi.rb#213
  def add_text(text); end

  # Raise an exception, as the base engine class does not support handling other indicators.
  #
  # @raise [ArgumentError]
  #
  # source://erubi//lib/erubi.rb#261
  def handle(indicator, code, tailch, rspace, lspace); end

  # Make sure that any current expression has been terminated.
  # The default is to terminate all expressions, but when
  # the chain_appends option is used, expressions may not be
  # terminated.
  #
  # source://erubi//lib/erubi.rb#289
  def terminate_expression; end

  # Make sure the buffer variable is the target of the next append
  # before yielding to the block. Mark that the buffer is the target
  # of the next append after the block executes.
  #
  # This method should only be called if the block will result in
  # code where << will append to the bufvar.
  #
  # source://erubi//lib/erubi.rb#271
  def with_buffer; end
end

# The default regular expression used for scanning.
#
# source://erubi//lib/erubi.rb#56
Erubi::Engine::DEFAULT_REGEXP = T.let(T.unsafe(nil), Regexp)

# source://erubi//lib/erubi.rb#17
Erubi::FREEZE_TEMPLATE_LITERALS = T.let(T.unsafe(nil), TrueClass)

# source://erubi//lib/erubi.rb#15
Erubi::MATCH_METHOD = T.let(T.unsafe(nil), Symbol)

# source://erubi//lib/erubi.rb#8
Erubi::RANGE_FIRST = T.let(T.unsafe(nil), Integer)

# source://erubi//lib/erubi.rb#9
Erubi::RANGE_LAST = T.let(T.unsafe(nil), Integer)

# source://erubi//lib/erubi.rb#16
Erubi::SKIP_DEFINED_FOR_INSTANCE_VARIABLE = T.let(T.unsafe(nil), TrueClass)

# source://erubi//lib/erubi.rb#4
Erubi::VERSION = T.let(T.unsafe(nil), String)
