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

module Kernel
  def test_suite &blk
    @@r = get_config
    @@t = blk
  end
  def should_be val
    puts "[TEST CASE] #{self} (#{@@r[self]}) should be #{val}: #{@@r[self] == val}"
  end
  def should_be_over val
    puts "[TEST CASE] #{self} (#{@@r[self]}) should be over #{val}: #{@@r[self] > val}"
  end
  def run
    @@t.call
  end
end

# get config value from C
test_suite do
  "TargetServerHost".should_be               "192.168.12.251"
  "TargetServerPort".should_be               80
  "TargetDocumentPath".should_be             "/"
  "TargetServerSoftware".should_be           "Apache/2.4.4"
  "FailedRequests".should_be                 0
  "WriteErrors".should_be                    0
  "HTMLTransferred".should_be                600
  "TargetDocumentLength".should_be           6
  "TotalTransferred".should_be               27500
  "CompleteRequests".should_be               100
  "TransferRate".should_be_over              460
  "TimeTakenforTests".should_be_over         0.01
  "RequestPerSecond".should_be_over          1000
  "TimePerRequest".should_be_over            0.5
  "TimePerConcurrentRequest".should_be_over  5
end

run
