### 创建临时NPC

createnpc

| 参数 | 类型    | 空  | 默认 | 注释               |
| ---- | ------- | --- | ---- | ------------------ |
| map  | string  | 否  |      | 地图编号           |
| X    | integer | 否  |      | X坐标              |
| Y    | integer | 否  |      | Y坐标              |
| NPC  | string  | 否  |      | NPC信息 json字符串 |

```
复制[[

    注意：自定义NPC的Idx不允许与配置表中的NPCID重复。

    Idx重复的NPC不会被创建出来。

]]

local npcInfo = {

    ["Idx"] =  npcidx,  -- 自定义NPC的Idx，NPC点击触发时，触发参数会传回Idx值

    ["npcname"] =  "测试", -- NPC名称

    ["appr"] =   7,  -- NPC外形效果

    ["script"] =   'NewNPC'  -- NPC相关脚本名称，表示Envir\Market_def\NewNPC.txt

    ["limit"] = 5, -- 生命周期 (秒) 引擎64_24.05.23新增

}

createnpc(mapID,x,y,tbl2json(npcInfo))
```

### 删除NPC

delnpc

| 参数 | 类型   | 空  | 默认 | 注释     |
| ---- | ------ | --- | ---- | -------- |
| name | string | 否  |      | NPC名称  |
| map  | string | 否  |      | 地图编号 |

### 根据ID获取NPC对象

getnpcbyindex

| 参数     | 类型   | 空  | 默认 | 注释                       |
| -------- | ------ | --- | ---- | -------------------------- |
| NPCIndex | int    | 否  |      | NPC索引（NPC配置表中的ID） |
| npc      | object | 否  |      | NPC对象                    |

### 打开指定NPC面板

opennpcshow

| 参数     | 类型   | 空  | 默认 | 注释                       |
| -------- | ------ | --- | ---- | -------------------------- |
| play     | object | 否  |      | 玩家对象                   |
| NPCIndex | int    | 否  |      | NPC索引（NPC配置表中的ID） |
| nRange   | int    | 否  |      | 范围值，在此范围内允许打开 |

### 移动到指定NPC附近

opennpcshowex

| 参数     | 类型   | 空  | 默认 | 注释                                 |
| -------- | ------ | --- | ---- | ------------------------------------ |
| play     | object | 否  |      | 玩家对象                             |
| NPCIndex | int    | 否  |      | NPC索引（NPC配置表中的ID）           |
| nRange   | int    | 否  |      | 范围值， 不在此范围内则移动到NPC附近 |
| nRange2  | int    | 否  |      | 范围值2，移动到NPC附近的范围内       |

```
复制1. NPC不在当前地图时: nRange>0: 瞬移传送到NPC附近; nRange=0: 不传送;

2. NPC在当前地图时: nRange>0: 瞬移传送到NPC附近; nRange=0: 导航到NPC附近;
```

### 获取当前NPC对象

getcurrnpc

| 参数   | 类型   | 空  | 默认 | 注释                  |
| ------ | ------ | --- | ---- | --------------------- |
| player | object | 否  |      | 玩家对象              |
| result | object | 否  |      | 返回值，当前的NPC对象 |

### 设置NPC特效

setnpceffect

| 参数     | 类型   | 空  | 默认 | 注释                         |
| -------- | ------ | --- | ---- | ---------------------------- |
| player   | object | 否  |      | 玩家对象                     |
| NPCIndex | int    | 否  |      | NPC索引（NPC配置表中的ID）   |
| Effect   | int    | 否  |      | 特效ID 5055-感叹号 5056-问号 |
| X        | int    | 否  |      | X坐标                        |
| Y        | int    | 否  |      | Y坐标                        |

```
复制当X、Y<0时，默认取NPC的坐标
```

### 删除NPC特效

delnpceffect

| 参数     | 类型   | 空  | 默认 | 注释                       |
| -------- | ------ | --- | ---- | -------------------------- |
| player   | object | 否  |      | 玩家对象                   |
| NPCIndex | int    | 否  |      | NPC索引（NPC配置表中的ID） |

### 关闭当前的NPC对话框

close

| 参数   | 类型   | 空  | 默认 | 注释     |
| ------ | ------ | --- | ---- | -------- |
| player | object | 否  |      | 玩家对象 |

### 给NPC注册Lua消息

regnpcmsg

| 参数     | 类型 | 空  | 默认 | 注释                       |
| -------- | ---- | --- | ---- | -------------------------- |
| msgId    | int  | 否  |      | 消息ID                     |
| NPCIndex | int  | 否  |      | NPC索引（NPC配置表中的ID） |

```
复制给NPC注册LUA消息后，当服务器接收到Lua消息，如果有对应的NPC且玩家在NPC有效区域（同地图且在NPC附近）内，则激活NPC脚本内容（相当于点击了NPC）
```

### 获取NPC对象的Idx

getnpcindex

| 参数   | 类型   | 空  | 默认 | 注释                       |
| ------ | ------ | --- | ---- | -------------------------- |
| npc    | object | 否  |      | NPC对象                    |
| result | int    | 否  |      | NPC索引（NPC配置表中的ID） |

### 调用其他NPC的lua函数

callfunbynpc 注意：如果开启多线程，会导致执行失败

| 参数      | 类型   | 空  | 默认 | 注释                                                                                                |
| --------- | ------ | --- | ---- | --------------------------------------------------------------------------------------------------- |
| play      | object | 否  |      | 玩家对象                                                                                            |
| npcidx    | int    | 否  |      | NPC索引（NPC配置表中的ID），特殊npcid:QF=999999999,QM=999999996,LuaCond=999999995,LuaFunc=999999994 |
| delaytime | int    | 否  |      | 延迟时间ms,0立即执行                                                                                |
| func      | string | 否  |      | 函数名                                                                                              |
| sParam    | string | 否  |      | 参数                                                                                                |

```
复制callfunbynpc(self, 999999999, 1000, 'test', 'abc=1')



function test(self, p1)

    release_print(self, p1)

end
```

### 打开NPC大窗口

openmerchantbigdlg

| 参数   | 类型 | 空  | 默认 | 注释                        |
| ------ | ---- | --- | ---- | --------------------------- |
| path   | str  | 否  |      | 路径                        |
| pos    | int  | 否  |      | 显示位置                    |
| x      | int  | 否  |      | X坐标                       |
| y      | int  | 否  |      | Y坐标                       |
| height | int  | 否  |      | 高度                        |
| width  | int  | 否  |      | 宽度                        |
| bool   | int  | 否  |      | 是否显示关闭按钮            |
| closeX | int  | 否  |      | 关闭按钮X坐标               |
| closeY | int  | 否  |      | 关闭按钮Y坐标               |
| isMove | int  | 否  |      | 是否可以移动(0不移动 1移动) |

### 获取当前虚拟机id[npcid]

getsysindex

引擎64_23.12.07新增接口

| 参数   | 类型    | 空  | 默认 | 注释                                                                                             |
| ------ | ------- | --- | ---- | ------------------------------------------------------------------------------------------------ |
| result | integer | 否  |      | npcID（NPC配置表中的ID） 特殊npcid:QF=999999999,QM=999999996,LuaCond=999999995,LuaFunc=999999994 |
