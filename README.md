# ab-mruby

ab-mruby embedded mruby into ab by matsumoto_r.

You can configure ab command options by mruby script.

## How to build

```
git submodule init
git submodule update
make
```

## How to use

- write config pattern into ab-mruby.config.rb

```ruby
#
# Usage: ./ab-mruby -m ab-mruby.conf.rb [http[s]://]hostname[:port]/path
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

- write test pattern into ab-mruby.test.rb

```
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
result = get_config

# write test pattern
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
Requests per second:    1721.14 [#/sec] (mean)
Time per request:       5.810 [ms] (mean)
Time per request:       0.581 [ms] (mean, across all concurrent requests)
Transfer rate:          462.22 [Kbytes/sec] received

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
{"TransferRate"=>462.2204221, "TargetServerPort"=>80, "FailedRequests"=>0, "TimeTakenforTests"=>0.058101, "RequestPerSecond"=>1721.140772, "WriteErrors"=>0, "HTMLTransferred"=>600, "TargetDocumentLength"=>6, "TargetDocumentPath"=>"/", "TotalTransferred"=>27500, "TimePerConcurrentRequest"=>5.8101, "TimePerRequest"=>0.58101, "TargetServerHost"=>"192.168.12.251", "TargetServerSoftware"=>"Apache/2.4.4", "CompleteRequests"=>100}
```

# License
Licensed under the Apache License, Version 2.0

http://www.apache.org/licenses/LICENSE-2.0
