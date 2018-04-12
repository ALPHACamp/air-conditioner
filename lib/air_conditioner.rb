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
end
