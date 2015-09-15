# ab-mruby HTTP Benchmark and Test Tool [![Build Status](https://travis-ci.org/matsumoto-r/ab-mruby.svg?branch=master)](https://travis-ci.org/matsumoto-r/ab-mruby)

ab-mruby is a HTTP Benchmark and Test Framework.

ab-mruby embedded mruby into ab command by matsumoto_r.

You can test and configure ab command options dynamically by mruby script.

## How to build

```
git clone --recursive https://github.com/matsumoto-r/ab-mruby.git
cd ab-mruby
make
```

## How to use
### ab-mruby benchmark and test command

```bash
./ab-mruby -m ab-mruby.conf.rb -M ab-mruby.test.rb http://192.168.12.251/
```


### write config pattern for HTTP benchmark into ab-mruby.config.rb

see also `test/ab-mruby.conf.rb`

```ruby
add_config(
  "TotalRequests"         => 10,                        # int
  "Concurrency"           => 1,                         # int max 20000
  "KeepAlive"             => true,                      # true or false or nil
  "VerboseLevel"          => 1,                         # int 1 ~ 5
  "ShowProgress"          => true,                      # true, false or nil
  "ShowPercentile"        => true,                      # true, false or nil
  "ShowConfidence"        => true,                      # true, false or nil
  "WaitSocketError"       => true,                      # true, false or nil
  "RequestTimeOut"        => 30000,                     # int msec
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
```

### write test suite for HTTP benchmark into ab-mruby.test.rb

see also `test/ab-mruby.test.rb`

```ruby
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
