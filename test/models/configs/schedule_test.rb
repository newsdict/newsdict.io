require 'test_helper'
class Configs::ScheduleTest < ActiveSupport::TestCase
  test 'last_schedule_at' do
    travel_to Time.zone.local(2020,05,01,15,00,00) do
      schedule = Configs::Schedule.new({
        key: 'last_schedule_at',
        min: 1,
        hour: Configs::Schedule::EVERY,
        wday: 4
      })
      assert_equal schedule.last_schedule_at.class, EtOrbi::EoTime
      assert_equal schedule.last_schedule_at, EtOrbi::EoTime.local(2020, 4, 30, 23, 01, 00)
    end
  end
  test 'next_schedule_at' do
    travel_to Time.zone.local(2020,05,01,15,00,00) do
      schedule = Configs::Schedule.new({
        key: 'next_schedule_at',
        min: Configs::Schedule::EVERY,
        hour: 12,
        wday: 4
      })
      assert_equal schedule.last_schedule_at.class, EtOrbi::EoTime
      assert_equal schedule.next_schedule_at, EtOrbi::EoTime.local(2020, 5, 7, 12, 00, 00)
    end
  end
  test 'current' do
    content = FactoryBot.create("Configs::Schedule")
    now = Time.zone.now
    travel_day = now.day - now.wday + content.wday
    month = now.month
    if now.end_of_month.day < travel_day
      month = now.next_month.month
      travel_day = travel_day - now.end_of_month.day
    end
    travel_time = Time.new(now.year, month, travel_day , content.hour, content.min, 0, Time.zone.formatted_offset)
    Timecop.travel(travel_time)
    assert_equal Configs::Schedule.current.count, 1
  end
  test 'current everymin' do
    content = FactoryBot.build("Configs::Schedule")
    content.min = Configs::Schedule::EVERY
    content.save
    now = Time.zone.now
    travel_day = now.day - now.wday + content.wday
    month = now.month
    if now.end_of_month.day < travel_day
      month = now.next_month.month
      travel_day = travel_day - now.end_of_month.day
    end
    travel_time = Time.new(now.year, month, travel_day , content.hour, now.min, 0, Time.zone.formatted_offset)
    Timecop.travel(travel_time)
    assert_equal Configs::Schedule.current.count, 1
  end
  test 'current everyhour' do
    content = FactoryBot.build("Configs::Schedule")
    content.hour = Configs::Schedule::EVERY
    content.save
    now = Time.zone.now
    travel_day = now.day - now.wday + content.wday
    month = now.month
    if now.end_of_month.day < travel_day
      month = now.next_month.month
      travel_day = travel_day - now.end_of_month.day
    end
    travel_time = Time.new(now.year, month, travel_day , (24==now.hour) ? 23 : now.hour, content.min, 0, Time.zone.formatted_offset)
    Timecop.travel(travel_time)
    assert_equal Configs::Schedule.current.count, 1
  end
  test 'current everywday' do
    content = FactoryBot.build("Configs::Schedule")
    content.wday  = Configs::Schedule::EVERY
    content.save
    now = Time.zone.now
    travel_time = Time.new(now.year, now.month, now.day, content.hour, content.min, 0, Time.zone.formatted_offset)
    Timecop.travel(travel_time)
    assert_equal Configs::Schedule.current.count, 1
  end
end
