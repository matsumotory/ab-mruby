module Kernel
  def test_suite &blk
    @@r = get_config
    @@t = blk
  end
  def should_be val
    res = @@r[self] == val
    puts "[TEST CASE] #{self} (#{@@r[self]}) should be #{val}: #{res}"
    test_fail res
  end
  def should_be_over val
    res = @@r[self] >= val
    puts "[TEST CASE] #{self} (#{@@r[self]}) should be over #{val}: #{res}"
    test_fail res
  end
  def should_be_under val
    res = @@r[self] <= val
    puts "[TEST CASE] #{self} (#{@@r[self]}) should be under #{val}: #{res}"
    test_fail res
  end
  def test_fail res
    raise "~~~ test failed ~~~" if res == false
  end
  def test_run
    @@t.call
    puts "=== all test passed ==="
    true
  end
end
