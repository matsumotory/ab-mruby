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
  "TotalRequests"         => 100,                       # int
  "Concurrency"           => 10,                        # int max 20000
  "KeepAlive"             => true,                      # true or false or nil
  "VerboseLevel"          => 1,                         # int 1 ~ 5
  "SilentMode"            => true,
)
```

### write test suite for HTTP benchmark into ab-mruby.test.rb

see also `test/ab-mruby.test.rb`

```ruby
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

test_run
```

### ab-mruby benchmark and test start!

```bash
$ ./ab-mruby -m test/ab-mruby.conf.rb -M test/ab-mruby.test.rb http://127.0.0.1/
======================================================================
This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby

                          CONFIG PHASE

======================================================================
  Target Information  URL: http://127.0.0.1/
  Target Information HOST: 127.0.0.1
  Target Information PORT: 80
  Target Information PATH: /
  Target Information  SSL: false
======================================================================
This is ab-mruby using ApacheBench Version 2.3 <$Revision: 1430300 $>
Licensed to MATSUMOTO Ryosuke, https://github.com/matsumoto-r/ab-mruby

                            TEST PHASE

======================================================================
[TEST CASE] [true] FailedRequests (0) should be 0
[TEST CASE] [true] WriteErrors (0) should be 0
[TEST CASE] [true] CompleteRequests (100) should be 100
[TEST CASE] [true] TransferRate (2521.9284988877) should be over 500
[TEST CASE] [true] RequestPerSecond (3224.0384305381) should be over 1000
[TEST CASE] [true] TimePerRequest (0.31017) should be under 100
[TEST CASE] [true] TimePerConcurrentRequest (3.1017) should be under 3000
[TEST CASE] [true] ConnetcErrors (0) should be 0
[TEST CASE] [true] ReceiveErrors (0) should be 0
[TEST CASE] [true] LengthErrors (0) should be 0
[TEST CASE] [true] ExceptionsErrors (0) should be 0
[TEST CASE] [false] Non2xxResponses (100) should be 0

test suites: [false]
TestError: TestError
```

# License
Licensed under the Apache License, Version 2.0

http://www.apache.org/licenses/LICENSE-2.0
