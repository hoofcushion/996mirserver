local config = { 
	["avoid_injury"] = { 
		k = "avoid_injury",
		value = "30#5#4#0#0#3#20#0#0#15#16#16#18#15#15",
		notice = "战士受怪物物理免伤#战士受怪物魔法免伤#战士受战士伤害降低#战士受法师伤害降低#战士受道士伤害降低#法师受怪物物理免伤#法师受怪物魔法免伤#法师受战士伤害降低#法师受法师伤害降低#法师受道士伤害降低#道士受怪物物理免伤#道士受怪物魔法免伤#道士受战士伤害降低#道士受法师伤害降低#道士受道士伤害降低",
	},
	["team_num"] = { 
		k = "team_num",
		value = 10,
		notice = "组队人数上限",
	},
	["guild_updata"] = { 
		k = "guild_updata",
		value = "1#2#0|2#100#9999|3#150#99999",
		notice = "行会等级#行会人数上限|行会等级#行会人数上限|行会等级#行会人数上限",
	},
	["gold_guildexp"] = { 
		k = "gold_guildexp",
		value = "1000#1|1000#10|1000000",
		notice = "最低1000金币#可兑换1荣誉|最低1000金币#可兑换10行会建设度|每日捐献上限",
	},
	["announce"] = { 
		k = "announce",
		value = "行会的兄弟们：\\n 1.注意完成行会任务获得金珠和\\n 元宝！\\n2.留意下攻沙时间，记得准时上\\n 线一起攻沙！\\n3.每天记得完成工资任务领金珠和\\n 红薯！",
		notice = "默认公告",
	},
	["warehouse_max_num"] = { 
		k = "warehouse_max_num",
		value = 240,
		notice = "总仓库格子数(48为一页，这个基于面板固定)",
	},
	["warehouse_num"] = { 
		k = "warehouse_num",
		value = 24,
		notice = "免费给玩家的仓库格子",
	},
	["currency_shield"] = { 
		k = "currency_shield",
		value = "10|14",
		notice = "前端屏蔽货币提示消耗",
	},
	["level_max"] = { 
		k = "level_max",
		value = 200,
		notice = "角色等级上限",
	},
	["declareWar"] = { 
		k = "declareWar",
		value = "2#1#100000&4#1#200000&8#1#300000&12#1#500000",
		notice = "宣战花费itemid#num",
	},
	["declareWar_time"] = { 
		k = "declareWar_time",
		value = "2#4#8#12",
		notice = "宣战时长",
	},
	["alliance"] = { 
		k = "alliance",
		value = "1#1#20000&2#1#30000&6#1#50000&12#1#80000&24#1#100000",
		notice = "结盟花费itemid#num",
	},
	["alliance_time"] = { 
		k = "alliance_time",
		value = "1#2#6#12#24",
		notice = "结盟时长",
	},
	["noDigMonsters"] = { 
		k = "noDigMonsters",
		notice = "移动不提示挖肉图标的怪物ID",
	},
	["drug_tips"] = { 
		k = "drug_tips",
		value = "<普通红药：/FCOLOR=255><金创药/FCOLOR=251>\\<普通蓝药：/FCOLOR=255><魔法药/FCOLOR=251>\\<瞬回药：/FCOLOR=255><万年雪霜/FCOLOR=251>",
		notice = "内挂药品备注",
	},
	["boxtexiao"] = { 
		k = "boxtexiao",
		value = "15#4531#4511#4512|16#4531#4513#4514|17#4532#4515#4516|18#4533#4517#4518|18#4530#4519#4520|",
		notice = "宝箱特效",
	},
	["attackglobalCD"] = { 
		k = "attackglobalCD",
		value = 100,
		notice = "客户端攻击间隔",
	},
	["magicglobalCD"] = { 
		k = "magicglobalCD",
		value = 200,
		notice = "客户端施法间隔",
	},
	["HumanPaperback"] = { 
		k = "HumanPaperback",
		value = "6#32|7#31|8#33",
		notice = "人物简装 (战士衣服#战士武器|法师衣服#法师武器|道士衣服#道士武器)",
	},
	["MonsterPaperback"] = { 
		k = "MonsterPaperback",
		value = 27,
		notice = "怪物简装",
	},
	["BuiltinCD"] = { 
		k = "BuiltinCD",
		value = "1000#1000#2000#2000",
		notice = "内挂吃药基础时间(普通红药CD#普通蓝药CD#瞬回药CD#回城卷CD)",
	},
	["buttonSmall"] = { 
		k = "buttonSmall",
		value = 3,
		notice = "小退按钮等待时间(大于0有时间等待)",
	},
	["EXPcoordinate"] = { 
		k = "EXPcoordinate",
		value = "10#450|10#300|250#0|2000",
		notice = "经验显示坐标(PC端X坐标#PC端Y坐标|移动端X坐标#移动端Y坐标|前景色#背景色|最低经验显示)",
	},
	["StallName"] = { 
		k = "StallName",
		value = "<$USERNAME>的摊位",
		notice = "默认摆摊的名称",
	},
	["BackpackGuide"] = { 
		k = "BackpackGuide",
		value = "1#1#41|42|43|44",
		notice = "背包装备佩戴按钮#背包道具分解按钮(0=关闭 1=开启)#StdMode分类#StdMode分类#",
	},
	["Fashionfx"] = { 
		k = "Fashionfx",
		value = 1,
		notice = "时装裸模(0默认开启 1关闭) 后期取消这个功能,做成自定义UI的临时使用目前",
	},
	["Hangxuan"] = { 
		k = "Hangxuan",
		value = 1,
		notice = "行会宣战结盟关闭开关 0关闭 1开启",
	},
	["RankingList"] = { 
		k = "RankingList",
		value = "1#等级|2#战士|3#法师|4#道士",
		notice = "排行榜显示 (排序#显示名称 1#等级|2#战士|3#法师|4#道士)",
	},
	["prompt"] = { 
		k = "prompt",
		value = "res/public/btn_npcfh_04.png#5#1#0.6|res/public/btn_npcfh_04.png#10#-7#1",
		notice = "背包满物品如:(聚灵珠(大)提示红点(PC端#X坐标#Y坐标#缩放比例|移动端#X坐标#Y坐标#缩放比例)",
	},
	["Redtips"] = { 
		k = "Redtips",
		value = "res/public/btn_npcfh_04.png|res/public/btn_npcfh_03.png",
		notice = "界面红点提示图片位置(PC端|移动端)",
	},
	["MiniMap"] = { 
		k = "MiniMap",
		value = "0#50#653#476",
		notice = "调整小地图大小X坐标#Y坐标#宽#高     (只针对移动端)",
	},
	["Heroqiehuan"] = { 
		k = "Heroqiehuan",
		value = "1#2#3",
		notice = "1=战斗 2=跟随 3=休息 4=守护(最低配置三个状态)",
	},
	["Heroqiehuanmoshi"] = { 
		k = "Heroqiehuanmoshi",
		value = 0,
		notice = "默认0拖屏模式 1=双击切换模式",
	},
	["itemSacle"] = { 
		k = "itemSacle",
		value = "1.3|1.0",
		notice = "移动端道具Icon缩放（默认1.3）|PC端道具Icon缩放（默认1.0）",
	},
	["Heronuqitiao"] = { 
		k = "Heronuqitiao",
		value = 0,
		notice = "默认0=圆形怒气条 1=竖形怒气条",
	},
	["Fashionexplicit"] = { 
		k = "Fashionexplicit",
		value = 0,
		notice = "第一次登录时装外显是否自动勾选 0=不勾选 1=勾选",
	},
	["Monsterlevel"] = { 
		k = "Monsterlevel",
		value = 1,
		notice = "内挂显示职业等级，是否显示怪物等级 0=不显示 1=显示",
	},
	["autousetimes"] = { 
		k = "autousetimes",
		value = 5,
		notice = "自动穿戴倒计时时间设置,单位秒",
	},
	["Integratedfashion"] = { 
		k = "Integratedfashion",
		value = "1#1",
		notice = "(斗笠#发型) 一体时装是否斗笠和发型  0默认显示 1=不显示  ",
	},
	["heroLoginBtnoffset"] = { 
		k = "heroLoginBtnoffset",
		value = 0,
		notice = "英雄头像和召唤按钮都在左边，刘海屏幕是否按钮一起偏移 1=一起偏移 0=不偏移",
	},
	["staticSacle"] = { 
		k = "staticSacle",
		value = "1.0|1.0",
		notice = "剑甲内观缩放（移动段默认1.44，PC端1.0）  移动端|PC端",
	},
	["OpenAuctionByP"] = { 
		k = "OpenAuctionByP",
		value = 1,
		notice = "关闭PC端拍卖行呼出快捷键P 1=关闭",
	},
	["SuitCalType"] = { 
		k = "SuitCalType",
		value = 0,
		notice = "套装(0=老套装模式 1=新套装模式)",
	},
	["NoBJSkillID"] = { 
		k = "NoBJSkillID",
		value = 22,
		notice = "技能禁止暴击 多个技能#分割 (技能ID#技能ID#技能ID)",
	},
	["NewKfDay"] = { 
		k = "NewKfDay",
		value = 0,
		notice = "常量开服天数<$KFDAY> 0=按运行24小时为一天    1=开服时间自然日天计算 ",
	},
	["setTipsFontSizeVspace"] = { 
		k = "setTipsFontSizeVspace",
		value = "18#2|20#3",
		notice = "配置TIPS的名称、备注的字体大小和上下行间隔   格式: 移动端字体大小#间隔|PC端字体大小#间隔  例子：18#2|20#3 默认为空白",
	},
	["ItemLock"] = { 
		k = "ItemLock",
		value = 0,
		notice = "是否显示锁图标 0=背包  1=所有的 2=不显示",
	},
	["minimap_title_range"] = { 
		k = "minimap_title_range",
		value = 60,
		notice = "右上方小地图显示地图备注名字根据玩家自身位置距离显示，文字显示坐标配置(cfg_mapdesc.xls)",
	},
	["itemGroundSacle"] = { 
		k = "itemGroundSacle",
		value = 1,
		notice = "掉落物缩放比例",
	},
	["PickupTime"] = { 
		k = "PickupTime",
		value = 1000,
		notice = "捡物间隔(单位: 毫秒) 默认1000",
	},
	["Team_assembled"] = { 
		k = "Team_assembled",
		value = 10086,
		notice = "队伍召集使用的物品Index",
	},
	["zhanguxianshi"] = { 
		k = "zhanguxianshi",
		value = "18&100001-19&100010",
		notice = "时装内观部位显示条件  \"-\" 分隔符可以配置多个检测  \"&\"  分隔符， 第一个是部位   第二个是条件（例子：\"18&100001-19&100010\"  部位18(时装武器)角色等级满足1级才能显示在时装内观    部位19(时装斗笠)角色等级满足10级才能显示）",
	},
	["missionControl"] = { 
		k = "missionControl",
		value = 1,
		notice = "值为1时 任务栏那块有脚本用addbutton加的内容时会自动隐藏原本任务 没有则显示",
	},
	["AbilInfoEx"] = { 
		k = "AbilInfoEx",
		value = "自定义标题1#9999|元宝#<$MONEY(元宝)>|金币#<$MONEY(金币)>",
		notice = "属性栏自定义标题 每行标题用|分割,支持变量",
	},
}
return config
