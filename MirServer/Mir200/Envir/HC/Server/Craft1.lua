local Craft1 = {}

---@class Craft1.cfg
local cfg = {
	{
		{
			cost = { { id = "����", count = 2 }, { id = "����", count = 2 } },
			give = { { id = "�ƽ�����", count = 1 } },
		},
		{
			cost = { { id = "����", count = 2 }, { id = "�Ȼ귨��", count = 2 } },
			give = { { id = "�Ͻ��Ȼ귨��", count = 1 } },
		},
		{
			cost = { { id = "����", count = 2 }, { id = "��ң��", count = 2 } },
			give = { { id = "�����ң��", count = 1 } },
		},
	},
	{
		{
			cost = { { id = "ǿ������ս��", count = 1 }, { id = "���", count = 880000 }, { id = "��ҳ", count = 10 } },
			give = { { id = "����ն", count = 1 } },
		},
		{
			cost = { { id = "ǿ������ħ��", count = 1 }, { id = "���", count = 880000 }, { id = "��ҳ", count = 10 } },
			give = { { id = "�����", count = 1 } },
		},
		{
			cost = { { id = "ǿ����â����", count = 1 }, { id = "���", count = 880000 }, { id = "��ҳ", count = 10 } },
			give = { { id = "��Ѫ��", count = 1 } },
		},
	}
}

HC.walk(cfg, function(t, k, v)
	if k == "id" then
		t[k] = ItemStd.index(v) or error("Invalid item: " .. v)
	end
end)

function Craft1.craft(actor, page, index)
	local info = cfg[page]
	local spec = info[index]
	local ok, msg = check_items(actor, spec.cost)
	if not ok then
		Common.tips(msg, actor)
		return
	end
	if not take_items(actor, spec.cost) then
		Common.tips("�۳�ʧ�ܣ�", actor)
		return
	end
	give_items(actor, spec.give)
	Common.tips("����ɹ���", actor)
end

function Craft1._sync(actor)
	Clients[actor].Craft1.cfg = cfg
end

Event.add(Reg.sync, {
	fn = function(actor)
		Craft1._sync(actor)
	end
})

Server.Craft1 = Craft1
return Craft1
