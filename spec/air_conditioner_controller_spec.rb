require 'air_conditioner_controller'

RSpec.describe AirConditionerController, "acc" do
  before do
    # 選出要進行測試的冷氣機和遙控器
    @ac = AirConditioner.new
    @acc = AirConditionerController.new @ac
  end

  # 開始測試「打開冷氣」功能
  it "should open button work" do
    # 將冷氣插上電源
    @ac.ispower = true
    # 確認初始狀態 -> 期待冷氣出風口沒有出風
    expect(@ac.outlet_status).to eq('nothing')
    # 執行「打開冷氣」動作
    @acc.open()
    # 期待感覺到到冷氣出風口開始出風
    expect(@ac.outlet_status).to eq('wind~~~')
  end

  it "should controller open work" do
    # 設定「冷氣開啟狀態」 -> 關機
    @ac.isopen = false
    # 設定「冷氣開啟狀態」 -> 有插電
    @ac.ispower = true
    # 冷氣遙控器.打開冷氣()
    @acc.open
    # 預期(冷氣狀態) == 運作中
    expect(@ac.isopen).to eq(true)
  end

  it "should status in dashboard correct" do
    # 設定「冷氣開啟狀態」 -> 關機
    @ac.isopen = false
    # 設定「冷氣開啟狀態」 -> 有插電
    @ac.ispower = true
    # 冷氣遙控器.打開冷氣()
    @acc.open
    # 預期(冷氣遙控器儀表板) 有 "on" 的訊息
    expect(@acc.print_dashboard).to include(:status => "on")
  end
end
