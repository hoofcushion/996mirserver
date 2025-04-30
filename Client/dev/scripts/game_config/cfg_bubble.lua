local config = { 
	[1] = { 
		id = 1,
		ShowText = "测试气泡",
		Link = "@气泡引导回调,aaa,bbb,ccccc",
		VarCondition1 = "U10=1",
		VarCondition2 = "U11=1",
		currencyCondition = "1>=1000",
		BindCurrency = 1,
	},
	[2] = { 
		id = 2,
		ShowText = "我要变强",
		Link = "@气泡引导变强",
		VarCondition1 = "U10=2",
		VarCondition2 = "U11=2",
		currencyCondition = "2>=2000",
		BindCurrency = 2,
	},
}
return config
