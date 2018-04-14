require 'air_conditioner'

RSpec.describe AirConditioner, "ac" do
  before do
    # 選出要進行測試的冷氣機和遙控器
    @ac = AirConditioner.new
    @acc = AirConditionerController.new @ac
  end

  it "should ac.open? would return true" do
    # 打開冷氣
    isopen = true
    # 呼叫紅外線發射器
    ir = double(IR)
    # 假設發送指令給冷氣的回傳值是 True
    allow(@ac).to receive(:receiver).and_return(isopen)
    # 預期(冷氣.是否開啟(設定紅外線)) == True
    expect(@ac.open?(ir)).to eq(isopen)
  end

  it "should ac.open? would return false" do
    # 關閉冷氣
    isopen = false
    # 呼叫紅外線發射器
    ir = double(IR)
    # 假設發送指令給冷氣的回傳值是 False
    allow(@ac).to receive(:receiver).and_return(isopen)
    # 預期(冷氣.是否開啟(設定紅外線)) == False
    expect(@ac.open?(ir)).to eq(isopen)
  end
end
