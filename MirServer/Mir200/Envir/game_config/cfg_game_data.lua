local config = { 
	["avoid_injury"] = { 
		k = "avoid_injury",
		value = "30#5#4#0#0#3#20#0#0#15#16#16#18#15#15",
		notice = "սʿ�ܹ�����������#սʿ�ܹ���ħ������#սʿ��սʿ�˺�����#սʿ�ܷ�ʦ�˺�����#սʿ�ܵ�ʿ�˺�����#��ʦ�ܹ�����������#��ʦ�ܹ���ħ������#��ʦ��սʿ�˺�����#��ʦ�ܷ�ʦ�˺�����#��ʦ�ܵ�ʿ�˺�����#��ʿ�ܹ�����������#��ʿ�ܹ���ħ������#��ʿ��սʿ�˺�����#��ʿ�ܷ�ʦ�˺�����#��ʿ�ܵ�ʿ�˺�����",
	},
	["team_num"] = { 
		k = "team_num",
		value = 10,
		notice = "�����������",
	},
	["guild_updata"] = { 
		k = "guild_updata",
		value = "1#2#0|2#100#9999|3#150#99999",
		notice = "�л�ȼ�#�л���������|�л�ȼ�#�л���������|�л�ȼ�#�л���������",
	},
	["gold_guildexp"] = { 
		k = "gold_guildexp",
		value = "1000#1|1000#10|1000000",
		notice = "���1000���#�ɶһ�1����|���1000���#�ɶһ�10�лὨ���|ÿ�վ�������",
	},
	["announce"] = { 
		k = "announce",
		value = "�л���ֵ��ǣ�\\n 1.ע������л������ý����\\n Ԫ����\\n2.�����¹�ɳʱ�䣬�ǵ�׼ʱ��\\n ��һ��ɳ��\\n3.ÿ��ǵ���ɹ�������������\\n ����",
		notice = "Ĭ�Ϲ���",
	},
	["warehouse_max_num"] = { 
		k = "warehouse_max_num",
		value = 240,
		notice = "�ֿܲ������(48Ϊһҳ������������̶�)",
	},
	["warehouse_num"] = { 
		k = "warehouse_num",
		value = 24,
		notice = "��Ѹ���ҵĲֿ����",
	},
	["currency_shield"] = { 
		k = "currency_shield",
		value = "10|14",
		notice = "ǰ�����λ�����ʾ����",
	},
	["level_max"] = { 
		k = "level_max",
		value = 200,
		notice = "��ɫ�ȼ�����",
	},
	["declareWar"] = { 
		k = "declareWar",
		value = "2#1#100000&4#1#200000&8#1#300000&12#1#500000",
		notice = "��ս����itemid#num",
	},
	["declareWar_time"] = { 
		k = "declareWar_time",
		value = "2#4#8#12",
		notice = "��սʱ��",
	},
	["alliance"] = { 
		k = "alliance",
		value = "1#1#20000&2#1#30000&6#1#50000&12#1#80000&24#1#100000",
		notice = "���˻���itemid#num",
	},
	["alliance_time"] = { 
		k = "alliance_time",
		value = "1#2#6#12#24",
		notice = "����ʱ��",
	},
	["noDigMonsters"] = { 
		k = "noDigMonsters",
		notice = "�ƶ�����ʾ����ͼ��Ĺ���ID",
	},
	["drug_tips"] = { 
		k = "drug_tips",
		value = "<��ͨ��ҩ��/FCOLOR=255><��ҩ/FCOLOR=251>\\<��ͨ��ҩ��/FCOLOR=255><ħ��ҩ/FCOLOR=251>\\<˲��ҩ��/FCOLOR=255><����ѩ˪/FCOLOR=251>",
		notice = "�ڹ�ҩƷ��ע",
	},
	["boxtexiao"] = { 
		k = "boxtexiao",
		value = "15#4531#4511#4512|16#4531#4513#4514|17#4532#4515#4516|18#4533#4517#4518|18#4530#4519#4520|",
		notice = "������Ч",
	},
	["attackglobalCD"] = { 
		k = "attackglobalCD",
		value = 100,
		notice = "�ͻ��˹������",
	},
	["magicglobalCD"] = { 
		k = "magicglobalCD",
		value = 200,
		notice = "�ͻ���ʩ�����",
	},
	["HumanPaperback"] = { 
		k = "HumanPaperback",
		value = "6#32|7#31|8#33",
		notice = "�����װ (սʿ�·�#սʿ����|��ʦ�·�#��ʦ����|��ʿ�·�#��ʿ����)",
	},
	["MonsterPaperback"] = { 
		k = "MonsterPaperback",
		value = 27,
		notice = "�����װ",
	},
	["BuiltinCD"] = { 
		k = "BuiltinCD",
		value = "1000#1000#2000#2000",
		notice = "�ڹҳ�ҩ����ʱ��(��ͨ��ҩCD#��ͨ��ҩCD#˲��ҩCD#�سǾ�CD)",
	},
	["buttonSmall"] = { 
		k = "buttonSmall",
		value = 3,
		notice = "С�˰�ť�ȴ�ʱ��(����0��ʱ��ȴ�)",
	},
	["EXPcoordinate"] = { 
		k = "EXPcoordinate",
		value = "10#450|10#300|250#0|2000",
		notice = "������ʾ����(PC��X����#PC��Y����|�ƶ���X����#�ƶ���Y����|ǰ��ɫ#����ɫ|��;�����ʾ)",
	},
	["StallName"] = { 
		k = "StallName",
		value = "<$USERNAME>��̯λ",
		notice = "Ĭ�ϰ�̯������",
	},
	["BackpackGuide"] = { 
		k = "BackpackGuide",
		value = "1#1#41|42|43|44",
		notice = "����װ�������ť#�������߷ֽⰴť(0=�ر� 1=����)#StdMode����#StdMode����#",
	},
	["Fashionfx"] = { 
		k = "Fashionfx",
		value = 1,
		notice = "ʱװ��ģ(0Ĭ�Ͽ��� 1�ر�) ����ȡ���������,�����Զ���UI����ʱʹ��Ŀǰ",
	},
	["Hangxuan"] = { 
		k = "Hangxuan",
		value = 1,
		notice = "�л���ս���˹رտ��� 0�ر� 1����",
	},
	["RankingList"] = { 
		k = "RankingList",
		value = "1#�ȼ�|2#սʿ|3#��ʦ|4#��ʿ",
		notice = "���а���ʾ (����#��ʾ���� 1#�ȼ�|2#սʿ|3#��ʦ|4#��ʿ)",
	},
	["prompt"] = { 
		k = "prompt",
		value = "res/public/btn_npcfh_04.png#5#1#0.6|res/public/btn_npcfh_04.png#10#-7#1",
		notice = "��������Ʒ��:(������(��)��ʾ���(PC��#X����#Y����#���ű���|�ƶ���#X����#Y����#���ű���)",
	},
	["Redtips"] = { 
		k = "Redtips",
		value = "res/public/btn_npcfh_04.png|res/public/btn_npcfh_03.png",
		notice = "��������ʾͼƬλ��(PC��|�ƶ���)",
	},
	["MiniMap"] = { 
		k = "MiniMap",
		value = "0#50#653#476",
		notice = "����С��ͼ��СX����#Y����#��#��     (ֻ����ƶ���)",
	},
	["Heroqiehuan"] = { 
		k = "Heroqiehuan",
		value = "1#2#3",
		notice = "1=ս�� 2=���� 3=��Ϣ 4=�ػ�(�����������״̬)",
	},
	["Heroqiehuanmoshi"] = { 
		k = "Heroqiehuanmoshi",
		value = 0,
		notice = "Ĭ��0����ģʽ 1=˫���л�ģʽ",
	},
	["itemSacle"] = { 
		k = "itemSacle",
		value = "1.3|1.0",
		notice = "�ƶ��˵���Icon���ţ�Ĭ��1.3��|PC�˵���Icon���ţ�Ĭ��1.0��",
	},
	["Heronuqitiao"] = { 
		k = "Heronuqitiao",
		value = 0,
		notice = "Ĭ��0=Բ��ŭ���� 1=����ŭ����",
	},
	["Fashionexplicit"] = { 
		k = "Fashionexplicit",
		value = 0,
		notice = "��һ�ε�¼ʱװ�����Ƿ��Զ���ѡ 0=����ѡ 1=��ѡ",
	},
	["Monsterlevel"] = { 
		k = "Monsterlevel",
		value = 1,
		notice = "�ڹ���ʾְҵ�ȼ����Ƿ���ʾ����ȼ� 0=����ʾ 1=��ʾ",
	},
	["autousetimes"] = { 
		k = "autousetimes",
		value = 5,
		notice = "�Զ���������ʱʱ������,��λ��",
	},
	["Integratedfashion"] = { 
		k = "Integratedfashion",
		value = "1#1",
		notice = "(����#����) һ��ʱװ�Ƿ��Һͷ���  0Ĭ����ʾ 1=����ʾ  ",
	},
	["heroLoginBtnoffset"] = { 
		k = "heroLoginBtnoffset",
		value = 0,
		notice = "Ӣ��ͷ����ٻ���ť������ߣ�������Ļ�Ƿ�ťһ��ƫ�� 1=һ��ƫ�� 0=��ƫ��",
	},
	["staticSacle"] = { 
		k = "staticSacle",
		value = "1.0|1.0",
		notice = "�����ڹ����ţ��ƶ���Ĭ��1.44��PC��1.0��  �ƶ���|PC��",
	},
	["OpenAuctionByP"] = { 
		k = "OpenAuctionByP",
		value = 1,
		notice = "�ر�PC�������к�����ݼ�P 1=�ر�",
	},
	["SuitCalType"] = { 
		k = "SuitCalType",
		value = 0,
		notice = "��װ(0=����װģʽ 1=����װģʽ)",
	},
	["NoBJSkillID"] = { 
		k = "NoBJSkillID",
		value = 22,
		notice = "���ܽ�ֹ���� �������#�ָ� (����ID#����ID#����ID)",
	},
	["NewKfDay"] = { 
		k = "NewKfDay",
		value = 0,
		notice = "������������<$KFDAY> 0=������24СʱΪһ��    1=����ʱ����Ȼ������� ",
	},
	["setTipsFontSizeVspace"] = { 
		k = "setTipsFontSizeVspace",
		value = "18#2|20#3",
		notice = "����TIPS�����ơ���ע�������С�������м��   ��ʽ: �ƶ��������С#���|PC�������С#���  ���ӣ�18#2|20#3 Ĭ��Ϊ�հ�",
	},
	["ItemLock"] = { 
		k = "ItemLock",
		value = 0,
		notice = "�Ƿ���ʾ��ͼ�� 0=����  1=���е� 2=����ʾ",
	},
	["minimap_title_range"] = { 
		k = "minimap_title_range",
		value = 60,
		notice = "���Ϸ�С��ͼ��ʾ��ͼ��ע���ָ����������λ�þ�����ʾ��������ʾ��������(cfg_mapdesc.xls)",
	},
	["itemGroundSacle"] = { 
		k = "itemGroundSacle",
		value = 1,
		notice = "���������ű���",
	},
	["PickupTime"] = { 
		k = "PickupTime",
		value = 1000,
		notice = "������(��λ: ����) Ĭ��1000",
	},
	["Team_assembled"] = { 
		k = "Team_assembled",
		value = 10086,
		notice = "�����ټ�ʹ�õ���ƷIndex",
	},
	["zhanguxianshi"] = { 
		k = "zhanguxianshi",
		value = "18&100001-19&100010",
		notice = "ʱװ�ڹ۲�λ��ʾ����  \"-\" �ָ����������ö�����  \"&\"  �ָ����� ��һ���ǲ�λ   �ڶ��������������ӣ�\"18&100001-19&100010\"  ��λ18(ʱװ����)��ɫ�ȼ�����1��������ʾ��ʱװ�ڹ�    ��λ19(ʱװ����)��ɫ�ȼ�����10��������ʾ��",
	},
	["missionControl"] = { 
		k = "missionControl",
		value = 1,
		notice = "ֵΪ1ʱ �������ǿ��нű���addbutton�ӵ�����ʱ���Զ�����ԭ������ û������ʾ",
	},
	["AbilInfoEx"] = { 
		k = "AbilInfoEx",
		value = "�Զ������1#9999|Ԫ��#<$MONEY(Ԫ��)>|���#<$MONEY(���)>",
		notice = "�������Զ������?ÿ�б�����|�ָ�,֧�ֱ���",
	},
}
return config
