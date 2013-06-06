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
  def test_run
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

test_run
```

- ab-mruby benchmark and test start!

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
Time taken for tests:   0.058 seconds
Complete requests:      100
Failed requests:        0
Write errors:           0
Total transferred:      27500 bytes
HTML transferred:       600 bytes
Requests per second:    1738.10 [#/sec] (mean)
Time per request:       5.753 [ms] (mean)
Time per request:       0.575 [ms] (mean, across all concurrent requests)
Transfer rate:          466.78 [Kbytes/sec] received

Connection Times (ms)
              min  mean[+/-sd] median   max
Connect:        0    0   0.0      0       0
Processing:     0    0   0.0      0       1
Waiting:        0    0   0.0      0       1
Total:          0    1   0.1      1       1

Percentage of the requests served within a certain time (ms)
  50%      1
  66%      1
  75%      1
  80%      1
  90%      1
  95%      1
  98%      1
  99%      1
 100%      1 (longest request)
======================================================================
This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby

                            TEST PHASE

======================================================================
[TEST CASE] TargetServerHost (192.168.12.251) should be 192.168.12.251: true
[TEST CASE] TargetServerPort (80) should be 80: true
[TEST CASE] TargetDocumentPath (/) should be /: true
[TEST CASE] TargetServerSoftware (Apache/2.4.4) should be Apache/2.4.4: true
[TEST CASE] FailedRequests (0) should be 0: true
[TEST CASE] WriteErrors (0) should be 0: true
[TEST CASE] HTMLTransferred (600) should be 600: true
[TEST CASE] TargetDocumentLength (6) should be 6: true
[TEST CASE] TotalTransferred (27500) should be 27500: true
[TEST CASE] CompleteRequests (100) should be 100: true
[TEST CASE] TransferRate (466.7756239) should be over 460: true
[TEST CASE] TimeTakenforTests (0.057534) should be over 0.01: true
[TEST CASE] RequestPerSecond (1738.102687) should be over 1000: true
[TEST CASE] TimePerRequest (0.57534) should be over 0.5: true
[TEST CASE] TimePerConcurrentRequest (5.7534) should be over 5: true
```

# License
Licensed under the Apache License, Version 2.0

http://www.apache.org/licenses/LICENSE-2.0
