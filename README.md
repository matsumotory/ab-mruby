# ab-mruby HTTP Benchmark and Test Tool

ab-mruby is a HTTP Benchmark and Test Framework.

ab-mruby embedded mruby into ab command by matsumoto_r.

You can test and configure ab command options dynamically by mruby script.

## How to build

```
git submodule init
git submodule update
make
```

## How to use
### ab-mruby benchmark and test command

```bash
./ab-mruby -m ab-mruby.conf.rb -M ab-mruby.test.rb http://192.168.12.251/
```


### write config pattern for HTTP benchmark into ab-mruby.config.rb

```ruby
#
# Usage: ./ab-mruby -m ab-mruby.conf.rb -M ab-mruby.test.rb[http[s]://]hostname[:port]/path
#
# add_config(
#     "TotalRequests"         => 100,                       # int
#     "Concurrency"           => 10,                        # int max 20000
#     "KeepAlive"             => true,                      # true or false or nil
#     "VerboseLevel"          => 1,                         # int 1 ~ 5
#     "ShowProgress"          => true,                      # true, false or nil
#     "ShowPercentile"        => true,                      # true, false or nil
#     "ShowConfidence"        => true,                      # true, false or nil
#     "WaitSocketError"       => true,                      # true, false or nil
#     "RequestTimeOut"        => 30,                        # int sec
#     "BechmarkTimelimit"     => 50000,                     # int sec
#     "WindowSize"            => nil,                       # int byte
#     "HeadMethodOnly"        => false,                     # true, false or nil
#     "Postfile"              => nil,                       # './post.txt',
#     "Putfile"               => nil,                       # './put.txt',
#     "ContentType"           => nil,                       # 'application/x-www-form-urlencoded',
#     "OutputGnuplotFile"     => nil,                       # './gnu.txt'
#     "OutputCSVFile"         => nil,                       # './csv.txt'
#     "AddCookie"             => nil,                       # 'Apache=1234'
#     "AddHeader"             => 'User-Agent: ab-mruby',    # 'User-Agent: test' 
#     "BasicAuth"             => nil,                       # 'user:pass'
#     "Proxy"                 => nil,                       # 'proxy[:port]'
#     "ProxyAuth"             => nil,                       # 'user:pass'
#     "OutputHtml"            => false,                     # true, false or nil
#     "SilentMode"            => false,                     # true, false or nil
#     "BindAddress"           => nil,                       # 'matsumoto-r.jp'
#     "SSLCipher"             => 'DHE-RSA-AES128-SHA',      # 'DHE-RSA-AES256-SHA' or get from [openssl ciphers -v]
#     "SSLProtocol"           => 'SSL3',                    # 'SSL2', 'SSL3', 'TLS1', 'TLS1.1', 'TLS1.2' or 'ALL'
# )

# print ab-mruby headers
print <<EOS
======================================================================
This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby

                          CONFIG PHASE

======================================================================
EOS

# get config value from C
p get_config("TargetURL").to_s
p get_config("TargetPort").to_s
p get_config("TargetHost").to_s
p get_config("TargetPath").to_s
p get_config("TargetisSSL").to_s

# defined config pattern
if get_config("TargetHost").to_s == "blog.example.jp"

  add_config(
    "TotalRequests"         => 10,                        # int
    "Concurrency"           => 1,                         # int max 20000
    "KeepAlive"             => true,                      # true or false or nil
    "VerboseLevel"          => 1,                         # int 1 ~ 5
    "ShowProgress"          => true,                      # true, false or nil
    "ShowPercentile"        => true,                      # true, false or nil
    "ShowConfidence"        => true,                      # true, false or nil
    "WaitSocketError"       => true,                      # true, false or nil
    "RequestTimeOut"        => 30,                        # int sec
    "BechmarkTimelimit"     => 50000,                     # int sec
    "WindowSize"            => nil,                       # int byte
    "HeadMethodOnly"        => false,                     # true, false or nil
    "Postfile"              => nil,                       # './post.txt',
    "Putfile"               => nil,                       # './put.txt',
    "ContentType"           => nil,                       # 'application/x-www-form-urlencoded',
    "OutputGnuplotFile"     => nil,                       # './gnu.txt'
    "OutputCSVFile"         => nil,                       # './csv.txt'
    "AddCookie"             => nil,                       # 'Apache=1234'
    "AddHeader"             => 'User-Agent: ab-blog',     # 'User-Agent: test' 
    "BasicAuth"             => nil,                       # 'user:pass'
    "Proxy"                 => nil,                       # 'proxy[:port]'
    "ProxyAuth"             => nil,                       # 'user:pass'
    "OutputHtml"            => false,                     # true, false or nil
    "BindAddress"           => nil,                       # 'matsumoto-r.jp'
    "SSLCipher"             => nil,                       # 'DHE-RSA-AES256-SHA' or get from [openssl ciphers -v]
    "SSLProtocol"           => nil,                       # 'SSL2', 'SSL3', 'TLS1', 'TLS1.1', 'TLS1.2' or 'ALL'
  )


elsif get_config("TargetHost").to_s == "moblog.example.jp"

  add_config(
    "TotalRequests"         => 20,                        # int
    "Concurrency"           => 5,                         # int max 20000
    "KeepAlive"             => false,                     # true or false or nil
    "VerboseLevel"          => 5,                         # int 1 ~ 5
    "ShowProgress"          => true,                      # true, false or nil
    "ShowPercentile"        => true,                      # true, false or nil
    "ShowConfidence"        => true,                      # true, false or nil
    "WaitSocketError"       => true,                      # true, false or nil
    "RequestTimeOut"        => 30,                        # int sec
    "BechmarkTimelimit"     => 50000,                     # int sec
    "WindowSize"            => nil,                       # int byte
    "HeadMethodOnly"        => false,                     # true, false or nil
    "Postfile"              => nil,                       # './post.txt',
    "Putfile"               => nil,                       # './put.txt',
    "ContentType"           => nil,                       # 'application/x-www-form-urlencoded',
    "OutputGnuplotFile"     => nil,                       # './gnu.txt'
    "OutputCSVFile"         => nil,                       # './csv.txt'
    "AddCookie"             => nil,                       # 'Apache=1234'
    "AddHeader"             => 'User-Agent: ab-moblog',   # 'User-Agent: test' 
    "BasicAuth"             => nil,                       # 'user:pass'
    "Proxy"                 => nil,                       # 'proxy[:port]'
    "ProxyAuth"             => nil,                       # 'user:pass'
    "OutputHtml"            => false,                     # true, false or nil
    "BindAddress"           => nil,                       # 'matsumoto-r.jp'
    "SSLCipher"             => nil,                       # 'DHE-RSA-AES256-SHA' or get from [openssl ciphers -v]
    "SSLProtocol"           => nil,                       # 'SSL2', 'SSL3', 'TLS1', 'TLS1.1', 'TLS1.2' or 'ALL'
  )

else

  add_config(
    "TotalRequests"         => 100,                       # int
    "Concurrency"           => 10,                        # int max 20000
    "KeepAlive"             => false,                     # true or false or nil
    "VerboseLevel"          => 1,                         # int 1 ~ 5
    "SilentMode"            => true,
  )

end

if get_config("TargetisSSL")

  add_config(
    "SSLCipher"             => 'DHE-RSA-AES128-SHA',      # 'DHE-RSA-AES256-SHA' or get from [openssl ciphers -v]
    "SSLProtocol"           => 'SSL3',                    # 'SSL2', 'SSL3', 'TLS1', 'TLS1.1', 'TLS1.2' or 'ALL'
  )

end
```

### write test suite for HTTP benchmark into ab-mruby.test.rb

```ruby
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
  end
  def bln_color val
    (val) ? "[\e[33m#{val}\e[m]" : "[\e[36m#{val}\e[m]"
  end
  def should_be val
    puts "[TEST CASE] #{bln_color @@r[self] == val} #{self} (#{@@r[self]}) should be #{val}"
  end
  def should_be_over val
    puts "[TEST CASE] #{bln_color @@r[self] > val} #{self} (#{@@r[self]}) should be over #{val}"
  end
  def should_be_under val
    puts "[TEST CASE] #{bln_color @@r[self] < val} #{self} (#{@@r[self]}) should be under #{val}"
  end
  def test_run
    @@t.call
  end
end

# print ab-mruby headers
print <<EOS
======================================================================
This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby

                            TEST PHASE

======================================================================
EOS

test_suite do
  "TargetServerHost".should_be                 "192.168.12.251"
  "TargetServerPort".should_be                 80
  "TargetDocumentPath".should_be               "/"
  "TargetServerSoftware".should_be             "Apache/2.4.4"
  "FailedRequests".should_be                   0
  "KeepAliveRequests".should_be                0
  "WriteErrors".should_be                      0
  "HTMLTransferred".should_be                  600
  "TargetDocumentLength".should_be             6
  "TotalTransferred".should_be                 27500
  "CompleteRequests".should_be                 100
  "TransferRate".should_be_over                460
  "TimeTakenforTests".should_be_under          0.01
  "RequestPerSecond".should_be_over            1000
  "TimePerRequest".should_be_under             0.5
  "TimePerConcurrentRequest".should_be_under   5
  "TotalBodySent".should_be                    0
  "ConnetcErrors".should_be                    0
  "ReceiveErrors".should_be                    0
  "LengthErrors".should_be                     0
  "ExceptionsErrors".should_be                 0
  "Non2xxResponses".should_be                  0
end

test_run
```

### ab-mruby benchmark and test start!

```bash
$ ./ab-mruby -m ab-mruby.conf.rb -M ab-mruby.test.rb http://192.168.12.251/
======================================================================
This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby

                          CONFIG PHASE

======================================================================
"http://192.168.12.251/"
"80"
"192.168.12.251"
"/"
"false"
This is ApacheBench, Version 2.3-mruby <$Revision: 1430300 $>
Copyright 1996 Adam Twiss, Zeus Technology Ltd, http://www.zeustech.net/
Licensed to The Apache Software Foundation, http://www.apache.org/

Benchmarking 192.168.12.251 (be patient).....done


Server Software:        Apache/2.4.4
Server Hostname:        192.168.12.251
Server Port:            80

Document Path:          /
Document Length:        6 bytes

Concurrency Level:      10
Time taken for tests:   0.010 seconds
Complete requests:      100
Failed requests:        0
Write errors:           0
Keep-Alive requests:    100
Total transferred:      31110 bytes
HTML transferred:       600 bytes
Requests per second:    9583.13 [#/sec] (mean)
Time per request:       1.043 [ms] (mean)
Time per request:       0.104 [ms] (mean, across all concurrent requests)
Transfer rate:          2911.44 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.1      0       0
Processing:     0    1   0.7      1       4
Waiting:        0    1   0.7      1       4
Total:          0    1   0.7      1       4

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      1
  75%      2
  80%      2
  90%      2
  95%      2
  98%      3
  99%      4
 100%      4 (longest request)
======================================================================
This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby

                            TEST PHASE

======================================================================
[TEST CASE] [true] TargetServerHost (192.168.12.251) should be 192.168.12.251
[TEST CASE] [true] TargetServerPort (80) should be 80
[TEST CASE] [true] TargetDocumentPath (/) should be /
[TEST CASE] [true] TargetServerSoftware (Apache/2.4.4) should be Apache/2.4.4
[TEST CASE] [true] FailedRequests (0) should be 0
[TEST CASE] [false] KeepAliveRequests (100) should be 0
[TEST CASE] [true] WriteErrors (0) should be 0
[TEST CASE] [true] HTMLTransferred (600) should be 600
[TEST CASE] [true] TargetDocumentLength (6) should be 6
[TEST CASE] [false] TotalTransferred (31110) should be 27500
[TEST CASE] [true] CompleteRequests (100) should be 100
[TEST CASE] [true] TransferRate (2911.4383684) should be over 460
[TEST CASE] [false] TimeTakenforTests (0.010435) should be under 0.01
[TEST CASE] [true] RequestPerSecond (9583.1336847) should be over 1000
[TEST CASE] [true] TimePerRequest (0.10435) should be under 0.5
[TEST CASE] [true] TimePerConcurrentRequest (1.0435) should be under 5
[TEST CASE] [true] TotalBodySent (0) should be 0
[TEST CASE] [true] ConnetcErrors (0) should be 0
[TEST CASE] [true] ReceiveErrors (0) should be 0
[TEST CASE] [true] LengthErrors (0) should be 0
[TEST CASE] [true] ExceptionsErrors (0) should be 0
[TEST CASE] [true] Non2xxResponses (0) should be 0

```

# License
Licensed under the Apache License, Version 2.0

http://www.apache.org/licenses/LICENSE-2.0
