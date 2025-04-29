---@meta M2ServerLuaAPI
---所有行会在当晚同时攻城
function addattacksabukall() end

---添加buff
---*  obj: 玩家|怪物 对象
---*  buffid: buffid 10000以后
---*  time: 时间,对应buff表里维护的单位
---*  OverLap: 叠加层数,默认1
---*  objOwner: 施放者
---*  abil: 属性表 {[1]=200, [4]=20},属性id=值
---@param obj string
---@param buffid integer
---@param time? integer
---@param OverLap? integer
---@param objOwner? string
---@param abil? table
function addbuff(obj, buffid, time, OverLap, objOwner, abil) end

---增加气泡
---*  actor: 玩家对象
---*  id: ID
---*  name: 显示名称
---*  func: 函数名(多参数用逗号分割)
---@param actor string
---@param id integer
---@param name string
---@param func string
function addbutshow(actor, id, name, func) end

---增加自定义按钮
---*  actor: 玩家对象
---*  windowid: 主窗口ID
---*  name: 按钮ID
---*  func: 图标内容
---@param actor string
---@param windowid integer
---@param buttonid integer
---@param icon string
function addbutton(actor, windowid, buttonid, icon) end

---增加限次使用物品的次数
---*  actor: 玩家对象
---*  actor: 物品唯一ID
---*  actor: 次数
---@param actor string
---@param itemmakeid integer
---@param num integer
function addfunitemdura(actor, itemmakeid, num) end

---添加队员
---*  actor: 玩家对象
---*  userId: 组员UserId
---@param actor string
---@param userId string
function addgroupmember(actor, userId) end

---临时增加怪物爆出物品
---*  actor: 玩家对象
---*  mon: 怪物对象
---*  itemname: 物品名称
---@param actor string
---@param mon string
---@param itemname string
function additemtodroplist(actor, mon, itemname) end

---增加动态地图连接
--- * gateName: 传送门名称
--- * Mapfrom: 传送门起点地图ID
--- * x1: 传送门起点坐标x
--- * y1: 传送门起点坐标y
--- * range: 传送门可传送范围
--- * Mapto: 传送门终点地图ID
--- * x1: 传送门终点坐标x
--- * y1: 传送门终点坐标y
--- * time: 传送门持续时间(0:无限长)
---@param gateName string
---@param Mapfrom string
---@param x1 integer
---@param y1 integer
---@param range integer
---@param Mapto string
---@param x2 integer
---@param y2 integer
---@param time integer
function addmapgate(gateName, Mapfrom, x1, y1, range, Mapto, x2, y2, time) end

---创建镜像地图
---*  oldMap: 原地图ID
---*  NewMap: 新地图ID
---*  NewName: 新地图名
---*  time: 有效时间(秒)
---*  BackMap: 回城地图
---@param oldMap string
---@param NewMap string
---@param NewName string
---@param time integer
---@param BackMap string|integer
---@param miniMapID? integer
---@param posmX? integer
---@param posmY? integer
function addmirrormap(oldMap, NewMap, NewName, time, BackMap, miniMapID, posmX, posmY) end

---增加宠物属性
---*  actor: 玩家对象
---*  idx: 宠物序号
---*  attrName: 自定义属性组名
---*  opt: 操作符 + - =
---*  attr: 属性字符串
---*  type: 0或空=计算套装属性增加1=增加固定值;不计算套装属性(属性加成类无效)
---@param actor string
---@param idx integer|string
---@param attrName integer|string
---@param opt string
---@param attr string
---@param type? integer
function addpetattlist(actor, idx, attrName, opt, attr, type) end

---增加宠物攻击表现
---*  actor: 玩家对象
---*  idx: 宠物序号或"X"表示当前宠物
---*  skillid: 增加的攻击表现ID
---@param actor string
---@param idx integer|string
---@param skillid integer
function addpetskill(actor, idx, skillid) end

---添加技能
---*  actor: 玩家对象
---@param actor string
---@param skillid integer
---@param level integer
function addskill(actor, skillid, level) end

---把行会添加到攻城列表
---*  name: 行会名
---*  day: 天数
---@param name string
---@param day integer
function addtocastlewarlist(name, day) end

---强制把行会添加到攻城列表
---*  name: 行会名 传入"*"所有行会
---@param name string
function addtocastlewarlistex(name) end

---本服通知触发跨服QF
-- * msgID: 消息ID
-- * userID: 用户ID
-- * arg1: 消息内容1
-- * arg2: 消息内容2
---@param msgID integer
---@param userID string
---@param arg1 string
---@param arg2 string
function bfbackcall(msgID, userID, arg1, arg2) end

---创建行会
---*  actor: 玩家对象
---*  name: 行会名
---@param actor string
---@param name string
function buildguild(actor, name) end

---调用其他NPC的lua函数
---*  actor: 玩家对象
---*  npcidx: NPC索(NPC配置表中的ID)
---*  delaytime: 延迟时间ms,0立即执行
---*  func: 函数名
---*  sParam: 	参数
---@param actor string
---@param npcidx integer
---@param delaytime integer
---@param func string
---@param sParam string
function callfunbynpc(actor, npcidx, delaytime, func, sParam) end

---调用TXT脚本命令
---*  actor: 玩家对象
---*  filename: 文件名
---*  label: 标签
---@param actor string
---@param filename string
---@param label string
function callscript(actor, filename, label) end

---调用传奇脚本命令
---*  actor: 玩家对象
---*  scriptname: 脚本接口
---*  ...: 参数1~参数10
---@param actor string
---@param scriptname string
function callscriptex(actor, scriptname, ...) end

---调用传奇脚本命令2
---*  actor: 玩家对象
---@param actor string
---@param scriptname string
---@param ... any
---@return boolean 是否满足
function callcheckscriptex(actor, scriptname, ...) end

---获取玩家沙巴克身份
---*  actor: 玩家对象
---*  return: 返回值 0-非沙巴克成员1-沙巴克成员2-沙巴克老大
---@param actor string
---@return integer
function castleidentity(actor) end

---沙巴克基本信息
---*  nID: 信息索引 1=沙城名称,返回string; 2=沙城行会名称,返回string; 3=沙城行会会长名字,返回string;
---*  nID: 信息索引 4=占领天数,返回integer; 5=当前是否在攻沙状态,返回Bool; 6=沙城行会副会长名字列表,返回table
---@param nID integer
function castleinfo(nID) end

---修改攻击模式
---*  actor: 玩家对象
---*  attackmode: 0-全体攻击
---*  attackmode: 1-和平攻击
---*  attackmode: 2-夫妻攻击
---*  attackmode: 3-师徒攻击
---*  attackmode: 4-编组攻击
---*  attackmode: 5-行会攻击
---*  attackmode: 6-红名攻击
---*  attackmode: 7-国家攻击
---@param actor string
---@param attackmode integer
function changeattackmode(actor, attackmode) end

---绑定自定义装备属性
---*  actor: 玩家对象
---*  item: 物品对象
---*  attrindex: 属性位置(0~9)
---*  bindindex: 绑定类型(0~4)
---*  bindvalue: 绑定的值
---*  group: 显示分类位置(0~2 ;为空默认为0)
---@param actor string
---@param item string
---@param attrindex integer
---@param bindindex integer
---@param bindvalue integer
---@param group? integer
function changecustomitemabil(actor, item, attrindex, bindindex, bindvalue, group) end

---增加和修改自定义属性分类名称
---*  actor: 玩家对象
---*  item: 物品对象
---*  typename: 分类名称(-1为清空)
---*  group: 显示分类位置(0~2 ;为空默认为0)
---@param actor string
---@param item string
---@param typename string
---@param group? integer
function changecustomitemtext(actor, item, typename, group) end

---增加和修改分类名称颜色
---*  actor: 玩家对象
---*  item: 物品对象
---*  color: 分类颜色(0~255)
---*  group: 显示分类位置(0~2 ;为空默认为0)
---@param actor string
---@param item string
---@param color integer
---@param group? integer
function changecustomitemtextcolor(actor, item, color, group) end

---修改自定义属性值
---*  actor: 玩家对象
---*  item: 物品对象
---*  attrindex: 属性位置(0~9)每个装备可以自定义10个属性
---*  operate: 操作符:+、-、=
---*  value: 属性值
---*  group: 显示分类位置(0~2 ;为空默认为0)
---@param actor string
---@param item string
---@param attrindex integer
---@param operate string
---@param value integer
---@param group? integer
function changecustomitemvalue(actor, item, attrindex, operate, value, group) end

---修改武器、衣服特效
---*  actor: 玩家对象
---*  where: 位置 0 1
---*  EffId: 特效ID
---*  selfSee: 玩家对象
---@param actor string
---@param where integer
---@param EffId integer
---@param selfSee integer
function changedresseffect(actor, where, EffId, selfSee) end

---设置人物经验值
---*  actor: 玩家对象
---*  opt: 玩家对象
---*  count: 玩家对象
---*  addexp: 是否增加聚灵珠经验
---@param actor string
---@param opt string
---@param count integer
---@param addexp boolean
function changeexp(actor, opt, count, addexp) end

---设置行会成员人数上限
---*  actor: 玩家对象
---*  char: 操作符 + - =
---*  num: 数量
---@param actor string
---@param char string
---@param num integer
function changeguildmemberlimit(actor, char, num) end

---调整人物属性
---*  actor: 玩家对象
---*  id: 属性ID 1-20
---*  time: 属性值
---*  value: 时间(秒)
---1=防御下限
---2=防御上限
---3=魔御下限
---4=魔御上限
---5=攻击下限
---6=攻击上限
---7=魔法下限
---8=魔法上限
---9=道术下限
---10=道术上限
---11=MaxHP
---12=MaxMP
---13=HP恢复
---14=MP恢复
---15=毒恢复
---16=毒躲避
---17=魔法躲避
---18=准确
---19=敏捷
---20= 幸运
---@param actor string
---@param id integer
---@param value integer
---@param time integer
function changehumability(actor, id, value, time) end

---修改人物名称
---*  actor: 玩家对象
---*  name: 要查询的名字
---@param actor string
---@param name string
function changehumname(actor, name) end

---清除人物身上播放的特效
---*  actor: 玩家对象
---*  effectid: 特效ID
---@param actor string
---@param effectid integer
function clearplayeffect(actor, effectid) end

---清空所有技能
---*  actor: 玩家对象
---@param actor string
function clearskill(actor) end

---关闭当前的NPC对话框
---*  actor: 玩家对象
---@param actor string
function close(actor) end

---召唤拾取小精灵
---*  actor: 玩家对象
---*  monName: 精灵名称 精灵需要在cfg_monster.xls怪物表配置:Race=216
---@param actor string
---@param monName string
function createsprite(actor, monName) end

---删除英雄
---*  actor: 玩家对象
---@param actor string
function delhero(actor) end

---删除Ini文件配置项
---*  actor: 玩家对象
---@param actor string
function deliniitem(actor) end

---删除Ini文件配置项(带Cache)
---*  actor: 玩家对象
---@param actor string
function deliniitembycache(actor) end

---删除Ini文件配置区
---*  actor: 玩家对象
---@param actor string
function delinisection(actor) end

---删除Ini文件配置区 带Cache
---*  actor: 玩家对象
---@param actor string
function delinisectionbycache(actor) end

---通过物品唯一id拿走物品
---*  actor: 玩家对象
---*  makeindx: 物品唯一ID,逗号(,)串联
---*  count: 叠加物品扣除数量，不填此参数，默认全部扣除不可叠加物品全部扣除
---*  desc: 描述
---@param actor string
---@param makeindx string|integer
---@param count? integer
---@param desc? string
function delitembymakeindex(actor, makeindx, count, desc) end

---删除地图特效
---*  Id: 特效播放ID
---@param Id integer
function delmapeffect(Id) end

---删除动态地图连接
---*  actor: 玩家对象
---*  MapId: 玩家对象
---@param actor string
---@param MapId string|integer
function delmapgate(actor, MapId) end

---删除镜像地图
---*  MapId: 地图ID
---@param MapId string|integer
function delmirrormap(MapId) end

---删除国家
---*  nIdx: 国家ID
---@param nIdx integer
function delnation(nIdx) end

---删除非本职业技能
---*  actor: 玩家对象
---@param actor string
function delnojobskill(actor) end

---删除NPC
---*  name: NPC名称
---*  map: 地图编号
---@param name string
---@param map string
function delnpc(name, map) end

---删除NPC特效
---*  actor: 玩家对象
---*  NPCIndex: NPC索引 NPC配置表中的ID
---@param actor string
---@param NPCIndex integer
function delnpceffect(actor, NPCIndex) end

---删除宠物
---*  actor: 玩家对象
---*  idx: 宠物序号
---@param actor string
---@param idx integer
function delpet(actor, idx) end

---删除技能
---*  actor: 玩家对象
---*  skillid: 技能ID
---@param actor string
---@param skillid integer
function delskill(actor, skillid) end

---根据唯一ID删除仓库物品
---*  actor: 玩家对象
---*  itemmakeid: 删除唯一ID物品
---@param actor string
---@param itemmakeid integer
function delstorageitem(actor, itemmakeid) end

---根据idx删除仓库物品
---*  actor: 玩家对象
---*  itemidx: 删除所有Idx物品
---@param actor string
---@param itemidx integer
function delstorageitembyidx(actor, itemidx) end

---删除称号
---*  actor: 玩家对象
---*  name: 称号物品名称
---@param actor string
---@param name string
function deprivetitle(actor, name) end

---使用脚本命令解毒(红绿毒)
---*  actor: 玩家对象
---*  opt: -1,解所有毒;0,绿毒;1,红毒;3,紫毒;5,麻痹;6,冰冻;7,蛛网
---@param actor string
---@param opt integer
function detoxifcation(actor, opt) end

---下马
---*  actor: 玩家对象
---@param actor string
function dismounthorse(actor) end

---停止摆摊
---*  actor: 玩家对象
---@param actor string
function forbidmyshop(actor) end

---获取角色所有buff
---*  actor: 玩家对象
---@param actor string
---@return table buff列表
function getallbuffid(actor) end

---获取所有行会对象
---@return table
function getallguild() end

---获取当前攻击模式
---*  actor: 玩家对象
---@param actor string
---@return integer 攻击模式：0-全体攻击1-和平攻击2-夫妻攻击3-师徒攻击4-编组攻击5-行会攻击6-红名攻击7-国家攻击
function getattackmode(actor) end

---获取背包剩余空格数
---*  actor: 玩家对象
---@param actor string
---@return integer
function getbagblank(actor) end

---获取背包物品数量
---*  actor: 玩家对象
---*  itemname: 物品名称
---@param actor string
---@param itemname string
---@param model? integer
---@return integer
function getbagitemcount(actor, itemname, model) end

---获取 人物|怪物 相关信息
---*  obj: 玩家|怪物 对象
---*  nID: 类型 (详见说明书)
---*  param3: 参数3 (仅ID=1时可用)
---@param obj string
---@param nID
---| -1 #是否玩家 (true:玩家)
---| 0 #是否死亡 (true:死亡状态)
---| 1 #对象名称 (返回值字符型)，当对象为怪物时，param3=0/nil，返回怪物显示名(即去除了尾部的数字)，param3=1时返回怪物默认名(怪物表中配置的名字)，param3=2时返回怪物实际名(游戏内实际展示的名字,新增于引擎64_23.08.30)
---| 2 #对象唯一ID ?(返回值字符型) = userid
---| 3 #对象当前地图ID (返回值字符型)
---| 4 #对象当前X坐标
---| 5 #对象当前Y坐标
---| 6 #对象当前等级
---| 7 #对象当前职业 (0-战 1-法 2-道)
---| 8 #对象当前性别
---| 9 #对象当前血量(HP)
---| 10 #对象当前血量上限(MAXHP)
---| 11 #对象当前蓝量(MP)
---| 12 #对象当前蓝量上限(MAXMP)
---| 13 #对象当前经验(Exp)
---| 14 #对象当前经验上限(MaxExp)
---| 15 #对象物防下限
---| 16 #对象物防上限
---| 17 #对象魔防下限
---| 18 #对象魔防上限
---| 19 #对象物攻下限
---| 20 #对象物攻上限
---| 21 #对象魔攻下限
---| 22 #对象魔攻上限
---| 23 #对象道攻下限
---| 24 #对象道攻上限
---| 25 #对象幸运值
---| 26 #对象HP恢复
---| 27 #对象MP恢复
---| 28 #对象中毒恢复
---| 29 #毒物躲避
---| 30 #对象魔法躲避
---| 31 #对象准确(无法设置)
---| 32 #对象敏捷
---| 33 #发型
---| 34 #背包物品数量(仅人物)
---| 35 #队伍成员数量(仅人物)
---| 36 #行会名(仅人物)
---| 37 #是否会长(仅人物)
---| 38 #宠物数量
---| 39 #转生等级(仅人物)
---| 40 #杀怪经验倍数(仅人物)
---| 41 #杀怪经验时间(仅人物)
---| 42 #显示延时TIMERECALL还剩多少秒(仅人物)
---| 43 #人物杀怪爆率倍数(仅人物)
---| 44 #复活时间
---| 45 #地图名MAPTITLE
---| 46 #PK点
---| 47 #是否新人(仅人物)
---| 48 #是否安全区
---| 49 #是否摆摊中(仅人物)
---| 50 #是否交易中(仅人物)
---| 51 #对象att属性值，需要提供 参数3:属性ID(cfg_att_score.xls设置：1~129，200~249)自定义属性在24.0807引擎拓展到200~399
---| 52 #穿人/怪方式 0=恢复/1=穿人/2=穿怪/3=穿人穿怪
---| 53 #登录状态，0：正常，1：断线重连(仅人物)
---| 54 #主人UserId
---| 55 #Idx
---| 56 #颜色(0~255)
---| 57 #最后杀死的怪物Index(仅人物)
---| 57 #爆怪次数(等同之前 MonItems 功能)
---| 58 #时装显示状态(仅人物)
---| 59 #主人对象
---| 60 #是否在攻沙/攻城区域(bool)
---| 61 #是否为离线挂机状态(bool)
---| 62 #获取怪物表自定义常量(25列)
---| 63 #人物背包大小
---| 64 #获取对象当前的身体颜色值
---| 65 #获取对象的回城地图
---| 67 #获取对象的攻击对象
---| 68 #怪物归属对象
---| 69 #获取对象当前的方向(新增于引擎64_23.08.30)
---@param param3? integer
---@return any
function getbaseinfo(obj, nID, param3) end

---获取人物通用货币数量(多货币计算)
---*  actor: 玩家对象
---@param actor string
---@param moneyName string
---@return integer
function getbindmoney(actor, moneyName) end

---获取buff信息
---*  actor: 玩家对象
---*  buffid: buffid
---*  type: 1=叠加层数;2=剩余时间(单位跟配置一致);3=获取施法者对象(对象离线返回nil);4=获取额外属性;
---@param actor string
---@param buffid integer
---@param type integer
---@return integer|string|nil
function getbuffinfo(actor, buffid, type) end

---获取常量
---*  actor: 玩家对象
---*  varname: 常量名称,详见txt说明书
---@param actor string
---@param varname string
---@return string
function getconst(actor, varname) end

---获取标记值
---*  obj: 人物|怪物对象
---*  index: 下标ID 0-9
---@param obj string
---@param index string|integer
---@return string
function getcurrent(obj, index) end

---根据物品获取Json
---*  item: 物品对象
---@param item string
---@return string
function getitemjson(item) end

---检测装备名字的颜色
---*  item: 物品对象
---@param item string
---@return integer
function getitemnamecolor(item) end

---获取当前唯一ID物品的星星数量
---*  actor: 玩家对象
---*  itemmakeid: 物品唯一ID
---@param actor string
---@param itemmakeid integer
---@return integer
function getitemstars(actor, itemmakeid) end

---获取指定地图玩家数量
---*  actor: 玩家对象
---*  MapId: 地图ID
---*  isAllgain: 是否全部获取 0=全部获取 1=排除已死亡的
---@param actor string
---@param MapId string|integer
---@param isAllgain integer
---@return integer
function getplaycountinmap(actor, MapId, isAllgain) end

---获取玩家变量
---*  actor: 玩家对象
---*  varName: 变量名
---@param actor string
---@param varName string
---@return integer|string
function getplaydef(actor, varName) end

---根据玩家唯一ID获取玩家对象
---*  string: 玩家唯一ID
---@param makeindex string
---@return string
function getplayerbyid(makeindex) end

---根据玩家名获取玩家对象
---*  name: 玩家名字
---@param name string
---@return string
function getplayerbyname(name) end

---获取所有在线玩家列表
---*  param: 是否剔除离线挂机玩家0=不剔除1=剔除
---@param param? integer
---@return table
function getplayerlst(param) end

---获取行会成员在行会中的职位
---*  actor: 玩家对象
---@param actor string
---@return integer
function getplayguildlevel(actor) end

---获取自定义变量
---*  actor: 玩家对象
---*  model: 变量范围(HUMAN/GUILD)
---*  varName: 变量名
---@param actor string
---@param model string
---@param varName? string
---@return string|integer
function getplayvar(actor, model, varName) end

---获取仓库剩余格子数
---*  actor: 玩家对象
---@param actor string
---@return integer
function getsblank(actor) end

---获取技能初始冷却时间
---*  skillname: 玩家对象
---@param skillname string
---@return integer
function getskillcscd(skillname) end

---获取当前技能冷却时间
---*  actor: 玩家对象
---*  skillname: 技能名称
---@param actor string
---@param skillname string
---@return integer
function getskilldqcd(actor, skillname) end

---根据技能名字获取技能id
---*  skillname: 技能名称
---@param skillname string
---@return integer
function getskillindex(skillname) end

---获取技能信息
---*  actor: 玩家对象
---*  skillid: 技能ID
---*  type: 获取类型:1:等级;2:强化等级;3:熟练度;4:熟练度上限;
---@param actor string
---@param skillid integer
---@param type integer
---@return integer|nil 没有技能，返回nil
function getskillinfo(actor, skillid, type) end

---获取技能等级
---*  actor: 玩家对象
---*  skillid: 技能ID
---@param actor string
---@param skillid integer
---@return integer
function getskilllevel(actor, skillid) end

---获取技能强化等级
---*  actor: 玩家对象
---*  skillid: 技能ID
---@param actor string
---@param skillid integer
---@return integer
function getskilllevelup(actor, skillid) end

---根据技能id获取技能名字
---*  skillID: 技能ID
---@param skillID integer
---@return string
function getskillname(skillID) end

---获取技能熟练度
---*  actor: 玩家对象
---@param actor string
---@param skillid integer
---@return integer
function getskilltrain(actor, skillid) end

---根据宝宝索引获取角色宝宝对象
---*  actor: 玩家对象
---*  nIndex: 索引(0开始)
---@param actor string
---@param nIndex integer
---@return string
function getslavebyindex(actor, nIndex) end

---获取装备钻石镶嵌情况
---*  actor: 玩家对象
---*  item: 装备对象
---@param actor string
---@param item string
---@return string 开孔相关，json字符串，支持0-9共10个孔
function getsocketableitem(actor, item) end

---获取玩家仓库最大格子数
---*  actor: 玩家对象
---@param actor string
---@return integer
function getssize(actor) end

---获取buff模板信息
---*  buffinfo: buffID/buff名称
---*  id: 0:idx1:名称;2.组别;3.配置时间;4.配置属性;
---@param buffinfo integer|string
---@param id integer
---@return integer 不存在返回0
function getstdbuffinfo(buffinfo, id) end

---获取物品基础属性
---*  itemid: 物品ID
---@param itemid integer
---@param id integer
---@return integer 不存在返回0
function getstditematt(itemid, id) end

---获取物品基础信息
---*  item: 物品ID/物品名称
---*  id:见说明书
---@param item integer|string
---@param id
---| 0  # index     index
---| 1  # name      名称
---| 2  # stdmode   StdMode
---| 3  # shape     Shape
---| 4  # weight    重量
---| 5  # anicount  AniCount
---| 6  # maxdura   最大持久
---| 7  # overlap   叠加数量
---| 8  # price     价格（price）
---| 9  # need      使用条件
---| 10 # needlevel :使用等级
---| 11 # custom25  :道具表自定义常量(25列)
---| 12 # custom26  :道具表自定义常量（26列）
---| 13 # color     :颜色
---@return integer|string 不存在返回0
function getstditeminfo(item, id) end

---获取仓库所有物品列表
---*  actor: 玩家对象
---@param actor string
---@return table
function getstorageitems(actor) end

---获取人物伤害吸收
---*  actor: 玩家对象
---@param actor string
---@return integer
function getsuckdamage(actor) end

---获取全局变量
---*  varName: 变量名
---@param varName string
---@return string|integer
function getsysvar(varName) end

---获取全局自定义变量
---*  varName: 变量名
---@param varName string
---@return string|integer
function getsysvarex(varName) end

---获取服务器上64位时间戳
---@return integer
function gettcount64() end

---获取物品来源
---*  actor: 玩家对象
---*  item: 物品对象
---@param actor string
---@param item string
---@return string json字符串
function getthrowitemly(actor, item) end

---获取角色所有称号
---*  actor: 玩家对象
---@param actor string
---@return table
function gettitlelist(actor) end

---获取人物永久属性
---*  actor: 玩家对象
---*  nIndex: 	索引
---@param actor string
---@param nIndex integer
---@return integer
function getusebonuspoint(actor, nIndex) end

---给物品
---*  actor: 玩家对象
---*  itemname: 物品名称
---*  num: 	数量
---*  bind: 物品规则
---*  desc: 描述
---@param actor string
---@param itemname string
---@param num? integer
---@param bind? integer
---@param desc? string
function giveitem(actor, itemname, num, bind, desc) end

---根据json字符串给物品
---*  actor: 玩家对象
---*  json: json字符串
---*  desc: 备注
---@param actor string
---@param json string
---@param desc? string
---@return string
function giveitembyjson(actor, json, desc) end

---给物品,并直接穿戴
---*  actor: 玩家对象
---*  where: 装备位置
---*  itemname: 物品名称
---*  num: 数量
---*  bind: 物品规则
---*  desc: 描述
---@param actor string
---@param where integer
---@param itemname string
---@param num? integer
---@param bind? integer
---@param desc? string
function giveonitem(actor, where, itemname, num, bind, desc) end

---获取全局信息
---*  id: 见说明书
---@param id integer
function globalinfo(id) end

---执行GM命令
---*  actor: 玩家对象
---*  GM: GM命令
---*  ...: 命令参数
---@param actor string
---@param GM string
---@param ... any
function gmexecute(actor, GM, ...) end

---回到最近经过的城市安全区
---*  actor: 玩家对象
---@param actor string
function gohome(actor) end

---调用触发
---*  actor: 玩家对象
---*  type: 触发模式
---*  label: 跳转后的接口
---*  range: 触发模式=3时指定的范围大小
---@param actor string
---@param type integer
---@param label string
---@param range? integer
function gotolabel(actor, type, label, range) end

---导航玩家到指定位置
---*  actor: 玩家对象
---*  x: X坐标
---*  y: Y坐标
---@param actor string
---@param x integer
---@param y integer
function gotonow(actor, x, y) end

---检测地图逻辑格
---*  mapid: 地图Id
---*  x: X坐标
---*  y: Y坐标
---*  type: 逻辑格类型:1.能否到达;2.安全区;3.攻城区;
---*  return: true=相同;false=不相同
---@param mapid string|integer
---@param x integer
---@param y integer
---@param type integer
---@return boolean
function gridattr(mapid, x, y, type) end

---获取全局信息
---*  id:  0: 全局玩家信息<br>1: 部署时间开始 开发天数 开区天数建议获取常量<$KFDAY><br>2: 部署时间开始 开服时间 开服时间建议获取常量<$showtime><br>3: 合服次数<br>4: 合服时间<br>5: 服务器IP<br>6: 玩家数量<br>7: 背包最大数量<br>8: 引擎版本号（以线上版本为准,测试版、本地版可能存在差异）<br>9：游戏id10：服务器名称获取异常,用常量<$SERVERNAME><br>11：服务器id
---@param id integer
---@return any
function grobalinfo(id) end

---编组地图传送
---*  actor: 玩家对象
---*  mapid: 地图Id
---*  x: X坐标
---*  y: Y坐标
---*  level: 可以传送最低等级(可以为空 为空时不检测队员的等级直接传送)
---*  value: 传送范围。(以队长为中心传送队友 0为不需要范围)
---*  funcName: 触发字段(可以为空)
---*  isShowEffect: 是否播放传送特效(引擎64_24.08.07新增,0/nil=展示传送特效,1=不展示传送特效)
---@param actor string
---@param mapid string|integer
---@param x integer
---@param y integer
---@param level? integer
---@param value? integer
---@param funcName? string
---@param isShowEffect? integer
function groupmapmove(actor, mapid, x, y, level, value, funcName, isShowEffect) end

---发送自定义颜色的文字信息
---*  actor: 玩家对象
---*  FColor: 前景色
---*  BColor: 背景色
---*  Msg: 消息内容
---*  flag: 发送对象：Self：只发给自己；Group：发送给组队：Map：发送到当前地图中的人物；省略参数四表示全服发送.
---@param actor string
---@param FColor integer
---@param BColor integer
---@param Msg string
---@param flag? string
function guildnoticemsg(actor, FColor, BColor, Msg, flag) end

---是否有buff
---*  actor: 玩家对象
---*  buffid: 玩家对象
---@param actor string
---@param buffid integer
function hasbuff(actor, buffid) end

---是否有英雄
---*  actor: 玩家对象
---@param actor string
function hashero(actor) end

---刷新血量/蓝量
---*  actor: 玩家/怪物对象
---@param actor string
function healthspellchanged(actor) end

---数据消息上报
---*  actor: 玩家对象
---@param url string
---@param suffix string
---@param head string
function httppost(url, suffix, head) end

---修改人物当前血量
---*  actor: 玩家对象
---*  operate: 操作符号 [+增加][-减少][=等于]
---*  nvalue: HP点数
---*  effid: 素材ID,cfg_damage_number表中的ID编号，ID可自行增加和配置
---*  delay: 延时时间(秒)
---*  hiter: 伤害来源对象
---*  isSend: 释放广播飘血-0=不广播;1=广播
---*  isRob: 是否强制修改归属0=强制修改归属;1=已有归属的情况不抢归属
---@param actor string
---@param operate string
---@param nvalue integer
---@param effid? integer
---@param delay? integer
---@param hiter? string
---@param isSend? integer
---@param isRob? integer
function humanhp(actor, operate, nvalue, effid, delay, hiter, isSend, isRob) end

---修改人物当前MP
---*  actor: 玩家对象
---*  operate: 操作符号 [+增加][-减少][=等于]
---*  nvalue: MP点数
---@param actor string
---@param operate string
---@param nvalue integer
function humanmp(actor, operate, nvalue) end

---取自定义数字变量名位置
---*  actor: 玩家对象
---*  varName: 排序变量名
---*  playflag: 0-所有玩家 1-在线玩家
---*  sortflag: 0-升序 1-降序
---@param actor string
---@param varName string
---@param playflag integer
---@param sortflag integer
function humvarrank(actor, varName, playflag, sortflag) end

---引用文件
---*  path: 路径名称(起始目录Envir)
---@param path string
function include(path) end

---初始化行会自定义变量
---*  guil: 行会对象
---*  varType: 变量类型
---*  varName: 变量名
---@param guil string
---@param varType string
---@param varName string
function iniguildvar(guil, varType, varName) end

---初始化个人自定义变量
---*  actor: 玩家对象
---*  varType: 变量类型(integer/string)
---*  varRage: 变量范围(HUMAN/GUILD) HUMAN指个人变量 GUILD指行会变量
---*  varName: 变量名
---@param actor string
---@param varType string
---@param varRage string
---@param varName string
function iniplayvar(actor, varType, varRage, varName) end

---初始化全局自定义变量
---*  type: 变量类型(integer/string)
---*  varName: 变量名
---*  itype: 合区类型
---@param type string
---@param varName string
---@param itype? integer
function inisysvar(type, varName, itype) end

---判断地图坐标是否为空
---*  mapname: 地图名称
---*  nX: 地图x坐标
---*  nY: 地图y坐标
---@param mapname string
---@param nX integer
---@param nY integer
function isemptyinmap(mapname, nX, nY) end

---判断英雄是否为唤出状态
---*  actor: 玩家对象
---@param actor string
function isherorecall(actor) end

---监测国家战争状态
---*  actor: 玩家对象
---@param actor string
function isnationswar(actor) end

---对象是否存在
---*  actor: 玩家对象
---@param actor string
function isnotnull(actor) end

---判断对象是否可被攻击
---*  Hiter: 攻击对象(玩家/英雄/怪物)
---*  Target: 被攻击对象(玩家/英雄/怪物)
---@param Hiter string
---@param Target string
function ispropertarget(Hiter, Target) end

---加入/退出国家
---*  actor: 玩家对象
---*  nIdx: 国家ID (1~100),填0退出国家
---*  jobIdx: 职位编号 0-9 不填 默认为0
---@param actor string
---@param nIdx integer
---@param jobIdx? integer
function joinnational(actor, nIdx, jobIdx) end

---字符串转换成表格
---*  str: json字符串
---@param str string
---@return table
function json2tbl(str) end

---跨服通知触发本服QF
---*  id: 消息id 1-99
---*  userid: 玩家userid
---*  parama: 传递的字符串1(字符串)
---*  paramb: 传递的字符串2(字符串)
---@param id integer
---@param userid string
---@param parama string
---@param paramb string
function kfbackcall(id, userid, parama, paramb) end

---人物强制掉线
---*  actor: 玩家对象
---@param actor string
function kick(actor) end

---立即杀死角色
---*  play: 角色的对象
---*  actor: 凶手的对象
---@param actor string
---@param strKiller? string
function kill(actor, strKiller) end

---脚本设置防秒杀功能
---*  actor: 玩家对象
---@param actor string
function killedprotect(actor) end

---在指定位置优先打指定打怪
---*  actor: 玩家对象
---*  map: 地图
---*  X: 	X坐标
---*  Y: 	Y坐标
---*  MonName: 优先攻击的怪物名称支持多个怪物名称,怪物名称中间用 | 分隔
---@param actor string
---@param map string
---@param X integer
---@param Y integer
---@param MonName? string
function killmobappoint(actor, map, X, Y, MonName) end

---杀怪2
---*  actor: 玩家对象
---*  mon: 怪物对象
---*  drop: 是否掉落物品 true掉落|false不掉落
---*  trigger: 是否触发killmon
---*  showdie: 是否显示死亡动画
---@param actor string
---@param mon string
---@param drop boolean
---@param trigger boolean
---@param showdie boolean
function killmonbyobj(actor, mon, drop, trigger, showdie) end

---杀怪1
---*  mapid: 地图id
---*  monname: 怪物全名 填 nil|* 杀死全部
---*  count: 数量 填0杀死所有
---*  drop: 是否掉落物品
---@param mapid string|integer
---@param monname string
---@param count integer
---@param drop boolean
function killmonsters(mapid, monname, count, drop) end

---所有跨服玩家回本服 根据执行区服自行处理
function kuafuusergohome() end

---关联装备物品
---*  actor: 玩家对象
---*  where: 装备位置
---@param actor string
---@param where integer
---@return string 物品对象
function linkbodyitem(actor, where) end

---改变 人/怪物 状态
---*  actor: 玩家/怪物 对象
---*  type: 类型(0=绿毒 1=红毒 5=麻痹 12=冰冻 13= 蛛网 其他无效)
---*  time: 时间(秒)
---*  value: 威力 只针对绿毒有用
---*  model: 0=不进行防护的判断1=判断防全毒、防麻痹、防冰冻、防蛛网状态
---@param actor string
---@param type integer
---@param time integer
---@param value? integer
---@param model? integer
function makeposion(actor, type, time, value, model) end

---跳转地图(随机坐标)
---*  actor: 玩家对象
---*  MapId: 地图id
---@param actor string
---@param MapId string|integer
function map(actor, MapId) end

---添加地图特效
---*  Id: 	特效播放ID 用于区分多个地图特效
---*  MapId: 地图ID
---*  X: 坐标X
---*  Y: 坐标Y
---*  effId: 特效ID
---*  time: 持续时间(秒)
---*  mode: 模式:(0~4 0所有人可见 1自己可见 2组队可见 3行会成员可见 4敌对可见)
---*  actor: 玩家对象(模式1~4需填写)
---*  effectModel: 0=在人物/怪物后面1=在人物/怪物前面
---@param Id integer
---@param MapId string|integer
---@param X integer
---@param Y integer
---@param effId integer
---@param time integer
---@param mode integer
---@param actor? string
---@param effectModel? integer
function mapeffect(Id, MapId, X, Y, effId, time, mode, actor, effectModel) end

---设置地图杀怪经验倍数
---*  actor: 玩家对象
---*  MapId: 地图id( * 号表示所有地图)
---*  much: 倍率 为杀怪经验倍数 倍数除以100为真正的倍率(200 为 2 倍经验 150 为1.5倍,0表示关闭地图的杀怪经验倍数)
---@param actor string
---@param MapId string|integer
---@param much integer
function mapkillmonexprate(actor, MapId, much) end

---飞地图(指定坐标)
---*  actor: 玩家对象
---*  mapname: 地图名
---*  nX: X坐标
---*  nY: Y坐标
---*  nRange: 	范围
---@param actor string
---@param mapname integer|string
---@param nX integer
---@param nY integer
---@param nRange? integer
function mapmove(actor, mapname, nX, nY, nRange) end

---MD5加密
---*  str: 需要加密的文本
---@param str string
function md5str(str) end

---弹出窗口消息
---*  actor: 玩家对象
---*  info: 弹出内容
---*  flag1: 确定后跳转的接口
---*  flag2: 取消后跳转的接口
---@param actor string
---@param info string
---@param flag1? string
---@param flag2? string
function messagebox(actor, info, flag1, flag2) end

---客户端复制
---*  actor: 玩家对象
---*  str: 文本内容
---@param actor string
---@param str string
function mircopy(actor, str) end

---获取/设置 镜像地图剩余时间
---*  actor: 玩家对象
---@param actor string
function mirrormaptime(actor) end

---播放光环效果
---*  actor: 玩家对象
---*  mapid: 地图id
---*  x: 坐标x
---*  y: 坐标y
---*  type: 光环类型
---*  time: 时间(秒)
---*  behind: 播放模式-0-前面-1-后面
---*  selfshow: 仅自己可见0-否 视野内均可见 1-是
---@param actor string
---@param mapid string|integer|string
---@param x integer
---@param y integer
---@param type integer
---@param time integer
---@param behind? integer
---@param selfshow? integer
function mobfireburn(actor, mapid, x, y, type, time, behind, selfshow) end

---杀怪物品再爆
---*  actor: 玩家对象
---*  count: 怪物物品掉落增加次数
---@param actor string
---@param count integer
function monitems(actor, count) end

---把某个地图中的玩家全部移动到另外一个地图
---*  actor: 玩家对象
---*  aMapId: 移动前地图Id
---*  bMapId: 移动后地图Id
---*  x: x坐标
---*  y: y坐标
---*  range: 范围
---@param actor string
---@param aMapId string
---@param bMapId string
---@param x integer
---@param y integer
---@param range? integer
function movemapplay(actor, aMapId, bMapId, x, y, range) end

---国家宣战
---*  actor: 玩家对象
---*  nIdx: 国家ID
---*  actor: 时间,单位小时
---@param actor string
---@param nIdx integer
---@param iValue integer
function nationswar(actor, nIdx, iValue) end

---新手界面引导功能
---*  actor: 玩家对象
---*  NPCIdx: 界面ID
---*  BtnIdx: 按钮索引
---*  sMsg: 显示的内容
---@param actor string
---@param NPCIdx integer
---@param BtnIdx integer|string
---@param sMsg? string
function navigation(actor, NPCIdx, BtnIdx, sMsg) end

---刷新进行中任务状态
---*  actor: 玩家对象
---*  nId: 界面ID
---*  ...:参数1~参数10
---@param actor string
---@param nId integer
---@param ... any
function newchangetask(actor, nId, ...) end

---完成任务
---*  actor: 玩家对象
---*  nId: 任务
---@param actor string
---@param nId integer
function newcompletetask(actor, nId) end

---删除任务
---*  actor: 玩家对象
---*  nId: 任务
---@param actor string
---@param nId integer
function newdeletetask(actor, nId) end

---读取表里面的第几行第几列内容(0行0列开始)
---*  filename: 玩家对象
---*  row: 行数
---*  col: 列数
---@param filename string
---@param row string|integer
---@param col string|integer
---@return string 表内数据
function newdqcsv(filename, row, col) end

---新建任务
---*  actor: 玩家对象
---*  nId: 	任务ID
---*  ...: 参数1~参数10 用来替换任务内容里的%s
---@param actor string
---@param nId integer
---@param ... string|integer
function newpicktask(actor, nId, ...) end

---加载csv表格内容
---*  filename: 文件名
---@param filename string
function newreadcsv(filename) end

---是否满足指定条件购买 CanBuyShopItem触发中使用
---*  actor: 玩家对象
---*  canbuy: 1-不允许购买 0-允许购买
---@param actor string
---@param canbuy integer
function notallowbuy(actor, canbuy) end

---是否满足指定条件显示 CanShowShopItem触发中使用
---*  actor: 玩家对象
---*  canbuy: 1-不显示 0-显示
---@param actor string
---@param canshow integer
function notallowshow(actor, canshow) end

---关闭指定装备对比提示
---*  actor: 玩家对象
---*  order: 1=物品唯一ID 2=物品IDX 3=物品名称
---*  str: 	对应参数2的属性值
---@param actor string
---@param order integer
---@param str string
function nothintitem(actor, order, str) end

---离线挂机
---*  actor: 玩家对象
---*  time: 离线时间(分)
---@param actor string
---@param time integer
function offlineplay(actor, time) end

---调用游戏面板
---*  actor: 玩家对象
---*  nId: 	面板ID
---*  nState: 0=打开 1=打开面板重复点按钮不会关闭,除非主动点关闭按钮(一般做任务配合新手引导用到) 2=关闭当前面板ID
---*  rankID: 排行榜面板ID //game_data表配置的ID 此参数只在排行榜中有效
---*  isHero: 玩家/英雄页面 //打开的排行榜显示在玩家或英雄的页面(0或空=玩家，1=英雄) 此参数只在英雄合击版 排行榜中有效
---@param actor string
---@param nId integer
---@param nState? integer
---@param rankID? integer
---@param isHero? integer
function openhyperlink(actor, nId, nState, rankID, isHero) end

---打开NPC大窗口
---*  path: 路径
---*  pos: 显示位置
---*  x: X坐标
---*  y: Y坐标
---*  height: 高度
---*  width: 宽度
---*  isShowBtn: 是否显示关闭按钮
---*  closeX: 关闭按钮X坐标
---*  closeY: 关闭按钮Y坐标
---*  isMove: 是否可以移动(0不移动 1移动)
---@param path string
---@param pos integer
---@param x integer
---@param y integer
---@param height integer
---@param width integer
---@param isShowBtn integer
---@param closeX integer
---@param closeY integer
---@param isMove integer
function openmerchantbigdlg(path, pos, x, y, height, width, isShowBtn, closeX, closeY, isMove) end

---打开指定NPC面板
---*  actor: 玩家对象
---*  NPCIndex: NPC索引 NPC配置表中的ID
---*  nRange: 范围值 在此范围内允许打开
---@param actor string
---@param NPCIndex integer
---@param nRange integer
function opennpcshow(actor, NPCIndex, nRange) end

---移动到指定NPC附近
---*  actor: 玩家对象
---*  NPCIndex: NPC索引 NPC配置表中的ID
---*  nRange: 范围值 不在此范围内则移动到NPC附近
---*  actor: 范围值2 移动到NPC附近的范围内
---@param actor string
---@param NPCIndex integer
---@param nRange integer
---@param nRange2 integer
function opennpcshowex(actor, NPCIndex, nRange, nRange2) end

---打开仓库面板
---*  actor: 玩家对象
---@param actor string
---@param isOpenUI? 0=打开UI;1=只下发数据
function openstorage(actor, isOpenUI) end

---打开OK框
---*  actor: 玩家对象
---*  title: OK框标题
---@param actor string
---@param title string
function openupgradedlg(actor, title) end

---游戏中打开网站
---*  actor: 玩家对象
---*  url: 网站
---@param actor string
---@param url string
function openwebsite(actor, url) end

---查看自己面板
---*  actor: 玩家对象
---*  winID: 101=装备 102=状态 103=属性 104=技能 105=生肖 106=称号 1011=时装
---@param actor string
---@param winID integer
function openwindows(actor, winID) end

---解析文本
---*  text: 	文本内容
---*  actor: 玩家对象
---@param text string
---@param actor string
---@return string
function parsetext(text, actor) end

---置换宠物属性 *只置换基础属性:形象、怪物表配置 原宠物其它属性全部保留 包括序号
---*  actor: 玩家对象
---*  idx: 	宠物序号
---*  monidx: 	怪物IDX
---@param actor string
---@param idx integer
---@param monidx integer
function petmon(actor, idx, monidx) end

---获取宠物状态
---*  actor: 玩家对象
---*  idx: 宠物序号
---@param actor string
---@param idx integer
function petstate(actor, idx) end

---宠物脱装备 此接口不扣减物品 仅扣减宠物身上对应装备属性。
---*  actor: 玩家对象
---*  idx: 宠物序号
---*  item: 装备名称 多个装备用#分隔 -1表示脱下全部装备
---@param actor string
---@param idx integer
---@param item string|integer
function pettakeoff(actor, idx, item) end

---宠物穿装备 此接口不会增加物品 仅将物品的属性添加到宠物身上 并保存到数据库。
---*  actor: 玩家对象
---*  idx: 宠物序号
---*  item: 装备名称 多个装备用#分隔
---@param actor string
---@param idx integer
---@param item string
function pettakeon(actor, idx, item) end

---拾取模式
---*  actor: 玩家对象
---*  mode: 模式 0=以人物为中心捡取 1=以小精灵为中心捡取
---*  Range: 范围
---*  interval: 间隔 最小500ms
---@param actor string
---@param mode integer
---@param Range integer
---@param interval integer
function pickupitems(actor, mode, Range, interval) end

---在人物身上播放特效
---*  actor: 玩家对象
---*  actor: 特效ID
---*  actor: 相对于人物偏移的X坐标
---*  actor: 相对于人物偏移的Y坐标
---*  actor: 播放次数 填0则一直播放
---*  actor: 播放模式0-前面1-后面
---*  actor: 仅自己可见 0-否(视野内均可见) 1-是
---@param actor string
---@param effectid integer
---@param offsetX integer
---@param offsetY integer
---@param times integer
---@param behind integer
---@param selfshow integer
function playeffect(actor, effectid, offsetX, offsetY, times, behind, selfshow) end

---播放音乐声音
---*  actor: 玩家对象
---*  index: 播放文件的索引 对应声音配置表id(cfg_sound.xls)
---*  times: 循环播放次数
---*  flag: 播放模式:0.播放给自己 1.播放给全服 2.播放给同一地图 4.播放给同屏人物
---@param actor string
---@param index string
---@param times string
---@param flag string
function playsound(actor, index, times, flag) end

---设置人物攻击威力
---*  actor: 玩家对象
---*  rate: 攻击威力比率 100=100%
---*  time: 有效时间 超过时间恢复正常
---@param actor string
---@param rate integer
---@param time integer
function powerrate(actor, rate, time) end

---拉取客户端充值接口
---*  actor: 玩家对象
---*  money: 金额
---*  type: 充值方式 1-支付宝 2-花呗 3-微信
---*  flagid: 玩家对象
---@param actor string
---@param money integer
---@param type integer
---@param flagid integer
function pullpay(actor, money, type, flagid) end

---查询人物名称是否存在
---*  actor: 玩家对象
---*  name: 要查询的名字
---@param actor string
---@param name string
function queryhumnameexist(actor, name) end

---查询人物货币
---*  actor: 玩家对象
---*  id: 货币ID 1-100
---@param actor string
---@param id integer
function querymoney(actor, id) end

---随机杀死地图中的怪物
---*  mapid: 玩家对象
---*  name: 怪物名字
---*  num: 数量(1-255)
---*  drop: 是否掉落 0=掉落 1=不掉落
---@param mapid string|integer
---@param name string
---@param num integer
---@param drop integer
function randomkillmon(mapid, name, num, drop) end

---增加附加伤害效果
---*  actor: 玩家对象
---*  targetX: X坐标
---*  targetY: Y坐标
---*  range: 影响范围
---*  power: 攻击力
---*  addtype: 附加类型,见说明书
---*  addvalue: 附加属性值,见说明书
---*  checkstate: 是否检查防冻结/麻痹/石化/冰冻/蛛网/红毒/绿毒属性0=直接设置状态;1=检查后设置状态)
---*  targettype: 目标类型(0或空=所有目标;1=仅人物;2=仅怪物)
---*  effectid: 目标身上播放的特效ID
---*  harmNum: 群体伤害目标个数(引擎64_23.0628新增)
---@param actor string
---@param targetX integer
---@param targetY integer
---@param range integer
---@param power integer
---@param addtype integer
---@param addvalue? integer
---@param checkstate? integer
---@param targettype? integer
---@param effectid? integer
---@param harmNum? integer
function rangeharm(actor, targetX, targetY, range, power, addtype, addvalue, checkstate, targettype, effectid, harmNum) end

---读取Ini文件中的字段值
---*  actor: 玩家对象
---*  section: 配置项区
---*  item: 配置项
---@param actor string
---@param section string
---@param item string
function readini(actor, section, item) end

---读取Ini文件中的字段值 带Cache
---*  actor: 玩家对象
---*  section: 配置项区
---*  item: 配置项
---@param actor string
---@param section string
---@param item string
function readinibycache(actor, section, item) end

---复活
---*  actor: 玩家对象
---@param actor string
function realive(actor) end

---返回复活的宠物对象
---*  actor: 玩家对象
---*  idx: 宠物序号
---*  nHp: 复活后的HP量
---*  type: 0-绝对值 1-百分比
---@param actor string
---@param idx integer
---@param nHp integer
---@param type integer
function realivepet(actor, idx, nHp, type) end

---刷新人物属性
---*  actor: 玩家对象
---@param actor string
function recalcabilitys(actor) end

---召唤英雄
---*  actor: 玩家对象
---@param actor string
function recallhero(actor) end

---召唤宝宝
---*  actor: 玩家对象
---*  monName: 怪物名称
---*  level: 宝宝等级(最高为7)
---*  time: 叛变时间(分钟)
---*  param1: 预留(填0)
---*  param2: 预留(填0)
---*  param3: 设置大于0 检测时不计算该宝宝数量(仅M2控制的召唤数量)
---@param actor string
---@param monName string
---@param level integer
---@param time integer
---@param param1? integer
---@param param2? integer
---@param param3? integer
---@return string 宝宝对象
function recallmob(actor, monName, level, time, param1, param2, param3) end

---召唤宠物
---*  actor: 玩家对象
---*  idx: 玩家对象
---@param actor string
---@param idx integer
function recallpet(actor, idx) end

---返回OK框物品到背包
---*  actor: 玩家对象
---@param actor string
function reclaimitem(actor) end

---整理背包里的物品
---*  actor: 玩家对象
---@param actor string
function refreshbag(actor) end

---刷新物品信息到前端
---*  actor: 玩家对象
---*  item: 物品对象
---@param actor string
---@param item string
function refreshitem(actor, item) end

---给NPC注册Lua消息
---*  msgId: 消息ID
---*  NPCIndex: NPC索引 NPC配置表中的ID
---@param msgId integer
---@param NPCIndex integer
function regnpcmsg(msgId, NPCIndex) end

---用脚本命令释放技能
---*  actor: 玩家对象
---*  skillid: 	技能ID
---*  type: 类型 1-普通技能2-强化技能
---*  level: 技能等级
---*  target: 技能对象: 1-攻击目标 2-自身
---*  flag: 是否显示施法动作 0-不显示 1-显示
---@param actor string
---@param skillid integer
---@param type integer
---@param level integer
---@param target integer
---@param flag integer
function releasemagic(actor, skillid, type, level, target, flag) end

---回收
---*  actor: 玩家对象
---@param actor string
function releasesprite(actor) end

---打印消息到控制台 引擎开发模式 会输出到控制台上 线上模式 会记录到ScriptXX文件里 可以用于排查错误
---@param ... any
function release_print(...) end

---人物转生控制
---*  actor: 玩家对象
---*  rlevel: 转生次数一次转多少级(数值范围为1-255)
---*  level: 转生后等级代表转生后人物的等级 0为不改变人物当前等级
---*  num: 分配点数转生后可以得到的点数 此点数可能按比例换成人物属性点(数值范围 1 - 20000)
---@param actor string
---@param rlevel integer
---@param level integer
---@param num integer
function renewlevel(actor, rlevel, level, num) end

---修复所有装备
---*  actor: 玩家对象
---@param actor string
function repairall(actor) end

---引用文件
---*  path: 路径名称
---@param path string
function require(path) end

---收回宠物
---*  actor: 玩家对象
---*  idx: 宠物序号
---@param actor string
---@param idx integer
function retractpettoitem(actor, idx) end

---上马
---*  actor: 玩家对象
---*  HorseAppr: 玩家对象
---*  HorseEff: 玩家对象
---*  HorseFature: 玩家对象
---*  Type: 玩家对象
---@param actor string
---@param HorseAppr integer
---@param HorseEff integer
---@param HorseFature integer
---@param Type integer
function ridehorse(actor, HorseAppr, HorseEff, HorseFature, Type) end

---NPC界面文本发送
---*  actor: 玩家对象
---*  msg: 界面文本内容
---@param actor string
---@param msg string
function say(actor, msg) end

---屏幕震动
---*  actor: 玩家对象
---*  type: 模式(0~4)0.仅自己;1.在线所有人;2屏幕范围内人物;3.当前地图上所有人;4.指定地图上所有人;
---*  level: 震级(1~3)
---*  num: 	次数
---*  mapid: 地图ID(模式等于4时 需要该参数)
---@param actor string
---@param type integer
---@param level integer
---@param num? integer
---@param mapid? integer
function scenevibration(actor, type, level, num, mapid) end

---播放屏幕特效
---*  actor: 玩家对象
---*  id: 模式(0~4)0.仅自己;1.在线所有人;2屏幕范围内人物;3.当前地图上所有人;4.指定地图上所有人;
---*  effectid: 震级(1~3)
---*  X: 次数
---*  Y: 地图ID(模式等于4时 需要该参数)
---*  speed: 次数
---*  times: 地图ID(模式等于4时 需要该参数)
---*  type: 地图ID(模式等于4时 需要该参数)
---@param actor string
---@param id integer
---@param effectid integer
---@param X integer
---@param Y integer
---@param speed integer
---@param times integer
---@param type integer
function screffects(actor, id, effectid, X, Y, speed, times, type) end

---遍历背包勾选物品
---*  actor: 玩家对象
---*  makeindex: 选中的物品唯一ID多个物品用","分隔
---@param actor string
---@param makeindex string
function selectbagitems(actor, makeindex) end

---人物飘血飘字特效
---*  target: 飘血飘字的主体 一般为受攻击者
---*  type: 显示类型 1- 伤害 2- 暴击伤害 3- 弯腰效果 4- 加HP 5- 格挡 8- 扣减HP和MP 9- 伤害 10-扣减MP 11- 致命一击
---*  damage: 显示的点数
---*  hitter: 可看到飘血飘字的主体 一般为攻击者
---@param target string
---@param type integer
---@param damage integer
---@param hitter? string
function sendattackeff(target, type, damage, hitter) end

---发送屏幕中间大字体信息
---*  actor: 玩家对象
---*  FColor: 前景色
---*  BColor: 	背景色
---*  Msg: 发送对象
---*  flag: 玩家对象
---*  time: 显示时间
---*  func: 倒计时结束后触发回调
---@param actor string
---@param FColor integer
---@param BColor integer
---@param Msg string
---@param flag integer
---@param time integer
---@param func? string
function sendcentermsg(actor, FColor, BColor, Msg, flag, time, func) end

---屏幕任意坐标发送公告信息
---*  actor: 玩家对象
---*  type: 消息类型0-全服 1-自己 2-组队 3-行会 4-当前地图
---*  msg: 消息内容
---*  FColor: 前景色
---*  BColor: 背景色
---*  X: X坐标
---*  Y: Y坐标
---@param actor string
---@param type integer
---@param msg string
---@param FColor? integer
---@param BColor? integer
---@param X? integer
---@param Y? integer
function sendcustommsg(actor, type, msg, FColor, BColor, X, Y) end

---显示倒计时信息提示
---*  actor: 玩家对象
---*  msg: 消息内容
---*  time: 时间 秒
---*  FColor: 字体景色
---*  mapdelete: 换地图是否删除 0-不删除 1-删除
---*  func: 跳转的函数
---*  Y: Y坐标
---@param actor string
---@param msg string
---@param time integer
---@param FColor integer
---@param mapdelete integer
---@param func string
---@param Y? integer
function senddelaymsg(actor, msg, time, FColor, mapdelete, func, Y) end

---发送消息
---*  actor:    玩家对象
---*  msgid:    消息ID
---*  param1: 	参数1
---*  param2: 	参数2
---*  param3: 	参数3
---*  sMsg: 	消息体
---@param actor string
---@param msgid integer
---@param param1? integer
---@param param2? integer
---@param param3? integer
---@param sMsg? string
function sendluamsg(actor, msgid, param1, param2, param3, sMsg) end

---发送邮件
---*  userid: 家UserId 如果是玩家名 需要在前面加#(如:#张三)
---*  id: 自定义邮件ID
---*  title: 邮件标题
---*  memo: 邮件内容
---*  rewards: 附件内容: 物品1#数量#绑定标记&物品2#数量#绑定标记 &分组 #分隔
---@param userid string
---@param id integer
---@param title string
---@param memo string
---@param rewards string
function sendmail(userid, id, title, memo, rewards) end

---发送屏幕滚动信息
---*  actor: 玩家对象
---*  type: 模式 发送对象 0-自己 1-所有人 2-行会 3-当前地图 4-组队
---*  FColor: 字体景色
---*  BColor: 背景色
---*  Y: Y坐标
---*  scroll: 滚动次数
---*  msg: 	消息内容
---@param actor string
---@param type integer
---@param FColor integer
---@param BColor integer
---@param Y integer
---@param scroll integer
---@param msg string
function sendmovemsg(actor, type, FColor, BColor, Y, scroll, msg) end

---发送聊天框消息
---*  actor: 玩家对象
---*  type: 玩家对象
---*  msg: 玩家对象
---@param actor string|nil
---@param type integer
---@param msg string
function sendmsg(actor, type, msg) end

---主屏幕弹出公告
---*  actor: 玩家对象
---*  FColor: 前景色
---*  BColor: 背景色
---*  msg: 公告内容
---*  type: 模式 发送对象 0-自己 1-所有人 2-行会 3-当前地图 4-组队
---*  time: 显示时间
---@param actor string
---@param FColor integer
---@param BColor integer
---@param msg string
---@param type integer
---@param time integer
function sendmsgnew(actor, FColor, BColor, msg, type, time) end

---发送视野内广播消息
---*  actor:    玩家对象
---*  msgid:    消息ID
---*  param1: 	参数1
---*  param2: 	参数2
---*  param3: 	参数3
---*  sMsg: 	消息体
---@param actor string
---@param msgid integer
---@param param1? integer
---@param param2? integer
---@param param3? integer
---@param sMsg? string
function sendrefluamsg(actor, msgid, param1, param2, param3, sMsg) end

---发送聊天框固顶信息
---*  actor: 玩家对象
---*  type: 模式 发送对象 0-自己 1-所有人 2-行会 3-当前地图 4-组队
---*  FColor: 前景色
---*  BColor: 背景色
---*  time: 显示时间
---*  msg: 公告内容
---*  showflag: 是否显示人物名称 0-是 1-否
---@param actor string
---@param type integer
---@param FColor integer
---@param BColor integer
---@param time integer
---@param msg string
---@param showflag integer
function sendtopchatboardmsg(actor, type, FColor, BColor, time, msg, showflag) end

---设定人物攻击飘血飘字类型
---*  actor: 玩家对象
---*  actor: 显示类型 见说明书
---@param actor string
---@param type integer
function setattackefftype(actor, type) end

---强制修改攻击模式
---*  actor: 玩家对象
---*  mode: 攻击模式
---*  time: 强制切换时间时间
---@param actor string
---@param mode integer
---@param time integer
function setattackmode(actor, mode, time) end

---在线泡点经验
---*  actor: 玩家对象
---*  evetime: 时间
---*  experience: 	经验
---*  isSafe: 是否安全区(填0为任何地方)
---*  mapid: 地图号(任何地图使用*号)
---*  opt: 聚灵珠是否能获取经验(0=不可以 1= 可以)
---*  alltime: 时间:秒(泡点获得经验的时间)
---*  level: 等级(多少级以下获得经验)
---@param actor string
---@param evetime integer
---@param experience integer
---@param isSafe integer
---@param mapid string|integer
---@param opt integer
---@param alltime integer
---@param level integer
function setautogetexp(actor, evetime, experience, isSafe, mapid, opt, alltime, level) end

---设置人物背包格子数
---*  actor: 玩家对象
---*  count: 格子大小 *不小于46 不大于126
---@param actor string
---@param count integer
function setbagcount(actor, count) end

---设置人物/怪物相关信息
---*  actor: 玩家对象
---*  nID: 类型(详见说明)
---*  value: 属性值
---@param actor string
---@param nID integer
---@param value integer
function setbaseinfo(actor, nID, value) end

---人物变色
---*  actor: 玩家对象
---*  color: 颜色(0~255); 255时清除颜色; -1则为转生设置的颜色在人物身体上进行变色
---*  time: 改变时长(秒)
---@param actor string
---@param color integer
---@param time integer
function setbodycolor(actor, color, time) end

---设置聊天前缀
---*  actor: 玩家对象
---*  Prefix: 前缀信息 空则清除聊天前缀
---*  color: 背景色
---@param actor string
---@param Prefix? string
---@param color integer
function setchatprefix(actor, Prefix, color) end

---设置标记值
---*  actor: 人物、怪物对象
---*  index: 下标ID 0-9
---*  value: 标记值
---@param actor string
---@param index integer
---@param value integer
function setcurrent(actor, index, value) end

---设置自定义进度条参数
---*  actor: 玩家对象
---*  item: 装备对象
---*  index: 装备精度条索引 0~2
---*  json: 进度条内容 json字符串
---@param actor string
---@param item string
---@param index integer
---@param json string
function setcustomitemprogressbar(actor, item, index, json) end

---修改物品持久度
---*  actor: 玩家对象
---*  itemmakeid: 玩家对象
---*  char: 玩家对象
---*  dura: 玩家对象
---@param actor string
---@param itemmakeid integer
---@param char string
---@param dura integer
function setdura(actor, itemmakeid, char, dura) end

---关闭地图计时器
---*  MapId: 地图ID
---*  Idx: 计时器ID
---@param MapId string|integer|string
---@param Idx integer
function setenvirofftimer(MapId, Idx) end

---设定地图计时器
---*  MapId: 地图ID
---*  Idx: 计时器ID
---*  second: 时长(秒)
---*  func: 触发跳转的函数
---@param MapId string|integer|string
---@param Idx integer
---@param second integer
---@param func string
function setenvirontimer(MapId, Idx, second, func) end

---设置人物标记/标识值
---*  actor: 玩家对象
---*  nIndex: 索引 0-800
---*  nvalue: 对应属性值
---@param actor string
---@param nIndex integer
---@param nvalue integer
function setflagstatus(actor, nIndex, nvalue) end

---设置玩家GM权限值
---*  actor: 玩家对象
---*  gmlevel: GM权限值
---@param actor string
---@param gmlevel integer
function setgmlevel(actor, gmlevel) end

---设置行会信息
---*  actor: 玩家对象
---*  index: 索引   0-行会公告
---*  value: 属性值
---@param actor string
---@param index integer
---@param value string
function setguildinfo(actor, index, value) end

---给行会自定义变量赋值
---*  guild: 玩家对象
---*  varName: 变量名
---*  value: 变量值
---*  isSave: 是否保存到数据库(0/1)
---@param guild string
---@param varName string
---@param value integer|string
---@param isSave? integer
function setguildvar(guild, varName, value, isSave) end

---顶戴花翎
---*  actor: 玩家对象
---*  where: 位置 0-9
---*  effType: 播放效果(0图片名称 1特效ID)
---*  resName: 图片名或者特效ID
---*  x: Y坐标 (为空时默认Y=0)
---*  y: Y坐标 (为空时默认Y=0)
---*  autoDrop: 自动补全空白位置0,1(0=掉 1=不掉)
---*  selfSee: 是否只有自己看见0=所有人都可见;1=仅仅自己可见;
---*  posM: 播放位置(不填默认为0)0=在角色之上;1=在角色之下;
---@param actor string
---@param where integer
---@param effType integer
---@param resName? integer|string
---@param x? integer
---@param y? integer
---@param autoDrop? integer
---@param selfSee? integer
---@param posM? integer
function seticon(actor, where, effType, resName, x, y, autoDrop, selfSee, posM) end

---设置物品记录信息
---*  actor: 玩家对象
---*  item: 物品对象
---*  type: [1,2]
---*  position: 当type=1,取值范围[0..49]type=2,取值范围[0..19]
---*  value: 设置物品对应位置值
---@param actor string
---@param item string
---@param type integer
---@param position integer
---@param value integer
function setitemaddvalue(actor, item, type, position, value) end

---设置自定义属性
---*  actor: 玩家对象
---*  item: 物品对象
---*  value: Json字符串 自定义属性内容
---@param actor string
---@param item string
---@param value string
function setitemcustomabil(actor, item, value) end

---设置物品特效
---*  actor: 玩家对象
---*  index: 装备位置 -1~OK框中的物品
---*  bageffectid: 背包特效编号
---*  ineffectid: 内观特效编号
---@param actor string
---@param index integer
---@param bageffectid integer
---@param ineffectid integer
---@param order1? integer
---@param order2? integer
---@param item? string
function setitemeffect(actor, index, bageffectid, ineffectid, order1, order2, item) end

---修改装备内观Looks值
---*  actor: 玩家对象
---*  pos: 装备位置 (-1时是OK框中的装备0~16 17~46 55)
---*  char: 操作符(+ - =)
---*  pictrue: 内观图片
---*  itemobj: 物品对象
---@param actor string
---@param pos integer
---@param char string
---@param pictrue integer
---@param itemobj? string
function setitemlooks(actor, pos, char, pictrue, itemobj) end

---设置物品绑定状态
---*  item: 物品对象
---*  bind: 绑定类型(0-8)
---*  state: 绑定状态(0为正常,1为绑定)
---@param item string
---@param bind integer
---@param state integer
function setitemstate(item, bind, state) end

---增加技能防御力
---*  actor: 玩家对象
---*  skillname: 技能名称
---*  value: 抵消威力值
---*  type: 计算方式(0按点数计算,1按百分比计算)
---@param actor string
---@param skillname string
---@param value integer
---@param type integer
function setmagicdefpower(actor, skillname, value, type) end

---增加技能威力
---*  actor: 玩家对象
---*  skillname: 技能名称
---*  actor: 威力值
---*  type: 计算方式(0按点数计算,1按百分比计算)
---@param actor string
---@param skillname string
---@param value integer
---@param type integer
function setmagicpower(actor, skillname, value, type) end

---把怪物设置成宝宝
---*  mon: 怪物对象
---*  actor: 玩家对象
---@param mon string
---@param actor string
function setmonmaster(mon, actor) end

---设置当前人物在国家的职位格式
---*  actor: 玩家对象
---*  jobIdx: 职位编号
---@param actor string
---@param jobIdx integer
function setnationking(actor, jobIdx) end

---修改国家职位名称
---*  actor: 玩家对象
---*  nIdx: 国家ID (1~100)
---*  jobIdx: 职位编号
---*  jobName: 职位名称
---@param actor string
---@param nIdx integer
---@param jobIdx integer
---@param jobName string
function setnationrank(actor, nIdx, jobIdx, jobName) end

---设置装备的元素属性
---*  actor: 玩家对象
---*  where: 装备位置(-2操作物品对象)
---*  iAttr: 属性
---*  sFlag: 比较符(=+-)
---*  iValue: 数值(1-100)，百分比
---@param actor string
---@param where integer
---@param iAttr integer
---@param sFlag string
---@param iValue integer
function setnewitemvalue(actor, where, iAttr, sFlag, iValue) end

---设置NPC特效
---*  actor: 玩家对象
---*  NPCIndex: NPC索引 NPC配置表中的ID
---*  Effect: 特效ID 5055-感叹号 5056-问号
---*  X: X坐标
---*  Y: Y坐标
---@param actor string
---@param NPCIndex integer
---@param Effect integer
---@param X integer
---@param Y integer
function setnpceffect(actor, NPCIndex, Effect, X, Y) end

---移除全局定时器
---*  id: 定时器ID
---@param id integer
function setofftimerex(id) end

---移除个人定时器
---*  actor: 玩家对象
---*  id: 定时器ID
---@param actor string
---@param id integer
function setofftimer(actor, id, RunTick, RunTime, kf) end

---添加个人定时器
---*  actor: 玩家对象
---*  id: 定时器ID
---*  RunTick: 执行间隔 秒
---*  RunTime: 执行次数 >0执行完成后 自动移除
---*  kf: 跨服是否继续执行 1:继续
---@param actor string
---@param id integer
---@param RunTick integer
---@param RunTime? integer
---@param kf? integer
function setontimer(actor, id, RunTick, RunTime, kf) end

------添加全局定时器
---*  id: 定时器ID
---*  tick: 执行间隔 秒
---@param id integer
---@param tick integer
function setontimerex(id, tick) end

---获取宠物蛋等级
---*  actor: 玩家对象
---*  itemmakeid: 物品MakeIndex
---*  level: 等级: -1表示不修改值
---*  zlevel: 转生等级: -1表示不修改值
---*  exp: 经验值: -1表示不修改值
---@param actor string
---@param itemmakeid integer
---@param level integer
---@param zlevel integer
---@param exp integer
function setpetegglevel(actor, itemmakeid, level, zlevel, exp) end

---设置宠物模式
---*  actor: 玩家对象
---*  mode: 宠物模式:1-跟随;2-攻击;3-被动(被攻击时才设定目标);4-休息
---@param actor string
---@param mode integer
function setpetmode(actor, mode) end

---设置玩家变量
---*  actor: 玩家对象
---*  varName: 变量名
---*  varValue: 变量值
---@param actor string
---@param varName string
---@param varValue string|integer
function setplaydef(actor, varName, varValue) end

---设置行会成员在行会中的职位;
---*  actor: 玩家对象
---*  pos: 在行会中的职位 0:会长;1:副会长;2:行会成员1;3:行会成员2;4:行会成员3;
---@param actor string
---@param pos integer
function setplayguildlevel(actor, pos) end

---给玩家自定义变量赋值
---*  actor: 玩家对象
---*  varType: 变量范围(HUMAN/GUILD)
---*  varName: 变量名
---*  varValue: 变量值
---*  isSave: 是否保存到数据库(0/1)
---@param actor string
---@param varType string
---@param varName string
---@param varValue string|integer
---@param isSave? integer
function setplayvar(actor, varType, varName, varValue, isSave) end

---显示人物的称号
---*  actor: 玩家对象
---*  levelname: 称号文本: 和名字一起显示
---@param actor string
---@param levelname string
function setranklevelname(actor, levelname) end

---减少技能CD冷却时间
---*  actor: 玩家对象
---*  skillname: 技能名称
---*  char: 操作符(+/-/=)=0就是还原技能CD
---*  time: 时间 秒
---@param actor string
---@param skillname string
---@param char string
---@param time integer
function setskilldeccd(actor, skillname, char, time) end

---设置技能等级
---*  actor: 玩家对象
---*  skillid: 技能ID
---*  flag: 类型: 1-技能等级 2-强化等级 3-熟练度
---*  point: 属性值
---@param actor string
---@param skillid integer
---@param flag integer
---@param point integer
function setskillinfo(actor, skillid, flag, point) end

---开/关首饰盒
---*  actor: 玩家对象
---*  bState: 0:关闭: 1:开启
---@param actor string
---@param bState integer
function setsndaitembox(actor, bState) end

---设置人物伤害吸收
---*  actor: 玩家对象
---*  operate: 操作符号 "+"增加 "-"减少 "="等于
---*  sum: 总吸收量
---*  rate: 吸收比率千分比 1=0.1%100=10%
---*  success: 吸收成功率
---@param actor string
---@param operate string
---@param sum integer
---@param rate integer
---@param success integer
function setsuckdamage(actor, operate, sum, rate, success) end

---设置全局变量
---*  varName: 变量名
---*  varValue: 变量值
---@param varName string
---@param varValue string|integer
function setsysvar(varName, varValue) end

---给全局自定义变量赋值
---*  varName: 变量名
---*  varValue: 变量值
---*  isSave: 是否保存(0/1)
---@param varName string
---@param varValue string|integer
---@param isSave? integer
function setsysvarex(varName, varValue, isSave) end

---设置当前攻击目标
---*  Hiter: 攻击者(玩家/英雄/怪物)
---*  Target: 被攻击者(玩家/英雄/怪物)
---@param Hiter string
---@param Target string
function settargetcert(Hiter, Target) end

---设置物品来源
---*  jsonStr: 玩家对象
---@param jsonStr string
function setthrowitemly(jsonStr) end

---设置物品来源(使用物品对象)
---*  actor: 玩家对象
---*  item: 物品对象
---*  jsonStr: json字符串
---@param actor string
---@param item string
---@param jsonStr string
function setthrowitemly2(actor, item, jsonStr) end

---设置人物永久属性
---*  actor: 玩家对象
---*  nIndex: 索引 见说明书
---*  nvalue: 对应属性值
---@param actor string
---@param nIndex integer
---@param nvalue integer
function setusebonuspoint(actor, nIndex, nvalue) end

---采集挖矿等进度条操作
---*  actor: 玩家对象
---*  time: 进度条时间 秒
---*  succ: 成功后跳转的函数
---*  msg: 提示消息
---*  canstop: 能否中断 0-不可中断 1-可以中断
---*  fail: 中断触发的函数
---@param actor string
---@param time integer
---@param succ string
---@param msg string
---@param canstop integer
---@param fail string
function showprogressbardlg(actor, time, succ, msg, canstop, fail) end

---装备镶嵌钻石
---*  actor: 玩家对象
---*  item: 装备对象
---*  hole: 装备开孔序号 0~9
---*  index: 镶嵌钻石的index 装备表总的Index
---@param actor string
---@param item string
---@param hole integer
---@param index integer
function socketableitem(actor, item, hole, index) end

---自定义变量排序
---*  varName: 玩家对象
---*  playflag: 0-所有玩家 1-在线玩家 2-行会
---*  sortflag: 0-升序 1-降序
---*  count: 获取的数据量 为空或0取所有 取前几名
---@param varName string
---@param playflag integer
---@param sortflag integer
---@param count? integer
---@return table
function sorthumvar(varName, playflag, sortflag, count) end

---开启自动挂机
---*  actor: 玩家对象
---@param actor string
function startautoattack(actor) end

---停止执行
---*  actor: 玩家对象
---@param actor string
function stop(actor) end

---停止自动挂机
---*  actor: 玩家对象
---@param actor string
function stopautoattack(actor) end

---停止拾取
---*  actor: 玩家对象
---@param actor string
function stoppickupitems(actor) end

---跨服变量传递
---*  itype: 变量类型 1=全局G变量 2=全局A变量 3=全局自定义变量 4=行会变量
---*  astr: 跨服全局变量
---*  bstr: 存入本服全局变量
---*  id: 消息id
---@param itype integer
---@param astr string
---@param bstr string
---@param id integer
function synzvar(itype, astr, bstr, id) end

---回收OK框物品
---*  actor: 玩家对象
---*  count: 数量 (针对叠加物品有效)
---@param actor string
---@param count integer
function takedlgitem(actor, count) end

---拿物品
---*  actor: 玩家对象
---*  itemname: 物品名称
---*  qty: 数量
---*  IgnoreJP: 忽略极品0 所有都扣除1 极品不扣除
---*  desc:描述
---@param actor string
---@param itemname string
---@param qty integer
---@param IgnoreJP? integer
---@param desc? string
---@return boolean 是否扣除成功
function takeitem(actor, itemname, qty, IgnoreJP, desc) end

---脱下装备
---*  actor: 玩家对象
---*  where: 位置
---*  makeindex: 物品唯一ID
---@param actor string
---@param where integer
---@param makeindex integer
function takeoffitem(actor, where, makeindex) end

---穿戴装备
---*  actor: 玩家对象
---*  where: 位置
---*  makeindex: 物品唯一ID
---@param actor string
---@param where integer
---@param makeindex integer
function takeonitem(actor, where, makeindex) end

---任务置顶显示
---*  actor: 玩家对象
---*  nId: 任务ID
---@param actor string
---@param nId integer
function tasktopshow(actor, nId) end

---表格转换成字符串
---*  tbl: table表
---@param tbl table
---@return string
function tbl2json(tbl) end

---剔除离线挂机角色
---*  mapID: 地图号 "*"表示全部地图
---*  level: 剔除等级 低于此等级均剔除"*"表示所有
---*  count: 最大剔除玩家数 "*"表示所有
---@param mapID string|integer
---@param level string|integer
---@param count string|integer
function tdummy(mapID, level, count) end

---设置玩家穿人穿怪
---*  actor: 玩家对象
---*  type: 模式 0-恢复默认 1-穿人 2-穿怪 3-穿人穿怪
---*  time: 时间(秒)
---*  objtype: 对象  0-玩家 1-宝宝
---@param actor string
---@param type integer
---@param time integer
---@param objtype integer
function throughhum(actor, type, time, objtype) end

---在地图上放置物品
---*  actor: 玩家对象
---*  MapId: 	地图ID
---*  X: 坐标X
---*  Y: 坐标Y
---*  range: 范围
---*  itemName: 物品名
---*  count: 数量
---*  time: 时间(秒)
---*  hint: true-掉落提示
---*  take: true-立即拾取
---*  onlyself: true-仅自己拾取
---*  xyinorder: true-按位置顺序 false-随机位置
---*  overlap: 单个物品叠加数量，装备无效
---*  isAuto: true-被自动拾取
---@param actor string
---@param MapId string|integer
---@param X integer
---@param Y integer
---@param range integer
---@param itemName string
---@param count integer
---@param time integer
---@param hint boolean
---@param take boolean
---@param onlyself boolean
---@param xyinorder boolean
---@param overlap? integer
---@param isAuto? boolean
function throwitem(actor, MapId, X, Y, range, itemName, count, time, hint, take, onlyself, xyinorder, overlap, isAuto) end

---收回英雄
---*  actor: 玩家对象
---@param actor string
function unrecallhero(actor) end

---返回收回的宠物对象
---*  actor: 玩家对象
---*  idx: 宠物序号
---@param actor string
---@param idx string|integer
function unrecallpet(actor, idx) end

---给人物装备面板加特效
---*  actor: 玩家对象
---*  effectid: 特效ID  0-删除特效
---*  position: 显示位置 0-前面 1-后面
---@param actor string
---@param effectid integer
---@param position integer
function updateequipeffect(actor, effectid, position) end

---查看别人面板信息
---*  actor: 玩家对象
---*  userid: 其他玩家的UserID
---*  winID: 面板ID 101-装备 106-称号 1011-时装
---@param actor string
---@param userid string
---@param winID integer
function viewplayer(actor, userid, winID) end

---写入Ini文件中的字段值
---*  filename: 文件名
---*  section: 配置项区
---*  item: 配置项
---*  value: 配置项值
---@param filename string
---@param section string
---@param item string
---@param value string
function writeini(filename, section, item, value) end

---写入Ini文件中的字段值 带Cache
---*  filename: 文件名
---*  section: 配置项区
---*  item: 配置项
---*  value: 配置项值
---@param filename string
---@param section string
---@param item string
---@param value string
function writeinibycache(filename, section, item, value) end

------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------

---获取动态地图连接
---*  actor: 玩家对象
---*  mapID: 地图ID
---@param actor string
---@param mapID string|integer
---@return table
function getmapgate(actor, mapID) end

---根据名称获取地图基础信息
---*  mapID: 地图ID
---*  nIndex: 0:地图宽 1:地图高
---@param mapID string
---@param nIndex integer
---@return integer
function getmapinfo(mapID, nIndex) end

---获取地图指定范围内的怪物对象列表
---*  mapID: 地图ID
---*  monName: 怪物名 为空 or * 为检测所有怪
---*  nx: 坐标X
---*  ny: 坐标Y
---*  nRange: 范围
---@param mapID string|integer
---@param monName string
---@param nx integer
---@param ny integer
---@param nRange integer
---@return table 怪物对象列表
function getmapmon(mapID, monName, nx, ny, nRange) end

---根据地图id返回地图名
---*  mapID: 地图ID
---@param mapID string|integer
---@return string 地图名
function getmapname(mapID) end

---返回怪物基础信息
---*  monidx: 怪物idx
---*  id: id取值:1-怪物名称;2-怪物名字颜色;3-杀死怪物获得的经验值;
---@param monidx integer
---@param id integer
---@return integer|string
function getmonbaseinfo(monidx, id) end

---根据UserId返回怪物对象
---*  mapID: 地图ID
---*  monUserId: 怪物userid
---@param mapID string|integer
---@param monUserId string
---@return string
function getmonbyuserid(mapID, monUserId) end

---获取指定地图怪物数量
---*  mapID: 地图ID
---*  MonId: 怪物idx
---*  isAllMon: 是否忽略宝宝
---@param mapID string|integer
---@param MonId integer
---@param isAllMon boolean
---@return integer
function getmoncount(mapID, MonId, isAllMon) end

---获取怪物位置及复活时间（仅支持小地图上提示的怪物）
---*  mapID: 地图ID
---@param mapID string|integer
---@return string 	怪物Json数据
function getmonrefresh(mapID) end

---获取玩家所在的行会对象
---*  actor: 玩家对象
---@param actor string
---@return string 行会对象没有行会返回"0"
function getmyguild(actor) end

---获取物品的附加属性
---*  item: 玩家对象
---*  value: 元素属性<br>0:暴击几率<br>1攻击伤害<br>2:物理伤害减少<br>3:魔法伤害减少<br>4:忽视目标防御<br>5:所有伤害反弹<br>6:目标爆率<br>7:人物体力增加<br>8:人物魔力增加<br>11:暴击伤害
---@param item string
---@param value integer
---@return integer
function getnewitemaddvalue(item, value) end

---根据ID获取NPC对象
---*  npcIdx: NPC表内的idx
---@param npcIdx integer
---@return string
function getnpcbyindex(npcIdx) end

---获取NPC对象的Idx
---*  npc: npc对象
---@param npc string
---@return integer
function getnpcindex(npc) end

---获取地图上指定范围内的对象
---*  mapID: 地图ID
---*  X: 坐标X
---*  Y: 坐标Y
---*  range: 范围
---*  flag: 标记值 二进制位表示 1-玩家 2-怪物4-NPC 8-物品16-地图事件
---@param mapID string|integer
---@param X integer
---@param Y integer
---@param range integer
---@param flag integer
---@return table
function getstringinmap(mapID, X, Y, range, flag) end

---获取对面人物的名字
---*  actor: 玩家对象
---@param actor string
---@return any
function getoppositeobj(actor) end

---获取宠物
---*  actor: 玩家对象
---*  idx: 宠物序号或""X"表示当前宠物
---@param actor string
---@param idx integer|string
---@return any
function getpet(actor, idx) end

---获取宠物身上装备列表
---*  idx: 宠物序号
---@param actor string
---@param idx integer
---@return any
function getpetbodyitem(actor, idx) end

---获取宠物蛋信息
---*  actor: 玩家对象
---*  itemmakeid: 物品MakeIndex
---*  type: 需要返回的数值1-转生等级;2-等级;3-经验;0-同时返回三个值
---@param actor string
---@param itemmakeid integer
---@param type integer
---@return any
function getpetegglevel(actor, itemmakeid, type) end

---获取玩家pk等级
---*  actor: 玩家对象
---@param actor string
---@return any
function getpklevel(actor) end

---获取当前NPC对象
---*  actor: 玩家对象
---@param actor string
---@return any
function getcurrnpc(actor) end

---获取自定义进度条参数
---*  actor: 玩家对象
---*  item: 装备对象
---*  actor: 装备精度条索引 0~2
---@param actor string
---@param item string
---@param index integer
---@return any
function getcustomitemprogressbar(actor, item, index) end

---获取装备开孔数据
---*  actor: 玩家对象
---*  item: 装备对象
---@param actor string
---@param item string
---@return any
function getdrillhole(actor, item) end

---获取Envir文件夹下文件列表
---@return any
function getenvirfilelist() end

---获取人物标记/标识值
---*  actor: 人物对象
---*  index:  索引 0-800
---@param actor string
---@param index integer
---@return any
function getflagstatus(actor, index) end

---获取玩家好友列表
---*  actor: 玩家对象
---@param actor string
---@return any
function getfriendnamelist(actor) end

---取字符串在csv表格中的行号
-- * csvPath: csv文件路径
-- * findStr: 字符串
-- * collect: 行数限制
-- * findCol: 查找的列数
-- * findType: 查找类型:0=在开始哪行;1=在最后哪行;
---@param csvPath string
---@param findStr string
---@param collect string
---@param findCol integer
---@param findType integer
---@return any
function getgjcsv(csvPath, findStr, collect, findCol, findType) end

---获取玩家GM权限值
---*  actor: 玩家对象
---@param actor string
---@return any
function getgmlevel(actor) end

---获取队员列表
---*  actor: 玩家对象
---@param actor string
---@return any
function getgroupmember(actor) end

---获取行会信息
---*  actor: 玩家对象
---*  index: 信息索引
---@param actor string
---@param index integer
---@return any
function getguildinfo(actor, index) end

---获取人物所在行会成员数量
---*  actor: 玩家对象
---@param actor string
---@return any
function getguildmembercount(actor) end

---获取行会自定义变量
---*  guild: 行会对象
---*  varName: 变量名
---@param guild string
---@param varName string
---@return any
function getguildvar(guild, varName) end

---获取英雄对象
---*  actor: 玩家对象
---@param actor string
---@return any
function gethero(actor) end

---获取当前表格最大行数、和获取表格最大列数
---*  filename: 文件名
---*  type: 读取目标：0-行数 1-列数
---@param filename string
---@param type integer
---@return any
function gethlcsv(filename, type) end

---获取人物属性
---*  actor: 玩家对象
---*  actor: 属性ID（1-20）
---@param actor string
---@param id integer
---@return any
function gethumability(actor, id) end

---获取人物临时属性
---*  actor: 玩家对象
---*  nWhere: 位置 对应cfg_att_score 属性ID
---@param actor string
---@param nWhere integer
---@return integer
function gethumnewvalue(actor, nWhere) end

---获取物品记录信息
---*  actor: 玩家对象
---*  item: 物品对象
---*  type: [1,2,3]
---*  position: 当type=1,取值范围[0..49] type=2,取值范围[0..19]
---*  model: 0=附加属性;1=基础属性+附加属性
---@param actor string
---@param item string
---@param type integer
---@param position integer
---@param model integer
---@return any
function getitemaddvalue(actor, item, type, position, model) end

---根据物品唯一ID获得物品对象
---*  actor: 玩家对象
---*  makeindex: 物品唯一ID
---@param actor string
---@param makeindex integer
---@return any
function getitembymakeindex(actor, makeindex) end

---获取自定义属性
---*  actor: 玩家对象
---*  item: 物品对象
---@param actor string
---@param item string
---@return any
function getitemcustomabil(actor, item) end

---获取物品信息
---*  actor: 玩家对象
---*  item: 物品对象
---*  id: 1:唯一ID2:物品ID3:剩余持久4:最大持久5:叠加数量6:绑定状态7:物品名称(引擎64_23.08.30新增)8:物品改名后的名称(引擎64_24.08.07新增)
---@param actor string
---@param item string
---@param id integer
---@return any
function getiteminfo(actor, item, id) end

---根据索引返回背包物品信息
---*  actor: 玩家对象
---*  index: 索引号,0开始
---@param actor string
---@param index integer
---@return any
function getiteminfobyindex(actor, index) end

---嘲讽怪物
---*  actor: 玩家对象
---*  distance: 距离人物格子数
---*  grade: 受嘲讽影响的怪物等级上限
---@param actor string
---@param distance integer
---@param grade integer
function dotaunt(actor, distance, grade) end

---装备开孔
---*  actor: 玩家对象
---*  item: 装备对象
---*  holejson: 开孔相关 json字符串 支持0~9共10个孔
---@param actor string
---@param item string
---@param holejson string
function drillhole(actor, item, holejson) end

---使用物品（吃药、使用特殊物品等）
---*  actor: 玩家对象
---*  itemname: 物品名称
---*  count: 玩家对象
---@param actor string
---@param itemname string
---@param count integer
function eatitem(actor, itemname, count) end

---敏感词汇检测
---*  str: 要检测的文本
---@param str string
function exisitssensitiveword(str) end

---过滤全服提示信息
---*  actor: 玩家对象
---*  flag: 是否过滤0-不过滤1-过滤
---@param actor string
---@param flag integer
function filterglobalmsg(actor, flag) end

---搜索行会
---*  index: 搜索关键词 0-行会ID 1-行会名称
---*  key: 	搜索关键词
---@param index integer
---@param key string
---@return string
function findguild(index, key) end

---清除宠物属性
---*  actor: 玩家对象
---*  idx: 	宠物序号
---*  attrName: 清空对应属性组的属性;nil清除所有属性组
---@param actor string
---@param idx integer|string
---@param attrName? integer|string
function delpetattlist(actor, idx, attrName) end

---删除宠物攻击表现
---*  actor: 玩家对象
---*  idx: 宠物序号或"X"表示当前宠物
---*  skillid: 增加的攻击表现ID 为cfg_monattack表中的ID
---@param actor string
---@param idx integer|string
---@param skillid integer
function delpetskill(actor, idx, skillid) end

---镖车自动寻路到指定坐标
---*  actor: 玩家对象
---*  aimX: 目标X坐标
---*  aimY: 目标Y坐标
---*  range: 人物离镖车距离内自动寻路取值范围 0-120-不检测
---@param actor string
---@param aimX integer
---@param aimY integer
---@param range integer
function dartmap(actor, aimX, aimY, range) end

---人物下线 镖车存活设置
---*  actor: 玩家对象
---*  time: 镖车存活时间 秒
---*  isdie: 下线是否消失0-消失 1-时间到达消失
---@param actor string
---@param time integer
---@param isdie integer
function darttime(actor, time, isdie) end

---延时跳转
---*  actor: 玩家对象
---*  time: 时间(毫秒)
---*  func: 触发函数
---*  del: 换地图是否删除此延时 0或为空时=不删除 1=删除
---@param actor string
---@param time integer
---@param func string
---@param del? integer
function delaygoto(actor, time, func, del) end

---延时消息跳转
---*  actor: 玩家对象
---*  time: 时间(毫秒)
---*  func: 触发函数
---@param actor string
---@param time integer
---@param func string
function delaymsggoto(actor, time, func) end

---删除buff
---*  actor: 玩家对象
---*  buffid: buffID
---@param actor string
---@param buffid integer
function delbuff(actor, buffid) end

---删除气泡
---*  actor: 玩家对象
---*  id: 玩家对象
---@param actor string
---@param id integer
function delbutshow(actor, id) end

---删除自定义按钮
---*  actor: 玩家对象
---*  windowid: 主窗口ID
---*  buttonid: 按钮ID
---@param actor string
---@param windowid integer
---@param buttonid integer
function delbutton(actor, windowid, buttonid) end

---关闭屏幕特效
---*  actor: 玩家对象
---*  id: 创建的特效编号
---*  type: 播放模式 0-自己 1-所有人
---@param actor string
---@param id integer
---@param type integer
function deleffects(actor, id, type) end

---删除队员
---*  actor: 玩家对象
---*  memberId: 组员UserId
---@param actor string
---@param memberId string
function delgroupmember(actor, memberId) end

---添加称号
---*  actor: 玩家对象
---*  name: 称号物品名称
---*  use: 开启激活 1激活
---@param actor string
---@param name string
---@param use? integer
function confertitle(actor, name, use) end

---扣除人物通用货币数量(多货币依次计算)
---*  actor: 玩家对象
---*  moneyname: 货币名称
---*  count: 对应货币值
---*  desc: 描述
---@param actor string
---@param moneyname string
---@param count integer
---@param desc? string
function consumebindmoney(actor, moneyname, count, desc) end

---创建队伍
---*  actor: 玩家对象
---@param actor string
function creategroup(actor) end

---创建英雄
---*  actor: 玩家对象
---*  name: 英雄名称
---*  job: 	职业
---*  sex: 性别
---@param actor string
---@param name string
---@param job integer
---@param sex integer
function createhero(actor, name, job, sex) end

---创建国家
---*  actor: 玩家对象
---*  nIdx: 国家ID (1~100)
---*  cName: 	国家名称
---*  maxNum: 限制人数
---@param actor string
---@param nIdx integer
---@param cName string
---@param maxNum integer
function createnation(actor, nIdx, cName, maxNum) end

---创建临时NPC
---*  actor: 玩家对象
---*  X: X坐标
---*  Y: Y坐标
---*  npcJosn: NPC信息Json字符串
---@param actor string
---@param X integer
---@param Y integer
---@param npcJosn string
function createnpc(actor, X, Y, npcJosn) end

---召唤宠物(无需宠物蛋)
---*  actor: 玩家对象
---*  monname: 自定义怪物名称
---*  level: 怪物等级
---@param actor string
---@param monname string
---@param level integer
function createpet(actor, monname, level) end

---修改人物临时属性（带有效期）
---*  actor: 玩家对象
---*  nWhere: 位置 对应cfg_att_score 属性ID
---*  nValue: 对应属性值
---*  nTime: 有效时间 秒
---@param actor string
---@param nWhere integer
---@param nValue integer
---@param nTime integer
function changehumnewvalue(actor, nWhere, nValue, nTime) end

---将物品唯一ID转换成道具表里对应的IDX物品
---*  actor: 玩家对象
---*  itemmakeid: 唯一ID
---*  itemidx: 	道具ID
---@param actor string
---@param itemmakeid integer
---@param itemidx integer
function changeitemidx(actor, itemmakeid, itemidx) end

---调整人物身上物品装备名字颜色
---*  actor: 玩家对象
---*  item: 物品对象
---*  color: 颜色(0-255)颜色=0时恢复默认颜色
---@param actor string
---@param item string
---@param color integer
function changeitemnamecolor(actor, item, color) end

---修改武器、衣服外观
---*  actor: 玩家对象
---*  item: 物品对象
---*  looks: 外观值
---@param actor string
---@param item string
---@param looks integer
function changeitemshape(actor, item, looks) end

---调整人物等级
---*  actor: 玩家对象
---*  opt: 操作符 + - =
---*  count: 数量
---@param actor string
---@param opt string
---@param count integer
function changelevel(actor, opt, count) end

---修改宝宝属性值
---*  actor: 玩家对象
---*  mob: 	宝宝对象
---*  attr: 属性位置
---*  method: 操作符(+ - =)
---*  value: 属性值
---*  time: 有效时间
---@param actor string
---@param mob string
---@param attr integer
---@param method string
---@param value integer
---@param time integer
function changemobability(actor, mob, attr, method, value, time) end

---改变人物模式
---*  actor: 玩家对象
---*  mode: 模式1~24
---*  time: 时间(秒)
---*  param1: 参数1,12-13 18 20 21代表几率 其余代表属性值
---*  param2: 参数2 代表属性值
---@param actor string
---@param mode integer
---@param time integer
---@param param1? integer
---@param param2? integer
function changemode(actor, mode, time, param1, param2) end

---设置人物货币
---*  actor: 玩家对象
---*  id: 货币ID 1-100
---*  opt: 	操作符 + - =
---*  count: 数量
---*  msg: 备注内容
---*  send: 是否推送到客户端
---@param actor string
---@param id integer
---@param opt string
---@param count integer
---@param msg? string
---@param send? boolean
function changemoney(actor, id, opt, count, msg, send) end

---修改宝宝名称
---*  mon: 宝宝对象
---*  name: 宝宝名字
---@param mon string
---@param name string
function changemonname(mon, name) end

---修改人物名字颜色
---*  actor: 玩家对象
---*  color: 颜色索引
---@param actor string
---@param color integer
function changenamecolor(actor, color) end

---修改宝宝等级
---*  actor: 玩家对象
---*  mon: 宝宝对象
---*  opt: 操作符 + - =
---*  nLevel:等级
---@param actor string
---@param mon string
---@param opt string
---@param nLevel integer
function changeslavelevel(actor, mon, opt, nLevel) end

---改变玩家速度
---*  actor: 玩家对象
---*  type: 速度类型 1-移动速度2-攻击速度3-施法速度
---*  level: 速度等级 -10~100-原始速度，-1时间间隔减少10%+1时间间隔增加10%
---@param actor string
---@param type integer
---@param level integer
function changespeed(actor, type, level) end

---新解锁仓库格子
---*  actor: 玩家对象
---*  nCount: 新解锁的格子数
---@param actor string
---@param nCount integer
function changestorage(actor, nCount) end

---检查国家是否创建
---*  nIdx: 国家ID
---@param nIdx integer
function checkation(nIdx) end

---设置英雄名称
---*  actor: 玩家对象
---*  name: 	英雄名称
---@param actor string
---@param name string
function checkheroname(actor, name) end

---检测 人/怪物 状态
---*  objcfg: 玩家/怪物 对象
---*  type: 类型 见说明书
---*  model: 禁止行为
---@param objcfg string
---@param type integer
---@param model? integer
---@return boolean 是否存在
---@return integer 状态剩余时间
function checkhumanstate(objcfg, type, model) end

---检测当前人物是否在跨服的地图
---*  actor: 玩家对象
---@param actor string
function checkkuafu(actor) end

---检查跨服连接是否正常连接
function checkkuafuconnect() end

---检测当前服务器是否为跨服服务器
function checkkuafuserver() end

---检测镜像地图是否存在
---*  MapId: 地图ID
---@param MapId string|integer
function checkmirrormap(MapId) end

---检测加入国家
---*  actor: 玩家对象
---*  nIdx: 国家编号 0~100 0代表没有加入国家
---@param actor string
---@param nIdx integer
function checknational(actor, nIdx) end

---检查国家人物总数
---*  actor: 玩家对象
---*  sFlag: 比较符 =<>
---*  iValue: 	人数
---@param actor string
---@param sFlag string
---@param iValue integer
function checknationhumcount(actor, sFlag, iValue) end

---检测装备的元素属性
---*  actor: 玩家对象
---*  where: 装备位置：-1-OK框中的装备 0~55-身上的装备
---*  iAttr: 属性
---*  sFlag: 比较符=<>
---*  iValue: 数值(1-100)，百分比
---@param actor string
---@param where integer
---@param iAttr integer
---@param sFlag string
---@param iValue integer
function checknewitemvalue(actor, where, iAttr, sFlag, iValue) end

---是否在骑马
---*  actor: 玩家对象
---@param actor string
function checkonhorse(actor) end

---检测范围内怪物数量
---*  actor: 玩家对象
---*  monName: 怪物名，为空 or * 为检测所有怪
---*  nx: 坐标X
---*  ny: 坐标Y
---*  nRange: 范围
---@param actor string
---@param monName string
---@param nx integer
---@param ny integer
---@param nRange integer
function checkrangemoncount(actor, monName, nx, ny, nRange) end

---检测拾取小精灵
---*  actor: 玩家对象
---*  monName: 精灵名称,为空 则检测全部
---@param actor string
---@param monName string
function checkspritelevel(actor, monName) end

---检测人物称号
---*  actor: 玩家对象
---*  title: 称号
---@param actor string
---@param title string
function checktitle(actor, title) end

---删除延迟
---*  actor: 玩家对象
---*  func: 需要删除的延时函数,不填为清除全部
---@param actor string
---@param func? string
function cleardelaygoto(actor, func) end

---清理自定义全局变量
---*  varName: 变量名, * -所有变量
---@param varName string
function clearglobalcustvar(varName) end

---清理自定义行会变量
---*  guild: 行会名称,* -所有行会
---*  varName: 变量名,* -所有变量
---@param actor string
---@param varName string
function clearguildcustvar(actor, varName) end

---清理个人自定义变量
---*  actor: 要清理的人物对象 传入 * 表示清理所有玩家
---*  varName: 变量名,* -所有变量
---@param actor string|string
---@param varName string
function clearhumcustvar(actor, varName) end

---清理物品自定义属性
---*  actor: 玩家对象
---*  item: 物品对象
---*  group: 组别，-1 所有组 0~5对应组别
---@param actor string
---@param item string
---@param group integer
function clearitemcustomabil(actor, item, group) end

---清理地图上指定名字的物品
---*  MapId: 玩家对象
---*  X: X坐标
---*  Y: Y坐标
---*  range: 范围
---*  itemName: 物品名
---@param MapId string|integer
---@param X integer
---@param Y integer
---@param range integer
---@param itemName string
function clearitemmap(MapId, X, Y, range, itemName) end

---刷怪
---*  mapid: 玩家对象
---*  X: X坐标
---*  Y: Y坐标
---*  monname: 怪物名称
---*  range: 范围
---*  count: 数量
---*  color: 颜色(0~255)
---@param mapid string|integer|string
---@param X integer
---@param Y integer
---@param monname string
---@param range integer
---@param count integer
---@param color? integer
function genmon(mapid, X, Y, monname, range, count, color) end

---刷怪(拓展)
---*  mapid: 地图id
---*  x: 坐标X
---*  y: 坐标Y
---*  monname: 怪物名称
---*  range: 范围
---*  count: 数量
---*  owner: 归属对象
---*  color: 颜色(0~255)
---*  showName: 怪物自定义名称
---*  isFilt: 是否过滤数字(0过滤，1不过滤)
---*  countryName: 国家名称
---*  nAttack: 是否可攻击同国家的玩家(0=不可以, 1=可以)
---*  nNatMonPk: 不同国家怪物是否可PK(0=不可以, 1=可以)
---*  nPlayerPk: 人物是否可以攻击相同国家怪物(0=可以, 1=不可以)
---*  nNg: 是否是内功怪(0=普通怪, 1=内功怪)
---@param mapid string|integer
---@param x integer
---@param y integer
---@param monname string
---@param range integer
---@param count integer
---@param owner? integer
---@param color? integer
---@param showName string
---@param isFilt? integer
---@param countryName? string
---@param nAttack? integer
---@param nNatMonPk? integer
---@param nPlayerPk? integer
---@param nNg? integer
---@return table 怪物列表
function genmonex(mapid,x,y,monname,range,count,owner,color,showName,isFilt,countryName,nAttack,nNatMonPk,nPlayerPk,nNg)end

-- ========================== ↓↓↓ 23.08.30新增 ↓↓↓==========================

---等概率或者按权限随机获取分割字符串
---*  str: 需要获取随机的字符串
---*  param1: 0=系统权重随机,有几个字符串就是几份之一;1=按#位权重随机总权重为各项位权重的总和
---*  param2: 0=返回值都显示#权重数字;1=返回值都不显示#权重数字;2=返回值1显示,返回值2不显示;3=返回值2显示,返回值1不显示
---@param str string
---@param param1 integer
---@param param2 integer
---@return string 随机到的字符串
---@return string 剩余的字符串
function ransjstr(str, param1, param2) end

---给按钮增加红点
---*  play: 玩家对象
---*  win_id: 窗口ID
---*  btn_id: 按钮ID/任务栏填任务ID
---*  x: X坐标
---*  y: Y坐标
---*  type: 红点模式(0=图片, 1=特效)
---*  path/effectID: 图片路径或特效编号
---@param play string 玩家对象
---@param win_id integer 窗口ID
---@param btn_id integer 按钮ID/任务栏填任务ID
---@param x integer X坐标
---@param y integer Y坐标
---@param type integer 红点模式(0=图片, 1=特效)
---@param path_or_effectID integer 图片路径或特效编号
function reddot(play, win_id, btn_id, x, y, type, path_or_effectID) end

---给按钮删除红点
---*  play: 玩家对象
---*  win_id: 窗口ID
---*  btn_id: 按钮ID/任务栏填任务ID
---@param play string
---@param win_id integer
---@param btn_id integer
function reddel(play, win_id, btn_id) end

-- ========================== ↓↓↓ 23.10.24新增 ↓↓↓==========================

---从装备位扣除物品
---*  player: 玩家对象
---*  where: 装备位
---*  desc: 描述
---@param player string
---@param where integer
---@param desc? string
---@return boolean 是否扣除成功
function delbodyitem(player, where, desc) end

---发送地图消息
---*  mapid: 地图id
---*  msg: Json消息内容
---@param mapid string|integer
---@param msg string
function sendmapmsg(mapid, msg) end

---怪物寻路/巡逻
---*  player: 怪物对象
---*  posX: x坐标集
---*  posY: y坐标集
---*  modle: 0=寻路, 1=巡逻
---@param player string
---@param posX string
---@param posY string
---@param modle integer
function monmission(player, posX, posY, modle) end

---命令移动怪物
---*  monName: 怪物名字
---*  mapID: 地图ID
---*  posX1: 老坐标X
---*  posY1: 老坐标Y
---*  posX2: 新坐标X
---*  posY2: 新坐标Y
---@param monName string
---@param mapID string|integer
---@param posX1 integer
---@param posY1 integer
---@param posX2 integer
---@param posY2 integer
function movemontopos(monName, mapID, posX1, posY1, posX2, posY2) end

---骰子功能
---*  player: 玩家对象
---*  num: 动画数量;比如3就是会出现3个骰子转动
---*  funcName: 动画结束触发
---@param player string
---@param num integer
---@param funcName string
function playdice(player, num, funcName) end

---学习内功
---*  player: 玩家对象
---@param player string
function readskillng(player) end

---获取内功等级
---*  player: 玩家对象
---@param player string
---@return integer
function getnglevel(player) end

---调整人物内功等级
---*  player: 玩家对象
---*  opt: 控制符(=,+,-)
---*  value: 等级
---@param player string
---@param opt string
---@param value integer
function changenglevel(player, opt, value) end

---调整人物内功经验
---*  player: 玩家对象
---*  opt: 控制符(=,+,-)
---*  value: 经验
---@param player string
---@param opt string
---@param value integer
function changengexp(player, opt, value) end

---开启经络页签
---*  player: 玩家对象
---*  pulse: 经络
---*  isOpen: 0=关闭, 1=开启
---@param player string
---@param pulse integer
---@param isOpen integer
function setpulsestate(player, pulse, isOpen) end

---开启经络穴位
---*  player: 玩家对象
---*  pulse: 经络
---*  acupoint: 穴位（1~5,经络的五个穴位）
---@param player string
---@param pulse integer
---@param acupoint integer
function openpulse(player, pulse, acupoint) end

---收摊
---*  player: 玩家对象
---@param player string
function stopmyshop(player) end

---调整HP(血量)的百分比
---*  player: 玩家对象
---*  opt: 控制符(=,+,-)
---*  value: 数值
---@param player string
---@param opt string
---@param value integer
function addhpper(player, opt, value) end

---调整MP(蓝量)的百分比
---*  player: 玩家对象
---*  opt: 控制符(=,+,-)
---*  value: 数值
---@param player string
---@param opt string
---@param value integer
function addmpper(player, opt, value) end

---获取背包物品列表
---*  player: 玩家对象
---*  itemName: 道具名字
---*  isbind: 是否绑定
---@param player string
---@param itemName? string
---@param isbind? integer
---@return table|string 道具列表，无道具情况返回"0"
function getbagitems(player, itemName, isbind) end

---修改经络的修炼等级格式
---*  player: 玩家对象
---*  pulse: 经络
---*  opt: 控制符(=,+,-)
---*  level: 等级
---@param player string
---@param pulse integer
---@param opt string
---@param level integer
function changepulselevel(player, pulse, opt, level) end

---学习内功/连击技能
---*  player: 玩家对象
---*  skillName: 技能名称
---*  skillLevel: 技能等级
---@param player string
---@param skillName string
---@param skillLevel integer
function addskillex(player, skillName, skillLevel) end

---获取怪物原始各项数据库字段值参数
---*  monIdx/monName: 怪物ID/怪物名称
---*  fieldName: 字段名
---@param monIdx_monName string
---@param fieldName string
---@return string|integer
function getdbmonfieldvalue(monIdx_monName, fieldName) end

---新增接口根据StdMode获取装备位
---*  player: 道具StdMode
---@param stdMode integer
---@return integer
function getposbystdmode(stdMode) end

---英雄改名接口
---*  player: 玩家对象
---*  heroName: 英雄新名字
---@param player string
---@param heroName string
function changeheroname(player, heroName) end

---删除系统任务计时
---*  player: 玩家对象
---*  funcName: 回调函数名
---@param player string
---@param funcName string
function deldsfuncall(player, funcName) end

---改变系统任务计时
---*  player: 玩家对象
---*  funcName: 回调函数名
---*  model: 1=开启, 0=停止
---@param player string
---@param funcName string
---@param model integer
function cngdsfuncallstate(player, funcName, model) end

---增加系统任务计时
---*  player: 玩家对象
---*  funcName: 回调函数名
---*  time: 倒计时时间(毫秒)
---*  model: 0=上线需重新开启否则消失, 1=上线直接执行
---*  isClear: 0=开启新的, 1=上线刷新当前时间
---@param player string
---@param funcName string
---@param time integer
---@param model integer
---@param isClear integer
function dsfuncall(player, funcName, time, model, isClear) end

---拾取物品进背包动画效果
---*  play: 玩家对象
---*  win_id: 窗口ID
---*  btn_id: 按钮ID
---@param play string
---@param win_id integer
---@param btn_id integer
function setpickitemtobag(play, win_id, btn_id) end

---吸怪功能
---*  play: 玩家对象
---*  max: 最大范围
---*  min: 最小范围
---*  monLevel: 怪物等级
---*  type: 0=不嘲讽玩家, 1=嘲讽玩家
---*  isMove: 0=怪物漂移到人物边, 1=怪物瞬移到目前人物坐标, 2=怪物瞬移到目前人物面前
---*  unLimit: 0=无限制, 1=怪物/人物攻击目标不归属自己的不可被吸
---@param play string
---@param max integer
---@param min integer
---@param monLevel integer
---@param type integer
---@param isMove integer
---@param unLimit integer
function monmove(play, max, min, monLevel, type, isMove, unLimit) end

---打印脚本总耗时(微秒)
---*  play: 玩家对象
---*  on/off: 0=开始计时, 1=结束计时，并打印耗时信息
---@param play string
---@param on_off integer
function printusetime(play, on_off) end

---打印脚本总耗时(微秒)
---*  play: 玩家对象
---*  logAct: 日志ID
---*  loginfo: 日志内容
---*  nParam1~nParam5: 整数型(可空)最大支持21亿
---@param play string
---@param logAct integer
---@param loginfo string
---@param nParam1? integer
---@param nParam2? integer
---@param nParam3? integer
---@param nParam4? integer
---@param nParam5? integer
function logact(play, logAct, loginfo, nParam1, nParam2, nParam3, nParam4, nParam5) end

---获取物品原始各项数据库字段值参数
---*  itemIdx/itemName: 物品ID/物品名称
---*  fieldName: 字段名
---@param itemIdx_itemName string
---@param fieldName string
---@return string|integer
function getdbitemfieldvalue(itemIdx_itemName, fieldName) end

---修复城门,城墙等
function repaircastle() end

---人物显示一个放大的虚影
---*  play: 玩家对象
---*  opacity: 透明度(0~255)
---*  time: 显示时间(秒)
---@param play string
---@param opacity integer
---@param time integer
function showphantom(play, opacity, time) end

---前端勾选面板控制命令
---*  play: 玩家对象
---*  type: 0=允许组队1=允许添加好友, 2允许交易, 3=允许挑战, 4允许查看, 5=允许添加为行会成员
---*  time: 1=允许(勾选), 0=不允许(不勾选)(秒)
---@param play string
---@param type integer
---@param time integer
function clientswitch(play, type, time) end

---获取当前地图行会成员数量
---*  mapID: 地图编号
---*  guildName: 行会名字或*(*等于未加入行会人物)
---@param mapID string|integer
---@param guildName string
---@return integer
function maphanghcyguild(mapID, guildName) end

---绑定背包满触发
---*  play: 玩家对象
---*  bindingType: 绑定类型(1：背包满通知)
---*  isOpen: 是否开启(0：关闭，1：开启)
---*  callbackFunc: 回调函数(QF)
---@param play string
---@param bindingType integer
---@param isOpen integer
---@param callbackFunc string
function bindEvent(play, bindingType, isOpen, callbackFunc) end

---获取当前地图怪物状态
---*  mapID: 地图编号
---*  monName: 怪物名称，*表示所有怪物
---*  model: 怪物名字格式，0=默认名称(带数字), 1=显示名字(不带数字)
---*  param: 0=获取表格内刷的怪物状态, 1=获取表格内和脚本刷的怪物状态
---@param mapID string|integer
---@param monName string
---@param model integer
---@param param? integer
---@return table
function mapbossinfo(mapID, monName, model, param) end

---拉起微信和qq等功能
---*  play: 玩家对象
---*  model: 1=拉起QQ, 2=QQ好友, 3=QQ群, 4=微信
---*  param1: 参数2=2,填入QQ号, 参数2=3,填入QQ群号
---*  param2: 参数2=3,填入QQ群key
---@param play string
---@param model integer
---@param param1? integer
---@param param2? string
function sendforqqwx(play, model, param1, param2) end

---开启/关闭地图参数
---*  mapID: 地图编号
---*  mapParam: 地图参数
---*  model: 0=关闭地图参数, 1=开启地图参数
---*  param: 地图参数里的需要的参数
---@param mapID string|integer
---@param mapParam string
---@param model string|integer
---@param param? string|integer
function setmapmode(mapID, mapParam, model, param) end

---装备批量增加附加属性
---*  play: 玩家对象
---*  where: 装备位置(-2操作物品对象)
---*  opt: 运算符(+,-,=)
---*  attrStr: 属性组
---*  item: 物品对象
---@param play string
---@param where integer
---@param opt string
---@param attrStr string
---@param item? string
function setaddnewabil(play, where, opt, attrStr, item) end

---获取人物身上装备属性值命令
---*  play: 玩家对象
---*  model: 类型(1，装备表里基础数据 2，附加属性)
---*  attrID: 属性ID
---*  where: 装备位置(-2操作物品对象)
---*  item: 物品对象
---@param play string
---@param model integer
---@param attrID integer
---@param where integer
---@param item? string
---@return string
function getitemattidvalue(play, model, attrID, where, item) end

---获取角色所有属性
---*  play: 玩家对象
---@param play string
function attrtab(play) end

---给视野内玩家发送自定义广播消息
---*  play: 玩家对象
---*  varIdx: 属性id(1~5)
---*  varValue: 属性值
---@param play string
---@param varIdx integer
---@param varValue integer
function setotherparams(play, varIdx, varValue) end

---宝宝嘲讽
---*  play: 玩家对象
---*  idx: 第几个宝宝（第一个宝宝为0）
---*  rang: 距离格子数
---*  levelMax: 受嘲讽影响的怪物等级上限（不大于指定等级均会被吸引）
---@param play string
---@param idx integer
---@param rang integer
---@param levelMax integer
function mobdotaunt(play, idx, rang, levelMax) end

---调整宝宝攻击人物的威力倍率
---*  play: 玩家对象
---*  petName: 宝宝名称(带数字和不带数字都可以)
---*  pro: 攻击人物威力倍率(威力倍数为0时不攻击人物, 110=攻击人物倍数1.1倍)
---@param play string
---@param petName string
---@param pro integer
function changeslaveattackhumpowerrate(play, petName, pro) end

---创建文本文件
---*  path: 文件路径
---@param path string
function createfile(path) end

---写入指定文本文件
---*  path: 文件路径
---*  str: 写入文本
---*  line: 写入行数(0~65535)
---@param path string
---@param str string
---@param line integer
function addtextlist(path, str, line) end

---获取文本文件指定行的字符串
---*  path: 文件路径
---*  line: 指定行(0~1000)
---@param path string
---@param line integer
---@return string
function getrandomtext(path, line) end

---获取文本文件指定行的内容[根据符号分割]
---*  path: 文件路径
---*  line: 指定行
---*  symbol: 符号
---@param path string
---@param line integer
---@param symbol string
---@return table
function getliststringex(path, line, symbol) end

---取字符串在列表中的下标
---*  path: 文件路径
---*  str: 字符串
---@param path string
---@param str string
---@return integer|nil 字符串所在行，未找到返回nil
function getstringpos(path, str) end

---删除文本文件的内容
---*  path: 文件路径
---*  line: 指定行
---*  model: 删除模式(0=删除行, 1=清空行, 2=删除随机行(参数2失效))
---@param path string
---@param line? string
---@param model integer
function deltextlist(path, line, model) end

---清除列表内容
---*  path: 文件路径
---@param path string
function clearnamelist(path) end

---检查字符串是否在指定文件中
---*  path: 文件路径
---*  str: 字符串
---@param path string
---@param str1 string
---@param str2? string
---@return boolean
function checktextlist(path, str1, str2) end

---检查字符串是否在指定文件中
---*  path: 文件路径
---*  str: 字符串
---*  model: 检测模式(0=列表中,是否包含被检测的字符, 1=被检测的字符是否包含列表中的某一行内容)
---@param path string
---@param str string
---@param model integer
function checkcontainstextlist(path, str, model) end

---通区创建/删除文本
---*  model: 0=创建文件, 1=删除文件
---*  fileName: 文件名称
---@param model integer
---@param fileName string
function tongfile(model, fileName) end

---通区同步文本
---*  fileName: 文件名称
---@param fileName string
function updatetongfile(fileName) end

---更改文件内容
---*  path: 文本路径
---*  str: 内容(最大64中文字符)
---*  line: 指定操作行
---*  model: 0=文件尾追加内容(快), 1 =插入内容到指定行, 2=替换内容到指定行, 3=删除指定行内容, 4=清空整个文件内容
---@param path string
---@param str string
---@param line string
---@param model string
function changetongfile(path, str, line, model) end

---通区变量同步
---*  varName: 全局变量名
---@param varName string
function updatetongvar(varName) end

---主区执行,增加创建文件
---*  varName: 区服ID
---*  model: 0=创建文件, 1=删除文件
---*  path: 文件路径
---@param varName string
---@param model integer
---@param path string
function maintongfile(varName, model, path) end

---写入指定 区服 配置
---*  serverID: 区服ID
---*  path: 文件路径
---*  key: 字段
---*  value: 值
---@param serverID string
---@param path string
---@param key string
---@param value string
function writetongkey(serverID, path, key, value) end

---读取指定 区服 配置 读取后由QF触发
---*  serverID: 区服ID
---*  path: 文件路径
---*  key: 字段
---*  varName: 变量
---@param serverID string
---@param path string
---@param key string
---@param varName string
function readtongkey(serverID, path, key, varName) end

---执行查询通区主服
---*  serverID: 区服ID
---@param serverID string
function checktongsvr(serverID) end

---主区执行 同步文件 将本地文件路径同步到服务器路径
---*  serverID: 区服ID
---*  path: 文件路径
---@param serverID string
---@param path string
function updatemaintongfile(serverID, path) end

---主区执行 同步文件 将本地文件路径同步到服务器路径
---*  serverID: 区服ID
---*  filePath: 服务器文件路径
---*  path: 本地文件路径
---@param serverID string
---@param filePath string
---@param path string
function updatemaintongfile(serverID, filePath, path) end

---主区执行 拉取文件
---*  serverID: 区服ID
---*  filePath: 本地文件路径
---*  path: 远程服务器路径
---@param serverID string
---@param filePath string
---@param path string
---@return any
function getmaintongfile(serverID, filePath, path) end

---拿物品(拓展)
---*  play: 玩家对象
---*  itemName: 物品名称
---*  itemNum: 数量
---*  bind: 0=忽略, 1=扣除非绑定物品, 2=扣除绑定物品
---*  desc: 描述
---@param play string
---@param itemName string
---@param itemNum integer
---@param bind integer
---@param desc? string
---@return boolean 是否扣除成功
function takeitemex(play, itemName, itemNum, bind, desc) end

---判断绑定状态
---*  item: 物品对象
---*  bind: 绑定类型(0-8)
---@param item string
---@param bind integer
---@return boolean 是否绑定
function checkitemstate(item, bind) end

---设置装备部位属性加成(万分比)
---*  play: 玩家对象
---*  where: 装备部位
---*  sFlag: 操作符(=,+,-)
---*  pro: 倍数(万分比)
---@param play string
---@param where integer
---@param sFlag string
---@param pro integer
function setequipaddvalue(play, where, sFlag, pro) end

---获取装备部位属性加成(万分比)
---*  play: 玩家对象
---*  where: 装备部位
---@param play string
---@param where integer
---@return integer
function getequipaddvalue(play, where) end

-- ========================== ↓↓↓ 23.12.07新增 ↓↓↓==========================

---立即推送前端变量
---*  play: 玩家对象
---@param play string
function sendredvartoclient(play) end

---获取字符串属性
---*  play: 玩家对象
---*  attridx: 自定义属性组名称
---@param play string
---@param attridx string
function getattlist(play, attridx) end

---根据物品获取Json2
---*  play: 玩家对象
---@param play string
function getitemjsonex(play) end

---调整人物的当前内力值
---*  play: 玩家对象
---*  sFlag: 操作符(=,+,-)
---*  value: 内力值
---*  model: 计算方式(0=点数, 1=万分比)
---@param play string
---@param sFlag string
---@param value integer
---@param model integer
function addinternalforce(play, sFlag, value, model) end

---修改角色外观(武器、衣服、特效)
---*  play: 玩家对象
---*  type: 0=衣服;1=武器;2=衣服特效;3武器特效;4=盾牌;5=盾牌特效
---*  shape: 外观的shape(角色模型ID),-1表示清除
---*  time: 时间 (秒)
---*  param1: 仅在参数1位置为0时有效(0=覆盖时装外观, 1=时装外观优先)
---*  param2: 仅在参数1位置为0时有效(0-斗笠、头发不变, 1-隐藏斗笠, 2-隐藏头发, 3-隐藏斗笠和头发 4-隐藏盾牌和盾牌特效)
---@param play string
---@param type integer
---@param shape integer
---@param time integer
---@param param1 integer
---@param param2 integer
function setfeature(play, type, shape, time, param1, param2) end

---百分比修改速度
---*  play: 玩家对象
---*  model: 计算方式(1=移动速度, 2=攻击速度, 3=魔法速度)
---*  value: 速度值(0=原速度(大于0=加速 -=减速))
---*  time: 有效时间秒(为空=表示不限制时间,最大值65535)
---@param play string
---@param model integer
---@param value integer
---@param time integer
function changespeedex(play, model, value, time) end

---改变技能特效
---*  play: 玩家对象
---*  skillName: 技能名称
---*  effectID: 特效id,=0为关闭(cfg_skill_present.xls表id)
---*  effectID2: 持续性ID(魔法盾BUFF表id/火墙/群体雷电术/其他的技能无效)
---@param play string
---@param skillName string
---@param effectID integer
---@param effectID2? integer
function setmagicskillefft(play, skillName, effectID, effectID2) end

---获取当前虚拟机id[npcid]
---*  return: npcID（NPC配置表中的ID）<br>特殊npcid:QF=999999999,QM=999999996,LuaCond=999999995,LuaFunc=999999994
---@return integer
function getsysindex() end

---日志上报接口
---*  play: 玩家对象
---*  jsonStr: 日志json
---@param play string
---@param jsonStr string
function senddiymsg(play, jsonStr) end

---设置杀怪内功经验倍数
---*  play: 玩家对象
---*  pro: 倍率(倍数除以100为真正的倍率(200为2倍经验，150为1.5倍))
---*  time: 有效时间(秒)
---@param play string
---@param pro integer
---@param time integer
function killpulseexprate(play, pro, time) end

---设置地图的杀怪内功经验倍数
---*  play: 玩家对象
---*  mapid: 地图id("*"代表所有地图)
---*  pro: 倍率(倍数除以100为真正的倍率(200为2倍经验，150为1.5倍))
---@param play string
---@param mapid string|integer|string
---@param pro integer
function plusemapkillmonexprate(play, mapid, pro) end

---调整人物转生属性点
---*  play: 玩家对象
---*  sFlag: 操作符(=,+)
---*  value: 点数(0-1000)
---@param play string
---@param sFlag string
---@param value integer
function bonuspoint(play, sFlag, value) end

---获取人物转生属性点
---*  play: 玩家对象
---@param play string
---@return integer
function getbonuspoint(play) end

-- ========================== ↓↓↓ 2024-xx-xx等待发布 ↓↓↓==========================

---召唤宝宝
---*  actor: 玩家对象
---*  name: 宝宝名称
---*  x: 宝宝当前地图出生点X（0默认在人物身边）
---*  y: 宝宝当前地图出生点Y（0默认在人物身边）
---*  level: 宝宝等级(最高为7)，级别越高伤害越高
---*  count: 数量
---*  time: 叛变时间(分钟)
---*  color: 是否自动变色（0不改变颜色，建议填0，填1-7为宝宝身上颜色值[颜色有1-7种颜色]，填-1为自动变色，宝宝攻击力会随颜色变化，不建议使用）
---*  ignore: 设置大于0，检测时不计算该宝宝数量(仅M2控制的召唤数量)
---*  nolevelup: 宝宝不升级（0：宝宝升级，1：宝宝）
---*  hide: 隐藏主人名（0：不隐藏；1：隐藏）
---*  inherit: 继承人物伤害百分比 （攻速移动速度等无法继承）
---*  hp: 宝宝血量数值（填的数字是多少宝宝总血量就是多少，填0表示按参数11的，）
---*  buff: BUFF ID 多个BUFF ID用#号连接
---@param actor string
---@param name string
---@param x integer
---@param y integer
---@param level integer
---@param count integer
---@param time integer
---@param color integer
---@param ignore? integer
---@param nolevelup? integer
---@param hide? integer
---@param inherit? integer
---@param hp? integer
---@param buff? string
---@return table 怪物对象列表
function recallmobex(actor, name, x, y, level, count, time, color, ignore, nolevelup, hide, inherit, hp, buff) end

---读取配置文件
---*  readPath: 配置文件路径
---@param readPath string
---@return table 表格所有数据内容
function readexcel(readPath) end

---检查玩家物品
---*  actor: 玩家对象
---*  item_str: 物品名称#物品数量&物品名称#物品数量 (&=和的意思)
---*  is_bind: 0/1/2（0=不检测 1.非绑定 2.绑定）
---*  is_id: 参数1中的物品名称是ID还是道具名称（0，道具名称，1，道具ID）
---@param actor string
---@param item_str string
---@param is_bind integer
---@param is_id integer
---@return boolean 满足条件
function checkitems(actor, item_str, is_id, is_bind) end

---消耗玩家物品
---*  actor: 玩家对象
---*  item_str: 物品名称#物品数量&物品名称#物品数量 (&=和的意思)
---*  model: 参数1中的物品名称是ID还是道具名称（0，道具名称，1，道具ID）
---*  is_bind: 0/1/2（0=不检测 1.非绑定 2.绑定）
---*  desc: 描述
---@param actor string
---@param item_str string
---@param model integer
---@param is_bind integer
---@param desc? string
---@return boolean 是否扣除成功
function takes(actor, item_str, model, is_bind, desc) end

---扣除角色穿戴的装备
---*  actor: 玩家对象
---*  itemName: 装备名称
---*  num: 扣除物品数量
---*  desc: 描述
---@param actor string
---@param itemName string
---@param num integer
---@param desc? string
---@return boolean
function takew(actor, itemName, num, desc) end

---获取人物所有称号
---*  play: 玩家对象
---@param play string
---@return table
function newgettitlelist(play) end

---增加回收组别
---*  actor: 玩家对象
---*  recyclingType: 回收组别，对应表中group字段(支持多类别配置用";"分割)
---@param actor string
---@param recyclingType string
function addrecyclingtype(actor, recyclingType) end

---删除回收组别
---*  actor: 玩家对象
---*  idx: 回收组别索引，-1表示清空回收组别
---@param actor string
---@param idx string
function delrecyclingtype(actor, idx) end

---执行回收
---*  actor: 玩家对象
---@param actor string
function execrecycling(actor) end

---执行自动回收
---*  actor: 玩家对象
---*  interval: 检测间隔时间（单位：秒）
---*  max_bag_space: 背包最大空间（单位：格子）
---@param actor string
---@param interval? integer
---@param max_bag_space? integer
function autorecycling(actor, interval, max_bag_space) end

---怪物寻路
---*  mapID: 地图id
---*  x: x坐标串联
---*  y: y坐标串联
---*  mob: 刷怪坐标x
---*  moby: 刷怪坐标y
---*  count: 数量
---*  range: 范围
---*  mobName: 怪物名字
---*  target: 目标
---*  country: 国家
---*  attackSelfPlayer: 是否攻击本国玩家(0,1)
---*  attackPVP: 不同国家怪物是否PK(0,1)
---*  mobNameColor: 怪物名字颜色
---*  disableSelfPlayerAttack: 是否禁止本国玩家攻击(0,1)
---@param mapID string|integer
---@param x string
---@param y string
---@param mob string
---@param moby string
---@param count integer
---@param range integer
---@param mobName string
---@param target? string
---@param country string
---@param attackSelfPlayer integer
---@param attackPVP integer
---@param mobNameColor integer
---@param disableSelfPlayerAttack integer
function mission(mapID, x, y, mob, moby, count, range, mobName, target, country, attackSelfPlayer, attackPVP,
																	mobNameColor, disableSelfPlayerAttack)
end

---更新OK框物品
---*  actor: 玩家对象
---*  boxID: OK框编号
---@param actor string
---@param boxID integer
function updateboxitem(actor, boxID) end

---判断地图定时器是否存在
---*  mapID: 地图id
---*  timerid: 计时器id
---@param mapID string
---@param timerid integer
---@return boolean
function hasenvirtimer(mapID, timerid) end

---判断玩家定时器是否存在
---*  actor: 玩家对象
---*  timerid: 计时器id
---@param actor string
---@param timerid integer
---@return boolean 是否拥有
function hastimer(actor, timerid) end

---判断全局定时器是否存在
---*  timerid: 计时器id
---@param timerid integer
---@return boolean 是否拥有
function hastimerex(timerid) end

---改变称号时间
---*  actor: 玩家对象
---*  titleName: 称号名称
---*  operation: 操作符（+,-,=）
---*  cour: 时间(+,-传入操作时间(秒), =传入时间戳)
---@param actor string
---@param titleName string
---@param operation string
---@param cour integer
function changetitletime(actor, titleName, operation, cour) end

---改变行会名称
---*  actor: 玩家对象
---*  guildName: 需要改名的行会名
---*  newGuildName: 新的行会名字
---@param actor string
---@param guildName string
---@param newGuildName string
function changeguildname(actor, guildName, newGuildName) end

---获取攻城列表
function getcastlewarlist() end

---重置技能冷却时间
---*  actor: 玩家对象
---*  skill: 技能名称|技能ID
---*  time: 减免的cd时间(秒)传入0则重置技能CD
---@param actor string
---@param skill string|integer
---@param time? integer
function skillrestcd(actor, skill, time) end

---重置怪物生成计时器
---*  mapID: 地图ID
---*  monPosX: 怪物X坐标
---*  monPosY: 怪物Y坐标
---*  monName: 怪物名称
---@param mapID string|integer
---@param monPosX integer
---@param monPosY integer
---@param monName string
function resetmongentick(mapID, monPosX, monPosY, monName) end

---获取IP地址下所有的在线角色名称列表
---*  IPAddress: IP地址
---*  getAllPlayers: 是否获取全部玩家列表0/1(默认限制返回200个)
---@param IPAddress string
---@param getAllPlayers integer
---@return table
function getplaylistbyip(IPAddress, getAllPlayers) end

---发送登陆信息[反外挂]
---@param userID string 玩家唯一ID
function sendloginmsg(userID) end

---检测登陆信息[反外挂]
---@param userID string 玩家唯一ID
function logincheckent(userID) end

---增加天气
---@param mapID string 地图ID
---@param model integer 天气效果 (1=黄沙效果,2=花瓣效果,3=下雪效果)
---@param time integer 有效时间(秒)
function setweathereffect(mapID, model, time) end

---删除天气
---@param mapID string 地图ID
---@param model integer 天气效果 (0=关闭所有效果,1=黄沙效果,2=花瓣效果,3=下雪效果)
function delweathereffect(mapID, model) end

---开启宝箱
---@param actor string 玩家对象
---@param boxidx integer 宝箱ID
---@param num integer 次数(不读数据表次数,只认这里的次数)
function opendragonbox(actor, boxidx, num) end

--- 雇佣沙巴克弓箭手/卫士
--- @since 引擎64_24.05.23
--- @param monID integer 弓箭手/卫士ID
--- @param monType? integer 类型；默认为0，0=弓箭手, 1=卫士
--- @note 雇佣弓箭手/守卫需要消耗城堡金币, 可以在[M2-参数设置-城堡参数]中设置雇佣弓箭/卫士=0
--- @note 弓箭手/守卫的尸体消失后才能进行雇佣
function castlearchergen(monID, monType) end

--- 检测身上佩戴的装备
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
--- @param item_name string 装备名称
--- @param item_num integer 装备名称
--- @return boolean 是否穿戴
function checkitemw(actor, item_name, item_num) end

--- 设置等级锁
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
--- @param itype integer 0:解除锁定, 1:锁定到达最大等级时并且不获取怪物经验, 2:锁定到达最大等级时累积经验(int64)
--- @param level integer 锁住最大等级
function setlocklevel(actor, itype, level) end

--- 复位属性点数
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
function restbonuspoint(actor) end

--- 批量给予物品
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
--- @param itemStr string 物品参数；物品名称#数量#绑定状态&物品名称#数量#绑定状态
--- @param desc string 描述
function gives(actor, itemStr, desc) end

--- 返回前端面板消息[合成系统]
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
--- @param idx string|integer 合成表idx
--- @param json string json信息
function sendactionofjson(actor, idx, json) end

--- 设置人物照亮范围（光照）
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
--- @param value integer 人物照亮范围值；-1=按读取装备的光照值
function setcandlevalue(actor, value) end

--- 指定怪物的爆出
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
--- @param monItem string 怪物名称
--- @param value integer 可爆出次数；最大多爆20次
--- @param delayTime integer? 延迟毫秒数；默认为0
function monitemsex(actor, monItem, value, delayTime) end

--- 传送戒指传送前触发
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
--- @param X integer 目标点X坐标
--- @param Y integer 目标点Y坐标
--- @return boolean 是否允许传送
function beginTeleporter(actor, X, Y) end

--- 获取英雄模式
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
--- @treturn integer 英雄模式；0=攻击, 1=跟随, 2= 休息
function getherosta(actor) end

--- 设置英雄模式
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
--- @param model integer 英雄模式；0=攻击, 1=跟随, 2= 休息
function setherosta(actor, model) end

--- 英雄传送到主体身边
--- @since 引擎64_24.05.23
--- @param actor string 玩家对象
function herofollow(actor) end

--- 存储物品str变量[拓展]
---@since 引擎64_24.05.23
---@param actor string 玩家对象
---@param where integer 装备位置(-2则传入物品对象)
---@param idx integer 变量位置(1-20)
---@param value string 变量值
---@param itemobj? string 物品对象(参数2传入-2时有效)
function setitemparam(actor, where, idx, value, itemobj) end

--- 获取物品str变量[拓展]
---@since 引擎64_24.05.23
---@param actor string 玩家对象
---@param where integer 装备位置(-2则传入物品对象)
---@param idx integer 变量位置(1-20)
---@param itemobj? string 物品对象(参数2传入-2时有效)
---@return string result 变量值
function getitemparam(actor, where, idx, itemobj) end

--- 存储物品int变量[拓展]
---@since 引擎64_24.05.23
---@param actor string 玩家对象
---@param where integer 装备位置(-2则传入物品对象)
---@param idx integer 变量位置(1-50)
---@param value integer 变量值(Int64)
---@param itemobj? string 物品对象(参数2传入-2时有效)
function setitemintparam(actor, where, idx, value, itemobj) end

--- 获取物品int变量[拓展]
---@since 引擎64_24.05.23
---@param actor string 玩家对象
---@param where integer 装备位置(-2则传入物品对象)
---@param idx integer 变量位置(1-50)
---@param itemobj? string 物品对象(参数2传入-2时有效)
---@return integer result 变量值
function getitemintparam(actor, where, idx, itemobj) end

--- 更新物品变量到数据库[拓展]
---@since 引擎64_24.05.23
---@param actor string 玩家对象
---@param where integer 装备位置(-2则传入物品对象)
---@param itemobj? string 物品对象(参数2传入-2时有效)
function updatecustitemparam(actor, where, itemobj) end

--- 设置对象int变量
---@since 引擎64_24.05.23
---@param obj string 怪物/NPC对象
---@param idx integer 变量位置(0-4)
---@param value integer 变量值
function setobjintvar(obj, idx, value) end

--- 获取对象int变量
---@since 引擎64_24.05.23
---@param obj string 怪物/NPC对象
---@param idx integer 变量位置(0-4)
---@return integer result 变量值
function getobjintvar(obj, idx) end

--- 设置对象str变量
---@since 引擎64_24.05.23
---@param obj string 怪物/NPC对象
---@param idx integer 变量位置(0-4)
---@param value string 变量值
function setobjstrvar(obj, idx, value) end

--- 获取对象str变量
---@since 引擎64_24.05.23
---@param obj string 怪物/NPC对象
---@param idx integer 变量位置(0-4)
---@return string result 变量值
function getobjstrvar(obj, idx) end

--- 设置地图int变量
---@since 引擎64_24.05.23
---@param mapid string|integer 地图编号
---@param idx integer 变量位置(0-49)
---@param value integer 变量值
function setenvirintvar(mapid, idx, value) end

--- 获取地图int变量
---@since 引擎64_24.05.23
---@param mapid string|integer 地图编号
---@param idx integer 变量位置(0-49)
---@return integer result 变量值
function getenvirintvar(mapid, idx) end

--- 设置地图str变量
---@since 引擎64_24.05.23
---@param mapid string|integer 地图编号
---@param idx integer 变量位置(0-49)
---@param value string 变量值
function setenvirstrvar(mapid, idx, value) end

--- 获取地图str变量
---@since 引擎64_24.05.23
---@param mapid string|integer 地图编号
---@param idx integer 变量位置(0-49)
---@return string result 变量值
function getenvirstrvar(mapid, idx) end

--- 设置buff堆叠层数
---@since 引擎64_24.05.23
---@param actor string 对象
---@param buffid integer buffid
---@param opt string 操作符 '+' '-' '='
---@param stack integer buff层数 不可超出表中最大层数
---@param itimer boolean 是否重置buff 时间
function buffstack(actor, buffid, opt, stack, itimer) end

--- 在地图上生成掉落物品
---@since 引擎64_24.05.23
---@param mapid string|integer 地图id
---@param actor string 归属对象 填nil则无归属 且拾取cd时间会被设置为0
---@param X integer x坐标
---@param Y integer y坐标
---@param json string 掉落json
---@param data string 物品来源(参考设置物品来源)
---@return table result 物品makeindex列表
function gendropitem(mapid, actor, X, Y, json, data) end

--- 对目标释放技能
---@since 引擎64_24.05.23
---@param actor string 玩家对象
---@param skillID integer 技能ID
---@param sType integer 类型 1-普通技能 2-强化技能
---@param sLevel integer 技能等级
---@param target string 目标对象
---@param data integer 是否显示施法动作 0-不显示 1-显示
function releasemagic_target(actor, skillID, sType, sLevel, target, data) end

--- 对坐标释放技能
---@since 引擎64_24.05.23
---@param actor string 玩家对象
---@param skillID integer 技能ID
---@param sType integer 类型 1-普通技能 2-强化技能
---@param sLevel integer 技能等级
---@param X integer 目标点X坐标
---@param Y integer 目标点Y坐标
---@param data integer 是否显示施法动作 0-不显示 1-显示
function releasemagic_pos(actor, skillID, sType, sLevel, X, Y, data) end

--- 让怪物释放自定义技能
---@since 引擎64_24.05.23
---@param mon string 怪物对象
---@param skillID integer 自定义技能id
---@param X integer 目标点X坐标
---@param Y integer 目标点Y坐标
---@param target string 目标对象
function mon_docustommagic(mon, skillID, X, Y, target) end

--- 添加自定义怪物攻击表现
---@since 引擎64_24.05.23
---@param mon string 怪物对象
---@param skillID integer 攻击表现id,对应cfg_monattack表
function addmonattack(mon, skillID) end

--- 获取自定义排行榜缓存数据
---@since 引擎64_24.05.23
---@param rankidx string 自定义排行榜页签
---@return string result 排行榜数据,json格式
function getsortdata(rankidx) end

--- 添加机器人事件
---@since 引擎64_24.05.23
---@param scheduledName string 机器人名称
---@param executeMethod string 执行方式
---@param time string 时间参数
---@param funcName string 跳转标签
function addscheduled(scheduledName, executeMethod, time, funcName) end

--- 删除机器人事件
---@since 引擎64_24.05.23
---@param scheduledName string 机器人名称
function delscheduled(scheduledName) end

--- 判断机器人事件
---@since 引擎64_24.05.23
---@param scheduledName string 机器人名称
---@return boolean result true=有事件,false=无事件
function hasscheduled(scheduledName) end

--- 添加系统延时回调
---@since 引擎64_24.05.23
---@param time integer 时间(毫秒)
---@param funcName string 触发函数
function grobaldelaygoto(time, funcName) end

--- 删除系统延时回调
---@since 引擎64_24.05.23
---@param funcName? string 需要删除的延时函数,不填为清除全部
---@param value? integer 是否忽视标签参数,0=不忽视,要完整填写添加时的参数,1=忽视,只判断函数名
function grobalcleardelaygoto(funcName, value) end

--- 改变宠物外观
---@since 引擎64_24.05.23
---@param actor string 玩家对象
---@param petIdx string|integer 宠物序号,X表示当前宠物
---@param appr? integer 怪物外观ID(怪物Appr),0=还原
function setpetappr(actor, petIdx, appr) end

--- 清掉地图某范围的怪物
---@since 引擎64_24.05.23
---@param mapID string 地图ID
---@param x integer 坐标X
---@param y integer 坐标Y
---@param range integer 范围
---@param monName integer 怪物名,*表示所有怪物
---@param isDrop integer 是否爆物品,0=不爆,1=爆
---@param isClear integer 是否清尸体,0=不清,1=清
function killmapmon(mapID, x, y, range, monName, isDrop, isClear) end

-- ========================== ↓↓↓ 24.08.07新增 ↓↓↓==========================

--- 接口获取角色所有技能
---@param actor string 玩家对象
---@return table 技能列表
function getallskills(actor) end

--- 接口发起行会战
---@param guildName1 string 宣战行会名字
---@param guildName2 string 敌对行会名字
---@param time integer 时间(分)
---@return boolean 是否发起成功
function setguildwar(guildName1, guildName2, time) end

--- 判断行会之间是否宣战
---@param guildName1 string 行会名字/行会对象
---@param guildName2 string 行会名字/行会对象
---@return boolean 是否宣战
function iswarguild(guildName1, guildName2) end

--- 判断行会之间是否结盟
---@param guildName1 string 行会名字/行会对象
---@param guildName2 string 行会名字/行会对象
---@return boolean 是否宣战
function isallyguild(guildName1, guildName2) end

--- 判断国家之间是否宣战
---@param nationIDX1 integer 国家ID
---@param nationIDX2 integer 国家ID
---@return boolean 是否宣战
function iswarnation(nationIDX1, nationIDX2) end

--- 国家宣战
---@param nationIDX1 integer 国家ID
---@param nationIDX2 integer 国家ID
---@return boolean 是否宣战成功
function setnationwar(nationIDX1, nationIDX2) end

--- 获取国家人数
---@param nationIDX integer 国家ID
---@return integer 国家人数
function getnationmembercount(nationIDX) end

--- 设置阵营ID
---@param actor string 玩家对象
---@param campid integer 阵营id
function setcamp(actor, campid) end

--- 获取阵营ID
---@param actor string 玩家对象
---@return integer 阵营id
function getcamp(actor) end

--- 接口删除Envir目录下的指定文件
---@param path string 文件路径
---@return boolean 是否删除成功
function delfile(path) end
