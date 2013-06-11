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

module Kernel
  def test_suite &blk
    @@r = get_config
    @@t = blk
    @@result = true
  end
  def bln_color val
    (val) ? "[\e[33m#{val}\e[m]" : "[\e[36m#{val}\e[m]"
  end
  def should_be val
    ret = @@r[self] == val
    puts "[TEST CASE] #{bln_color ret} #{self} (#{@@r[self]}) should be #{val}"
    @@result = ret if ret == false
  end
  def should_be_over val
    ret = @@r[self] > val
    puts "[TEST CASE] #{bln_color ret} #{self} (#{@@r[self]}) should be over #{val}"
    @@result = ret if ret == false
  end
  def should_be_under val
    ret = @@r[self] < val
    puts "[TEST CASE] #{bln_color ret} #{self} (#{@@r[self]}) should be under #{val}"
    @@result = ret if ret == false
  end
  def test_run
    @@t.call
    puts "\ntest suites: #{bln_color @@result}\n"
  end
end

print <<EOS
======================================================================
This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby

                            TEST PHASE

======================================================================
EOS

if get_config["TargetHost"] == "blog.example.jp"

  test_suite do
    "TargetServerHost".should_be                 "blog.example.jp"
    "TargetServerPort".should_be                 80
    "TargetDocumentPath".should_be               "/"
    "TargetServerSoftware".should_be             "nginx/1.4.1"
    "FailedRequests".should_be                   0
    "KeepAliveRequests".should_be                0
    "WriteErrors".should_be                      0
    "HTMLTransferred".should_be_over             0
    "TargetDocumentLength".should_be_over        0
    "TotalTransferred".should_be_over            0
    "CompleteRequests".should_be                 100
    "TransferRate".should_be_over                4000
    "TimeTakenforTests".should_be_under          5
    "RequestPerSecond".should_be_over            40
    "TimePerRequest".should_be_under             20
    "TimePerConcurrentRequest".should_be_under   200
    "TotalBodySent".should_be                    0
    "ConnetcErrors".should_be                    0
    "ReceiveErrors".should_be                    0
    "LengthErrors".should_be                     0
    "ExceptionsErrors".should_be                 0
    "Non2xxResponses".should_be                  0
  end

elsif get_config["TargetHost"] == "moblog.example.jp"

  test_suite do
    "TargetServerHost".should_be                 "moblog.example.jp"
    "TargetServerPort".should_be                 80
    "TargetDocumentPath".should_be               "/"
    "TargetServerSoftware".should_be             "nginx/1.4.1"
    "FailedRequests".should_be                   0
    "KeepAliveRequests".should_be                0
    "WriteErrors".should_be                      0
    "HTMLTransferred".should_be_over             0
    "TargetDocumentLength".should_be_over        0
    "TotalTransferred".should_be_over            0
    "CompleteRequests".should_be                 200
    "TransferRate".should_be_over                500
    "TimeTakenforTests".should_be_under          5
    "RequestPerSecond".should_be_over            40
    "TimePerRequest".should_be_under             30
    "TimePerConcurrentRequest".should_be_under   500
    "TotalBodySent".should_be                    0
    "ConnetcErrors".should_be                    0
    "ReceiveErrors".should_be                    0
    "LengthErrors".should_be                     0
    "ExceptionsErrors".should_be                 0
    "Non2xxResponses".should_be                  0
  end

elsif get_config["TargetHost"] == "example.org"

  test_suite do
    "TargetServerHost".should_be                 "example.org"
    "TargetServerPort".should_be                 443
    "TargetDocumentPath".should_be               "/"
    "TargetServerSoftware".should_be             "nginx/1.4.1"
    "FailedRequests".should_be                   0
    "KeepAliveRequests".should_be                0
    "WriteErrors".should_be                      0
    "HTMLTransferred".should_be_over             0
    "TargetDocumentLength".should_be_over        0
    "TotalTransferred".should_be_over            0
    "CompleteRequests".should_be                 300
    "TransferRate".should_be_over                500
    "TimeTakenforTests".should_be_under          30
    "RequestPerSecond".should_be_over            10
    "TimePerRequest".should_be_under             100
    "TimePerConcurrentRequest".should_be_under   3000
    "TotalBodySent".should_be                    0
    "ConnetcErrors".should_be                    0
    "ReceiveErrors".should_be                    0
    "LengthErrors".should_be                     0
    "ExceptionsErrors".should_be                 0
    "Non2xxResponses".should_be                  0
  end

else

  test_suite do
    "FailedRequests".should_be                   0
    "WriteErrors".should_be                      0
    "CompleteRequests".should_be                 100
    "TransferRate".should_be_over                500
    "RequestPerSecond".should_be_over            1000
    "TimePerRequest".should_be_under             100
    "TimePerConcurrentRequest".should_be_under   3000
    "ConnetcErrors".should_be                    0
    "ReceiveErrors".should_be                    0
    "LengthErrors".should_be                     0
    "ExceptionsErrors".should_be                 0
    "Non2xxResponses".should_be                  0
  end

end

test_run
