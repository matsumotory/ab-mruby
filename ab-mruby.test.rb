#
# Usage: ./ab-mruby -m ab-mruby.conf.rb -M ab-mruby.text.rb [http[s]://]hostname[:port]/path
#
# TEST PARAMETERS
#
# "TargetURL"
# "TargetHost"
# "TargetPort"
# "TargetPath"
# "TargetisSSL"
# "TargetServerSoftware"
# "TargetServerHost"
# "TargetServerPort"
# "TargetServerSSLInfo"         # if use SSL
# "TargetDocumentPath"
# "TargetDocumentLength"
# "TimeTakenforTests"
# "CompleteRequests"
# "FailedRequests"
# "ConnetcErrors"               # if FailedRequests > 0
# "ReceiveErrors"               # if FailedRequests > 0
# "LengthErrors"                # if FailedRequests > 0
# "ExceptionsErrors"            # if FailedRequests > 0
# "WriteErrors"
# "Non2xxResponses"             # if Non2xxResponse > 0
# "KeepAliveRequests"
# "TotalTransferred"
# "TotalBodySent"               # if body send
# "HTMLTransferred"
# "RequestPerSecond"
# "TimePerConcurrentRequest"
# "TimePerRequest"
# "TransferRate"
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
  def should_be_under val
    puts "[TEST CASE] #{self} (#{@@r[self]}) should be under #{val}: #{@@r[self] < val}"
  end
  def test_run
    @@t.call
  end
end

test_suite do
  "TargetServerHost".should_be               "192.168.12.251"
  "TargetServerPort".should_be               80
  "TargetDocumentPath".should_be             "/"
  "TargetServerSoftware".should_be           "Apache/2.4.4"
  "FailedRequests".should_be                 0
  "KeepAliveRequests".should_be              0
  "WriteErrors".should_be                    0
  "HTMLTransferred".should_be                600
  "TargetDocumentLength".should_be           6
  "TotalTransferred".should_be               27500
  "CompleteRequests".should_be               100
  "TransferRate".should_be_over              460
  "TimeTakenforTests".should_be_under        0.01
  "RequestPerSecond".should_be_over          1000
  "TimePerRequest".should_be_under           0.5
  "TimePerConcurrentRequest".should_be_under 5
  "TotalBodySent".should_be                  0
  "ConnetcErrors".should_be                  0
  "ReceiveErrors".should_be                  0
  "LengthErrors".should_be                   0
  "ExceptionsErrors".should_be               0
  "Non2xxResponses".should_be                0
end

test_run
