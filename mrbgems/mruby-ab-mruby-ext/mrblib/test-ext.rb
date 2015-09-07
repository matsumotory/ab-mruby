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
    ret = @@r[self] >= val
    puts "[TEST CASE] #{bln_color ret} #{self} (#{@@r[self]}) should be over #{val}"
    @@result = ret if ret == false
  end
  def should_be_under val
    ret = @@r[self] <= val
    puts "[TEST CASE] #{bln_color ret} #{self} (#{@@r[self]}) should be under #{val}"
    @@result = ret if ret == false
  end
  def test_run
    @@t.call
    puts "\ntest suites: #{bln_color @@result}\n"
    @@result
  end
end

