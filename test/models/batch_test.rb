require 'test_helper'
#class BatchTest < ActiveSupport::TestCase
#  test 'single_server' do
#    sum = 0
#    threads = []
#    100.times do
#      threads << Thread.new{ Batch.single_server(:batch_test) { sum = sum + 1 } }
#    end
#    ThreadsWait.all_waits(*threads)
#    threads.each do |thread|
#      sleep(0.1)
#      thread.join
#    end
#    assert_equal sum, 1
#  end
#end