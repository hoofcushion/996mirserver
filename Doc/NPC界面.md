### NPC界面文本发送

say

| 参数  | 类型   | 空  | 默认 | 注释         |
| ----- | ------ | --- | ---- | ------------ |
| actor | object | 否  |      | 玩家对象     |
| msg   | string | 否  |      | 界面文本内容 |

```
复制function main(actor)

    local msg = [[

        <Button|a=0|x=180.0|y=2.0|tips={点击查看【金钻服务】/FCOLOR=250}|tipsx=10|tipsy=110|nimg=public/00000361.png|color=255|size=18|pimg=public/00000362.png|link=@linkclick,参数1,参数2,3>

    ]]

    say(actor,msg)

end









[[

    注意:如果需要传递参数到脚本接口，只需要在后面接 逗号 参数

    不支持老传奇传递参数的方式，lua里全部通过 @xxxx,1,2,3 这种方式传递参数

]]

function linkclick(actor,...)

    release_print("传入参数",...)

end
```

- 注意：一定小写

### 增加自定义按钮

addbutton

| 参数     | 类型    | 空  | 默认 | 注释     |
| -------- | ------- | --- | ---- | -------- |
| actor    | object  | 否  |      | 玩家对象 |
| windowid | integer | 否  |      | 主窗口ID |
| buttonid | integer | 否  |      | 按钮ID   |
| icon     | string  | 否  |      | 图标内容 |

```
复制参数1:主窗口ID

101 主界面左上 建议开始微调坐标 0 0

102 主界面右上 建议开始微调坐标 -65 0

103 主界面左下 建议开始微调坐标 0 -92

104 主界面右下 建议开始微调坐标 -62 -92

105 主界面左中 建议开始微调坐标 0 0

106 主界面上中 建议开始微调坐标 0 0

107 主界面右中 建议开始微调坐标 -62 0

108 主界面下中 建议开始微调坐标 0 -92

109 主界面切换按钮

110 主界面任务界面

1101 主界面最顶左上

1102 主界面最顶右上

1103 主界面最顶左下

1104 主界面最顶右下











2 角色-外框主面板-(切换页签按钮也会在)









3    角色-装备-上层

3001 角色-装备-下层









301  别人装备界面-上层

3002 别人装备界面-下层









4    角色-状态

5    角色-属性

6    角色-技能

7    角色-背包

8    小地图

9    行会 行会列表

10   行会 行会创建

11   行会 主面板

12   行会 行会成员

14   邮件

15   好友









16   大仓库面板

19   设置 保护

20   设置 拾取

21   设置 战斗

22   设置 操作

23   角色-称号

29   拍卖行 主面板

30   拍卖行 世界拍卖

31   拍卖行 行会拍卖

32   拍卖行 我的竞拍

33   拍卖行 我的上架

34   拍卖行 竞价

35   拍卖行 一口价

36   拍卖行 上架

37   拍卖行 下架

38   拍卖行 超时

39   角色-时装

3901 角色-查看别人时装









3902  时装界面-下层

40   充值界面

41   首饰盒

42   合成面板

43   怪物大血条

44   答题验证界面

45   自定义排行榜

46   图形验证界面









300  新内挂-基础

305  新内挂-视距

302  新内挂-战斗

303  新内挂-保护

304  新内挂-挂机









701  商城-装饰

702  商城-补给

703  商城-强化

704  商城-好友









2301 他人称号









3903  时装界面-下层

4101 查看他人首饰盒









7001 背包第一页

7002 背包第二页

7003 背包第三页

112  PC端聊天栏

50002 英雄-角色外框主面板(二合一面板不支持挂靠)

50003 英雄-装备 上层

53001 英雄-装备 下层

50301 英雄-查看别人装备-上层

53002 英雄-查看别人装备-下层

50004  英雄-状态

50005  英雄-属性

50006  英雄-技能

50007  英雄-背包

50023  英雄-称号

52301  查看他人英雄称号

50039  英雄-时装

53901  查看他人英雄时装

50041  英雄-首饰盒

54101  查看他人英雄首饰盒









401    内功状态

402    内功技能

403    内功经络

40301    经络-冲脉

40302    经络-阴跷

40303    经络-阴维

40304    经络-任脉

40305    经络-奇经

404    内功连击

501    英雄内功状态

502    英雄内功技能

503    英雄内功经络

50301    英雄经络-冲脉

50302    英雄经络-阴跷

50303    英雄经络-阴维

50304    英雄经络-任脉

50305    英雄经络-奇经

504    英雄内功连击











参数2：图标ID  (1~XX不限制,不可重复)











参数3：图标内容

<Button|a=0|x=180.0|y=2.0|tips={点击查看【金钻服务】/FCOLOR=250}|tipsx=10|tipsy=110|nimg=custom/zdy/tubiao/jzhuiyuan1.png|color=255|size=18|pimg=custom/zdy/tubiao/jzhuiyuan1.png|link=@会员服务>
```

### 删除自定义按钮

delbutton

| 参数     | 类型    | 空  | 默认 | 注释     |
| -------- | ------- | --- | ---- | -------- |
| actor    | object  | 否  |      | 玩家对象 |
| windowid | integer | 否  |      | 主窗口ID |
| buttonid | integer | 否  |      | 按钮ID   |

### 打开OK框

openupgradedlg

| 参数  | 类型   | 空  | 默认 | 注释     |
| ----- | ------ | --- | ---- | -------- |
| actor | object | 否  |      | 玩家对象 |
| title | string | 否  |      | OK框标题 |

### 回收OK框物品

takedlgitem

| 参数  | 类型    | 空  | 默认 | 注释                   |
| ----- | ------- | --- | ---- | ---------------------- |
| actor | object  | 否  |      | 玩家对象               |
| count | integer | 否  |      | 数量(针对叠加物品有效) |

### 返回OK框物品到背包

reclaimitem

| 参数  | 类型   | 空  | 默认 | 注释     |
| ----- | ------ | --- | ---- | -------- |
| actor | object | 否  |      | 玩家对象 |

### 自定义OK框

```
复制function main(actor)

    local msg = [[<Img|a=0|x=0.0|y=0.0|width=600|height=250|scale9t=100|scale9r=220|img=public/bg_npc_11.jpg|scale9l=10|scale9b=100|bg=1>

    <Button|a=0|x=596.0|y=1.0|size=18|color=255|nimg=public/1900000510.png|pimg=public/1900000511.png|link=@exit>

    <Text|a=0|x=385.0|y=50.0|size=16|color=251|text=自动放入木剑到OK框|link=@takeonfunc>

    <Text|a=0|x=385.0|y=100.0|size=16|color=251|text=返回OK框内物品到包裹|link=@backbagfunc>

    <Text|a=0|x=385.0|y=150.0|size=16|color=251|text=删除OK框内物品|link=@delitemfunc>

    <Text|a=0|x=385.0|y=200.0|size=16|color=251|text=获取ok框内的对象|link=@getfunc>

    <ITEMBOX|x=49.0|y=50.0|width=70|height=70|tips=<只能放入\武器/FCOLOR=249>|boxindex=1|stdmode=*|tipsx=4|tipsy=100|img=public/1900000651_3.png>]]

    say(actor,msg)

end









function delitemfunc(actor)

    delboxitem(actor,1,2)

end









function backbagfunc(actor)

    returnboxitem(actor,1)

end









function takeonfunc(actor)

    bagitemintobox(actor,"木剑",1)

end









function getfunc(actor)

    local itemobj = getboxitem(actor,1)

    local itemName = getiteminfo(actor,itemobj,7)

    release_print("物品框内道具",itemName)

end
```

### 把包裹中的物品放入自定义OK框中

bagitemintobox

| 参数  | 类型           | 空  | 默认 | 注释                |
| ----- | -------------- | --- | ---- | ------------------- |
| actor | object         | 否  |      | 玩家对象            |
| item  | string/integer | 否  |      | 物品名称 物品唯一id |
| idx   | integer        | 否  |      | OK框编号(0~99)      |

### 把自定义OK框物品返回到包裹

returnboxitem

| 参数  | 类型    | 空  | 默认 | 注释           |
| ----- | ------- | --- | ---- | -------------- |
| actor | object  | 否  |      | 玩家对象       |
| idx   | integer | 否  |      | OK框编号(0~99) |

### 删除自定义OK框中的物品

delboxitem

| 参数  | 类型    | 空  | 默认 | 注释                                                  |
| ----- | ------- | --- | ---- | ----------------------------------------------------- |
| actor | object  | 否  |      | 玩家对象                                              |
| idx   | integer | 否  |      | OK框编号(0~99)                                        |
| num   | integer | 否  |      | 删除数量;参数只有是叠加物品时才会有效，为空则全部删除 |

### 获取自定义OK框中的物品对象

getboxitem

| 参数  | 类型    | 空  | 默认 | 注释           |
| ----- | ------- | --- | ---- | -------------- |
| actor | object  | 否  |      | 玩家对象       |
| idx   | integer | 否  |      | OK框编号(0~99) |

### 更新OK框物品

updateboxitem

引擎64_24.03.14新增接口

| 参数  | 类型    | 空  | 默认 | 注释     |
| ----- | ------- | --- | ---- | -------- |
| actor | string  | 否  |      | 玩家对象 |
| boxID | integer | 否  |      | OK框编号 |
