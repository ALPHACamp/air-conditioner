require 'air_conditioner'

# 冷氣遙控器
class AirConditionerController
  def initialize ac
    # 將遙控器與冷氣機配對
    @air_conditioner = ac
    # 初始化儀表板，顯示冷氣關機
    @dashboard = {
      status: 'off'
    }
  end

  def open
    # 載入紅外線模組
    require 'ir'
    ir = IR.new
    # 確認冷氣是否已經開啟，要求冷氣機回報「開啟狀態」
    isopen = @air_conditioner.open?(ir)

    # if 開啟狀態 == 冷氣沒開
    if isopen == false
      # 要求冷氣機執行「打開冷氣」指令
      @order = 'open'
      # 呼叫紅外線發射器
      @launcher = ir
      # 發送指令給冷氣機，要求冷氣機回報結果
      result = @air_conditioner.receiver(@order)

      # if 結果 == 成功
      if result
        # 於冷氣遙控器儀表板上顯示 on
        @dashboard[:status] = 'on'
      else
        # 於設定冷氣遙控器儀表板上顯示 off
        @dashboard[:status] = 'off'
      end
    end
  end
end
