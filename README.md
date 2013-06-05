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

- write config into ab-mruby.config.rb
```ruby
# Usage: ./ab-mruby -m ab-mruby.conf.rb [http[s]://]hostname[:port]/path
new_config(
    "TotalRequests"         => 100,                       # int
    "Concurrency"           => 10,                        # int max 20000
    "KeepAlive"             => true,                      # true or false or nil
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
    "AddHeader"             => 'User-Agent: ab-mruby',    # 'User-Agent: test' 
    "BasicAuth"             => nil,                       # 'user:pass'
    "Proxy"                 => nil,                       # 'proxy[:port]'
    "ProxyAuth"             => nil,                       # 'user:pass'
    "OutputHtml"            => false,                     # true, false or nil
    "BindAddress"           => nil,                       # 'matsumoto-r.jp'
    "SSLCipher"             => 'DHE-RSA-AES128-SHA',      # 'DHE-RSA-AES256-SHA' or get from [openssl ciphers -v]
    "SSLProtocol"           => 'SSL3',                    # 'SSL2', 'SSL3', 'TLS1', 'TLS1.1', 'TLS1.2' or 'ALL'
)
```

- ab-mruby benchmark start!
```
ab-mruby -m ab-mruby.conf.rb http://127.0.0.1/
```
