#
# Usage: ./ab-mruby -m ab-mruby.conf.rb -M ab-mruby.text.rb [http[s]://]hostname[:port]/path
#

# print ab-mruby headers
print <<EOS
======================================================================
This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby

                            TEST PHASE

======================================================================
EOS

# get config value from C
p get_config
