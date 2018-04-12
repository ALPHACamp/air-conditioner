# 冷氣
class AirConditioner
  attr_accessor :ispower, :isopen

  def initialize
    @isopen = false
    @ispower = false
  end

  # 開關
  def open!
    @isopen = true
  end

  # 出風口
  def outlet_status
    if @isopen
      'wind~~~'
    else
      'nothing'
    end
  end

  # 指令接收器
  def receiver order
    case order
    when 'check_is_opened'
      return @isopen
    when 'open'
      if @ispower
        self.open!
      else
        raise 'Try again after connecting with power'
      end

      true
    else
      return 'unknown order'
    end
  end

  # 確認冷氣是否已經開啟
  def open?(ir)
    # 設定指令 -> 「確認冷氣是否開啟」
    @order = 'check_is_opened'
    # 呼叫紅外線發射器
    @launcher = ir
    # 發送指令給冷氣機
    self.receiver(@order)
  end
end
