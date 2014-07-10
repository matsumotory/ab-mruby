#
# Usage: ./ab-mruby -m ab-mruby.conf.rb -M ab-mruby.text.rb [http[s]://]hostname[:port]/path
#
# BENCHMARK RESULT AND TEST PARAMETERS
#
# get_config "TargetURL"
# get_config "TargetHost"
# get_config "TargetPort"
# get_config "TargetPath"
# get_config "TargetisSSL"
# get_config "TargetServerSoftware"
# get_config "TargetServerHost"
# get_config "TargetServerPort"
# get_config "TargetServerSSLInfo"         # if use SSL
# get_config "TargetDocumentPath"
# get_config "TargetDocumentLength"
# get_config "TimeTakenforTests"
# get_config "CompleteRequests"
# get_config "FailedRequests"
# get_config "ConnetcErrors"               # if FailedRequests > 0
# get_config "ReceiveErrors"               # if FailedRequests > 0
# get_config "LengthErrors"                # if FailedRequests > 0
# get_config "ExceptionsErrors"            # if FailedRequests > 0
# get_config "WriteErrors"
# get_config "Non2xxResponses"             # if Non2xxResponse > 0
# get_config "KeepAliveRequests"
# get_config "TotalTransferred"
# get_config "TotalBodySent"               # if body send
# get_config "HTMLTransferred"
# get_config "RequestPerSecond"
# get_config "TimePerConcurrentRequest"
# get_config "TimePerRequest"
# get_config "TransferRate"
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
