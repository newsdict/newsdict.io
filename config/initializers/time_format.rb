# https://qiita.com/naoty_k/items/1920b7e0e8a1ac1ff5f6
Time::DATE_FORMATS[:human] = lambda {|date|
  seconds = (Time.now - date).round;
  days    = seconds / (60 * 60 * 24); return "#{date.month}月#{date.day}日" if days > 0;
  hours   = seconds / (60 * 60);      return "#{hours}時間前" if hours > 0;
  minutes = seconds / 60;             return "#{minutes}分前" if minutes > 0;
  return "#{seconds}秒前"
}