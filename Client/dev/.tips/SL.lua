---@meta SL

---@class SLlib

SL = {}

---日志打印
---*  ... 
---@param ... any
function SL:release_print(...) end

---DEBUG下日志打印
---*  ... 
---@param ... any
function SL:Print(...) end

---DEBUG下日志打印
---*  ... 
---@param ... any
function SL:PrintEx(...) end


---DEBUG下日志打印堆栈信息
function SL:PrintTraceback() end

---DEBUG下日志打印表信息
---*  data : 需要打印的表
---*  desciption : 打印表描述
---*  nesting : 表
---@param data table
---@param desciption string
---@param nesting integer
function SL:dump(data, desciption, nesting) end

---json字符串解密
---*  jsonStr : json字符
---*  isfilter : 是否过滤违禁词 默认为true
---@param jsonStr string
---@param isfilter boolean
---@return table
---@nodiscard
function SL:JsonDecode(jsonStr,isfilter) end

---json字符串加密
---*  jsonData : 表
---*  isfilter : 是否过滤违禁词 默认为true
---@param jsonData table
---@param isfilter boolean
---@return string
---@nodiscard
function SL:JsonEncode(jsonData, isfilter) end

---颜色转换函数,从16进制字符转为{r, g, b}
---*  hexStr : 颜色值(“#000000”)
---@param hexStr string
---@return table
---@nodiscard
function SL:ConvertColorFromHexString(hexStr) end

---文件路径是否存在
---*  path : 文件路径
---@param path string
---@return boolean
---@nodiscard
function SL:IsFileExist(path) end

---复制数据(深拷贝)
---*  data : 目标数据
---@param data table
---@return table
---@nodiscard
function SL:CopyData(data) end

---分割字符串
---*  string : 目标字符串
---*  delimiter : 分隔符
---@param string string
---@param delimiter string
---@return table
---@nodiscard
function SL:Split(string, delimiter) end

---文本提示
---*  string : 提示文本
---@param string string
function SL:ShowSystemTips(string) end

---哈希表转成按数组
---*  hashTab : 提示文本
---@param hashTab table
---@param sortFunc function
---@return table
---@nodiscard
function SL:HashToSortArray(hashTab,sortFunc) end

---显示提示文本框
---*  str : 显示文本
---*  width : 显示宽度, 默认: 1136
---*  pos : 坐标, 默认: {x = 0, y = 0}
---*  anchorPoint : 锚点, 默认: {x = 0, y = 1}
---@param str string
---@param width integer
---@param pos table
---@param anchorPoint table
function SL:SHOW_DESCTIP(str, width, pos, anchorPoint) end

---加载文件
---*  file : 文件名
---*  reload : 是否重新加载文件(填true时,会先释放文件再加载)
---@param file string
---@param reload boolean
function SL:Require(file,reload) end

---将数字 num 转换成 xx万、xx亿
---*  num : 数字
---@param num integer
---@return string
---@nodiscard
function SL:GetSimpleNumber(num) end

---血量单位显示[将血量数值转换有单位显示 过十亿(单位:E) 10w-99999w(单位:W)]
---*  hp : 血量数值
---*  pointBit : 显示小数点后几位, 默认保留后两位
---@param hp integer
---@param pointBit integer
function SL:HPUnit(hp, pointBit) end

---中文转换成竖着显示
---*  str : 文本
---@param str string
---@return string
---@nodiscard
function SL:ChineseToVertical(str) end

---阿拉伯数字转中文大写
---*  num : 数字
---@param str string
---@return string
---@nodiscard
function SL:NumberToChinese(str) end

---获取字符串的byte长度
---*  num : 数字
---@param str string
---@return integer
---@nodiscard
function SL:GetUTF8ByteLen(str) end

---时间格式化成字符串显示
---*  num : 数字
---@param time integer
---@return string
---@nodiscard
function SL:TimeFormatToStr(time) end

---lua table转成config配置表
---*  tab : 需要转换的table
---*  name : 转出文件名
---*  destPath : 文件保存的路径, 默认目录:dev/scripts/game_config/
---*  sortFunc : 外层排序函数
---@param tab table
---@param name string
---@param destPath string
---@param sortFunc function
function SL:SaveTableToConfig(tab, name, destPath, sortFunc) end

---十六进制转十进制
---*  hexStr : 16进制数
---@param hexStr string
---@return integer
---@nodiscard
function SL:HexToInt(hexStr) end

---十六进制转十进制
---*  string : 字符
---@param string string
---@return string
---@nodiscard
function SL:GetStrMD5(string) end

---跳转到某个超链
---*  id : 对应界面的跳转id
---@param id integer
function SL:JumpTo(id) end

---小退, 有弹窗提示
function SL:ExitToRoleUI() end

---强制小退, 无弹窗提示
function SL:ForceExitToRoleUI() end

---退出到登录界面
function SL:ExitToLoginUI() end

---发送GM命令
---*  msg : gm命令
---@param msg string
function SL:SendGMMsgToChat(msg) end

---创建一个红点到节点
---*  targetNode : 目标控件
---*  offset : 偏移位置 例: {x = 5, y = 5}
---@param targetNode userdata
---@param offset table
function SL:CreateRedPoint(targetNode,offset) end

---设置文本样式(按钮、文本)
---*  widget :按钮或者文本对象
---*  colorID  :0 - 255 色值ID
---@param widget  userdata
---@param colorID  table
function SL:SetColorStyle(widget ,colorID ) end

---获取对应色值ID的配置
---*  colorID :按钮或者文本对象
function SL:GetColorCfg(colorID) end

---检查是否满足条件
---*  conditionStr : 元变量条件判断, 格式: $(原变量ID)
---@param conditionStr  string
---@return boolean
---@nodiscard
function SL:CheckCondition(conditionStr) end

---显示气泡提醒
---*  id :气泡ID
---*  path:气泡图片资源路径
---*  callback:气泡点击回调
---@param id userdata
---@param path string
---@param callback function
function SL:AddBubbleTips(id, path, callback) end

---显示气泡提醒
---*  id :气泡ID
---@param id userdata
function SL:DelBubbleTips(id) end

---重新加载地图
function SL:ReloadMap() end

---请求HTTPGet
---*  url : 链接地址
---*  httpCB : 回调函数
---@param url string
---@param httpCB function
function SL:HTTPRequestGet(url,httpCB) end

---请求HTTPPost
---*  url : 链接地址
---*  httpCB : 回调函数
---*  suffix : 请求信息
---*  head : 请求头
---@param url string
---@param httpCB function
---@param suffix string
---@param head table
function SL:HTTPRequestPost(url,httpCB,suffix,head) end

---注册窗体控件事件
---*  widget : 控件对象
---*  msg : 描述
---*  msgtype : 窗体事件id
---*  callback : 回调函数
---@param widget userdata
---@param msg string
---@param msgtype integer
---@param callback function
function SL:RegisterWndEvent(widget, msg, msgtype, callback) end

---注销窗体控件事件
---*  widget : 控件对象
---*  msg : 描述
---*  msgtype : 窗体事件id
---@param widget userdata
---@param msg string
---@param msgtype integer
function SL:UnRegisterWndEvent(widget, msg, msgtype) end

---添加窗体控件自定义属性
---*  widget : 控件对象
---*  desc : 描述
---*  key : 属性名称
---*  value : 属性值
---@param widget userdata
---@param desc string
---@param key string
---@param value any
function SL:AddWndProperty(widget, desc, key, value) end

---删除窗体控件自定义属性
---*  widget : 控件对象
---*  desc : 描述
---*  key : 属性名称
---*  value : 属性值
---@param widget userdata
---@param desc string
---@param key string
---@param value any
function SL:DelWndProperty(widget, desc, key, value) end

---获取窗体控件自定义属性
---*  widget : 控件对象
---*  desc : 描述
---*  key : 属性名称
---@param widget userdata
---@param desc string
---@param key string
---@return any
---@nodiscard
function SL:GetWndProperty(widget, desc, key) end

---开启一个定时器
---*  callback : 函数回调
---*  interval : 时间
---@param callback function
---@param interval integer
---@return integer
---@nodiscard
function SL:Schedule(callback, interval) end

---停止一个定时器
---*  scheduleID : 定时器ID
---@param scheduleID integer
function SL:UnSchedule(scheduleID) end

---开启一个单次定时器
---*  callback : 函数回调
---*  time : 时间
---@param callback function
---@param time integer
function SL:ScheduleOnce(callback, time) end

---开启一个定时器, 绑定node节点
---*  node : 节点对象
---*  callback : 函数回调
---*  time : 时间
---@param node userdata
---@param callback function
---@param time integer
function SL:schedule(node, callback, time) end

---开启一个定时器, 绑定node节点
---*  node : 节点对象
---*  callback : 函数回调
---*  time : 时间
---@param node userdata
---@param callback function
---@param time integer
function SL:scheduleOnce(node, callback, time) end

---打开引导
---*  data : 引导数据（参考示例）
---@param data table
function SL:StartGuide(data) end

---关闭引导
function SL:CloseGuide() end

---存储数据到本地,存储的文件名为:”GUIStorage”+玩家ID
---*  key : 字段名
---*  data : 存储数据到本地,存储的文件名为：”GUIStorage” + 角色ID
---@param key any
---@param data table|integer|string
function SL:SetLocalString(key, data) end

---本地取数据
---*  key : 存储时的字段
---@param key any
function SL:GetLocalString(key) end

---检测人物是否可使用
---*  itemData : 装备数据
---@param itemData table
function SL:CheckItemUseNeed(itemData) end

---检测英雄是否可使用
---*  itemData : 装备数据
---@param itemData table
function SL:CheckItemUseNeed_Hero(itemData) end

---获得需要比较的装备
---*  itemData : 装备数据
---*  isHero : 是否对比英雄
---@param itemData table
---@param isHero string
function SL:CheckItemUseNeed_Hero(itemData,isHero) end

---对比传入装备和自身穿戴的装备
---*  itemData : 装备数据
---*  from : 物品来自(界面位置), 可参照元变量”ITEMFROMUI_ENUM”
---@param itemData table
---@param from string
function SL:CheckEquipPowerThanSelf(itemData,from) end

---通过 cfg_menulayer 表中的界面ID检测该界面的条件配置,是否满足显示
---*  layerID : cfg_menulayer 表中的界面ID
---@param layerID integer
function SL:CheckMenuLayerConditionByID(layerID) end

---通过 cfg_menulayer 表中的界面ID打开该界面
---*  layerID : cfg_menulayer 表中的界面ID
---*  layerID : 挂接点
---*  layerID : 可选参数
---@param layerID integer
---@param parent userdata
---@param extent integer
function SL:OpenMenuLayerByID(layerID,parent, extent) end

---通过 cfg_menulayer 表中的界面ID关闭该界面
---*  layerID : cfg_menulayer 表中的界面ID
---@param layerID integer
function SL:CloseMenuLayerByID(layerID,parent, extent) end

---打开设置界面
---*  pageID : 页签ID 不填默认基础设置 1 : 基础设置 2 : 视距 3 : 战斗 4 : 保护 5 : 挂机 6 : 帮助
function SL:OpenSettingUI(pageID) end

---关闭设置界面
function SL:CloseSettingUI() end

---打开行会指定页签界面
---*  page : 行会界面(不填默认行会主界面) 1 : 主页 2 : 成员 3 : 列表
---@param page integer
function SL:OpenGuildMainUI(page) end

---关闭行会界面
function SL:CloseGuildMainUI() end

---打开行会申请界面
function SL:OpenGuildApplyListUI() end

---关闭行会申请界面
function SL:CloseGuildApplyListUI() end

---打开行会创建界面
function SL:OpenGuildCreateUI() end

---关闭行会创建界面
function SL:CloseGuildCreateUI() end

---打开行会申请界面
function SL:OpenGuildAllyApplyUI() end

---关闭行会申请界面
function SL:CloseGuildAllyApplyUI() end

---行会宣战/结盟界面 [关闭]
function SL:CloseGuildWarSponsorUI() end

---打开背包界面
---*  data : {pos : 背包打开位置 bag_page : 背包打开页签ID}
---@param data table
function SL:OpenBagUI(data) end

---关闭背包界面
function SL:CloseBagUI() end

---打开英雄背包界面
function SL:OpenHeroBagUI() end

---关闭英雄背包界面
function SL:CloseHeroBagUI() end

---打开拍卖行
function SL:OpenAuctionUI() end

---关闭拍卖行
function SL:CloseAuctionUI() end

---打开摆摊界面
function SL:OpenStallLayerUI() end

---关闭摆摊界面
function SL:CloseStallLayerUI() end

---打开玩家交易界面
function SL:OpenTradeUI() end

---关闭玩家交易界面
function SL:CloseTradeUI() end

---打开玩家排行榜
---*  type : 打开 指定页签ID
---@param type integer
function SL:OpenRankUI(type) end

---关闭玩家排行榜
function SL:CloseRankUI() end

---打开聊天界面(手机端)
function SL:OpenChatUI() end

---关闭聊天界面(手机端)
function SL:CloseChatUI() end

---打开聊天扩展框
---*  index : 1 : 快捷命令 2 : 表情 3 : 背包
---@param index integer
function SL:OpenChatExtendUI(index) end

---关闭聊天扩展框
function SL:CloseChatUI() end

---打开交易行
function SL:OpenTradingBankUI() end

---关闭交易行
function SL:CloseTradingBankUI() end

---打开商城
---*  page : 打开 商城对应分页
---@param index integer
function SL:OpenChatExtendUI(index) end

---关闭商城
function SL:CloseStoreUI() end

---打开商城商品购买框
---*  storeIndex : 商品index cfg_store商城表配置的id
---*  limitStr : 超出限制购买的提示
---@param storeIndex integer
---@param limitStr string
function SL:OpenStoreDetailUI(storeIndex, limitStr) end

---关闭商城商品购买框
function SL:CloseStoreDetailUI() end

---打开技能配置界面
---*  storeIndex : 商品index cfg_store商城表配置的id
---*  limitStr : 超出限制购买的提示
---@param storeIndex integer
---@param limitStr string
function SL:OpenSkillSettingUI(storeIndex, limitStr) end

---关闭技能配置界面
function SL:CloseSkillSettingUI() end

---打开仓库界面
function SL:OpenStorageUI() end

---关闭仓库界面
function SL:CloseStorageUI() end

---打开社交界面
function SL:OpenSocialUI() end

---关闭社交界面
function SL:CloseSocialUI() end

---打开分辨率修改界面
function SL:OpenResolutionSetUI() end

---关闭分辨率修改界面
function SL:CloseResolutionSetUI() end

---打开玩家角色界面
---*  data : {extent: 子页id1装备、2状态、3属性、4技能、6称号、11时装 , isFast: boolen 是否快捷键打开}
---@param data table
function SL:OpenMyPlayerUI(data) end

---关闭玩家角色界面
function SL:CloseMyPlayerUI() end

---关闭玩家角色界面
---*  data : 移除对应子页id内容
---@param data table
function SL:CloseMyPlayerPageUI(data) end

---打开查看他人角色界面
---*  data : {extent: 子页id 1装备、2状态、3属性、4技能、6称号、11时装}
---@param data table
function SL:OpenOtherPlayerUI(data) end

---关闭查看他人角色界面
function SL:CloseOtherPlayerUI() end

---关闭查看他人角色界面
---*  data : 移除对应子页id内容
---@param data table
function SL:CloseOtherPlayerPageUI(data) end

---打开首饰盒界面
---*  param : 1: 自己人物 2:自己英雄 11:其他玩家人物 12:其他玩家英雄 21:交易行人物 22:交易行英雄
---@param param integer
function SL:OpenBestRingBoxUI(param) end

---关闭首饰盒界面
---*  param : 1: 自己人物 2:自己英雄 11:其他玩家人物 12:其他玩家英雄 21:交易行人物 22:交易行英雄
---@param param integer
function SL:CloseBestRingBoxUI(param) end

---打开邀请组队界面
function SL:OpenTeamInvite() end

---关闭邀请组队界面
function SL:CloseTeamInvite() end

---打开入队申请列表页
function SL:OpenTeamApply() end

---关闭入队申请列表页
function SL:CloseTeamApply() end

---打开小地图界面
function SL:OpenMiniMap() end

---关闭小地图界面
function SL:CloseMiniMap() end

---打开主界面技能按钮区域切换显示
function SL:OpenGuideEnter() end

---关闭主界面技能按钮区域切换显示
function SL:CloseGuideEnter() end

---打开转生点分配界面
function SL:OpenReinAttrUI() end

---关闭转生点分配界面
function SL:CloseReinAttrUI() end

---打开任务栏
function SL:OpenAssistUI() end

---关闭任务栏
function SL:CloseAssistUI() end

---打开主界面小地图收缩切换[手机端]
function SL:OpenMiniMapChangeUI() end

---关闭主界面小地图收缩切换[手机端]
function SL:CloseMiniMapChangeUI() end

---打开附近展示页
function SL:OpenMainNearUI() end

---关闭附近展示页
function SL:CloseMainNearUI() end

---直接调用支付
function SL:OpenCallPayUI() end

---打开客服UI
function SL:OpenKefuUI() end

---打开PC端私聊界面
function SL:OpenPCPrivateUI() end

---关闭PC端私聊界面
function SL:ClosePCPrivateUI() end

---PC端小地图变换
function SL:OpenPCMiniMapUI() end

---打开添加好友界面
function SL:OpenAddFriendUI() end

---关闭添加好友界面
function SL:CloseAddFriendUI() end

---打开添加黑名单界面
function SL:OpenAddBlackListUI() end

---关闭添加黑名单界面
function SL:CloseAddBlackListUI() end

---打开好友添加申请页
function SL:OpenFriendApplyUI() end

---关闭好友添加申请页
function SL:CloseFriendApplyUI() end

---打开 拍卖行-世界拍卖/行会拍卖
---*  parent : 挂接父节点
---*  source : 类别 0: 世界拍卖 1: 行会拍卖
---@param parent userdata
---@param source string
function SL:OpenAuctionWorldUI(parent, source) end

---关闭 拍卖行-世界拍卖/行会拍卖
function SL:CloseAuctionWorldUI() end

---打开 拍卖行-我的竞拍
---*  parent : 挂接父节点
---@param parent userdata
function SL:OpenAuctionBiddingUI(parent) end

---关闭 拍卖行-我的竞拍
function SL:CloseAuctionBiddingUI() end

---打开 拍卖行-我的上架
---*  parent : 挂接父节点
---@param parent userdata
function SL:OpenAuctionPutListUI(parent) end

---关闭 拍卖行-我的上架
function SL:CloseAuctionPutListUI() end

---打开 拍卖行-上架界面
---*  itemData : 背包物品数据
---@param itemData table
function SL:OpenAuctionPutinUI(itemData) end

---关闭 拍卖行-上架界面
function SL:CloseAuctionPutinUI() end

---打开 拍卖行-下架界面
---*  itemData : 背包物品数据
---@param itemData table
function SL:OpenAuctionPutoutUI(itemData) end

---关闭 拍卖行-下架界面
function SL:CloseAuctionPutoutUI() end

---打开 拍卖行-竞拍界面
---*  item : 拍卖行上架的物品数据
---@param item table
function SL:OpenAuctionBidUI(item) end

---关闭 拍卖行-竞拍界面
function SL:CloseAuctionBidUI() end

---打开 拍卖行-一口价界面
---*  item : 拍卖行上架的物品数据
---@param item table
function SL:OpenAuctionBuyUI(item) end

---关闭 拍卖行-一口价界面
function SL:CloseAuctionBuyUI() end

---打开 拍卖行-超时界面
---*  item : 拍卖行上架的物品数据
---@param item table
function SL:OpenAuctionTimeoutUI(item) end

---关闭 拍卖行-超时界面
function SL:CloseAuctionTimeoutUI() end

---打开 合成界面
function SL:OpenCompoundItemsUI() end

---关闭 合成界面
function SL:CloseCompoundItemsUI() end

---打开 怪物提示列表-设置界面
function SL:OpenBossTipsUI() end

---关闭 怪物提示列表-设置界面
function SL:CloseBossTipsUI() end

---打开 拾取列表-设置界面
function SL:OpenPickSettingUI() end

---关闭 拾取列表-设置界面
function SL:ClosePickSettingUI() end

---打开 保护配置-设置界面
---*  data : cfg_setup对应保护配置
---@param data table
function SL:OpenProtectSettingUI(data) end

---关闭 保护配置-设置界面
function SL:CloseProtectSettingUI() end

---打开 增加怪物名字-设置界面
---*  data : {ignoreName: boolean 是否是挂机忽略名字}
---@param data table
function SL:OpenAddNameUI(data) end

---关闭 增加怪物名字-设置界面
function SL:CloseAddNameUI() end

---打开 增加BOSS类型-设置界面
function SL:OpenAddBossTypeUI() end

---关闭 增加BOSS类型-设置界面
function SL:CloseAddBossTypeUI() end

---打开 增加BOSS类型-设置界面
---*  data : cfg_setup对应保护配置
---@param data table
function SL:OpenSkillRankPanelUI(data) end

---关闭 增加BOSS类型-设置界面
function SL:CloseSkillRankPanelUI() end

---打开 新增技能-设置界面
function SL:OpenSkillPanelUI() end

---关闭 新增技能-设置界面
function SL:CloseSkillPanelUI() end

---打开 选择下拉框
---*  list : 下拉要显示的内容
---*  position : 初始位置
---*  cellwidth : 单条cell的宽
---*  cellheight : 单条cell的高
---*  func : 回调 选中的编号1~n 0是关闭
---@param list table
---@param position table
---@param cellwidth integer
---@param cellheight integer
---@param func function
function SL:OpenSelectListUI(list, position, cellwidth, cellheight, func) end

---关闭 选择下拉框
function SL:CloseSelectListUI() end

---打开 996盒子界面
function SL:OpenBox996UI() end

---关闭 996盒子界面
function SL:CloseBox996UI() end

---打开 英雄状态选择界面
function SL:OpenHeroStateSelectUI(data) end

---关闭 英雄状态选择界面
function SL:CloseHeroStateSelectUI(data) end

---打开 通用描述Tips
---*  data : 见说明书
---@param data table
function SL:OpenCommonDescTipsPop(data) end

---关闭 通用描述Tips
function SL:CloseCommonDescTipsPop() end

---打开 通用弹窗
---*  data : 见说明书
---@param data table
function SL:OpenCommonTipsPop(data) end

---关闭 通用弹窗
function SL:CloseCommonTipsPop() end

---打开 道具装备Tips
---*  data : {itemData: 物品数据,pos: 提示位置,from: 来源}
---@param data table
function SL:OpenItemTips(data) end

---关闭 道具装备Tips
function SL:CloseItemTips() end

---打开 道具拆分弹窗
---*  itemData : 物品数据
---@param itemData table
function SL:OpenItemSplitPop(itemData) end

---关闭 道具拆分弹窗
function SL:CloseItemSplitPop() end

---通用功能选择提示
function SL:OpenFuncDockTips(data) end

---播放按钮点击音效
function SL:PlayBtnClickAudio() end

---播放音效
---*  id : cfg_sound表对应id
---*  isLoop : 是否循环
---@param id integer
---@param isLoop boolean
function SL:PlaySound(id, isLoop) end

---停止音效
---*  id : cfg_sound表对应id
---@param id integer
function SL:StopSound(id) end

---停止所有音效
function SL:StopAllAudio() end

---发送文本显示到聊天页输入框
---*  msg : 	文本内容
---@param msg string
function SL:SendInputMsgToChat(msg) end

---发送[装备]到聊天
---*  itemData : 	文本内容
---@param itemData table
function SL:SendEquipMsgToChat(itemData) end

---发送[位置]到聊天
function SL:SendPosMsgToChat() end

---发送[表情]到聊天
---*  itemData : 	表情配置
---@param itemData table
function SL:SendInputMsgToChat(itemData) end

---私聊目标
---*  targetID : 	目标玩家ID
---*  targetName : 		目标玩家名字
---@param targetID table
---@param targetName table
function SL:PrivateChatWithTarget(targetID, targetName) end

---资源下载
---*  path : 	保存的文件路径
---*  url : 		下载的资源路径
---*  downloadCB : 		回调函数
---@param path table
---@param url table
---@param downloadCB function
function SL:DownLoadRes(path, url,downloadCB) end

---快速选择目标
---*  data : 	{type: 0: 玩家;50: 怪物;400: 英雄 ,imgNotice: 没有目标时是否创建范围圈,systemTips: 没有目标时是否弹提示}
---@param data table
function SL:QuickSelectTarget(data) end


---获取视野内的玩家
---*  noMainPlayer : 	true: 不包含自己 ;false: 包含自己
---@param noMainPlayer table
function SL:FindPlayerInCurrViewField(noMainPlayer) end

---获取视野内的怪物
---*  noPetOfMainPlayer : 	true: 不包含自己的宠物 ;false: 包含自己的宠物
---*  noPetOfNetPlayer : 	true: 不包含别人的宠物 ;false: 包含别人的宠物
---@param noPetOfMainPlayer table
---@param noPetOfNetPlayer table
function SL:FindMonsterInCurrViewField(noPetOfMainPlayer, noPetOfNetPlayer) end

---控件加入到元变量自动刷新的组件
---*  metaValue : 	传入已配置元变量的字符串
---*  widget : 	文本控件或按钮控件
---@param metaValue table
---@param widget userdata
function SL:CustomAttrWidgetAdd(metaValue, widget) end

---添加提升按钮 等同TXT脚本命令addbutshow
---*  id : 	按钮id 必须唯一!!!! (同脚本命令加的id也不能重复)
---*  name : 	按钮展示文本
---*  func : 	点击按钮跳转函数
---@param id integer
---@param name string
---@param func function
function SL:AddUpgradeBtn(id, name,func) end


return SL