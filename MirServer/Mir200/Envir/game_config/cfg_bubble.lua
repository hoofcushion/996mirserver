local config = { 
	[1] = { 
		id = 1,
		ShowText = "��������",
		Link = "@���������ص�,aaa,bbb,ccccc",
		VarCondition1 = "U10=1",
		VarCondition2 = "U11=1",
		currencyCondition = "1>=1000",
		BindCurrency = 1,
	},
	[2] = { 
		id = 2,
		ShowText = "��Ҫ��ǿ",
		Link = "@����������ǿ",
		VarCondition1 = "U10=2",
		VarCondition2 = "U11=2",
		currencyCondition = "2>=2000",
		BindCurrency = 2,
	},
}
return config
