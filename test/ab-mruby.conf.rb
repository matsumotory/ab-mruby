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


print <<EOS
======================================================================
This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby

                          CONFIG PHASE

======================================================================
  Target Information  URL: #{get_config('TargetURL').to_s}
  Target Information HOST: #{get_config('TargetHost').to_s}
  Target Information PORT: #{get_config('TargetPort').to_s}
  Target Information PATH: #{get_config('TargetPath').to_s}
  Target Information  SSL: #{get_config('TargetisSSL').to_s}
EOS

# defined ab config pattern
if get_config("TargetHost").to_s == "blog.example.jp"
  
  add_config(
    "TotalRequests"         => 100,                       # int
    "Concurrency"           => 10,                        # int max 20000
    "KeepAlive"             => true,                      # true or false or nil
    "VerboseLevel"          => 1,                         # int 1 ~ 5
    "ShowProgress"          => false,                     # true, false or nil
    "ShowPercentile"        => false,                     # true, false or nil
    "ShowConfidence"        => false,                     # true, false or nil
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
    "AddHeader"             => 'User-Agent: ab-mruby',    # 'User-Agent: test' 
    "BasicAuth"             => nil,                       # 'user:pass'
    "Proxy"                 => nil,                       # 'proxy[:port]'
    "ProxyAuth"             => nil,                       # 'user:pass'
    "OutputHtml"            => false,                     # true, false or nil
    "BindAddress"           => nil,                       # 'example.jp'
    "SSLCipher"             => nil,                       # 'DHE-RSA-AES256-SHA' or get from [openssl ciphers -v]
    "SSLProtocol"           => nil,                       # 'SSL2', 'SSL3', 'TLS1', 'TLS1.1', 'TLS1.2' or 'ALL'
    "SilentMode"            => true,
  )

elsif get_config("TargetHost").to_s == "moblog.example.jp"

  add_config(
    "TotalRequests"         => 200,                       # int
    "Concurrency"           => 20,                        # int max 20000
    "KeepAlive"             => true,                      # true or false or nil
    "VerboseLevel"          => 1,                         # int 1 ~ 5
    "ShowProgress"          => false,                     # true, false or nil
    "ShowPercentile"        => false,                     # true, false or nil
    "ShowConfidence"        => false,                     # true, false or nil
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
    "AddHeader"             => 'User-Agent: ab-mruby',    # 'User-Agent: test' 
    "BasicAuth"             => nil,                       # 'user:pass'
    "Proxy"                 => nil,                       # 'proxy[:port]'
    "ProxyAuth"             => nil,                       # 'user:pass'
    "OutputHtml"            => false,                     # true, false or nil
    "BindAddress"           => nil,                       # 'example.jp'
    "SSLCipher"             => nil,                       # 'DHE-RSA-AES256-SHA' or get from [openssl ciphers -v]
    "SSLProtocol"           => nil,                       # 'SSL2', 'SSL3', 'TLS1', 'TLS1.1', 'TLS1.2' or 'ALL'
    "SilentMode"            => true,
  )

elsif get_config("TargetHost").to_s == "example.org"

  add_config(
    "TotalRequests"         => 300,                       # int
    "Concurrency"           => 30,                        # int max 20000
    "KeepAlive"             => true,                      # true or false or nil
    "VerboseLevel"          => 1,                         # int 1 ~ 5
    "ShowProgress"          => false,                     # true, false or nil
    "ShowPercentile"        => false,                     # true, false or nil
    "ShowConfidence"        => false,                     # true, false or nil
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
    "AddHeader"             => 'User-Agent: ab-mruby',    # 'User-Agent: test' 
    "BasicAuth"             => nil,                       # 'user:pass'
    "Proxy"                 => nil,                       # 'proxy[:port]'
    "ProxyAuth"             => nil,                       # 'user:pass'
    "OutputHtml"            => false,                     # true, false or nil
    "BindAddress"           => nil,                       # 'example.jp'
    "SSLCipher"             => 'AES256-SHA',              # 'DHE-RSA-AES256-SHA' or get from [openssl ciphers -v]
    "SSLProtocol"           => 'SSL3',                    # 'SSL2', 'SSL3', 'TLS1', 'TLS1.1', 'TLS1.2' or 'ALL'
    "SilentMode"            => true,
  )
else

  add_config(
    "TotalRequests"         => 100,                       # int
    "Concurrency"           => 10,                        # int max 20000
    "KeepAlive"             => true,                      # true or false or nil
    "VerboseLevel"          => 1,                         # int 1 ~ 5
    "SilentMode"            => true,
  )

end

