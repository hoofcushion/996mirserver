---@meta GUIASL
GUI = {}; SL = {}; UIOperator = {}; GUIFunction = {};


---创建窗口控件
---*  ID : 控件ID
---*  PosX : 控件位置的横坐标
---*  PosY : 控件位置的纵坐标
---*  Width : 控件的宽
---*  Height : 控件的高
---*  Main : 是否隐藏主界面
---*  Last : 是否隐藏上一个界面
---*  NeedVoice : 是否点击时有音效
---*  EscClose : 是否esc关闭(客户端)
---*  isRevmsg : 是否pc鼠标经过吞噬，默认true
---*  npcID : 绑定npcid
---@param ID string|integer
---@param PosX number
---@param PosY number
---@param Width number
---@param Height number
---@param Main? boolean
---@param Last? boolean
---@param NeedVoice? boolean
---@param EscClose? boolean
---@param isRevmsg? boolean
---@param npcID? number
---@param param? number
---@return userdata
function GUI:Win_Create(ID, PosX, PosY, Width, Height, Main, Last, NeedVoice, EscClose, isRevmsg, npcID, param) end

---创建图片控件
---*  Parent : 父控件对象
---*  ID : 控件ID
---*  PosX :控件位置的横坐标
---*  PosY : 控件位置的纵坐标
---*  nimg : 图片路径
---@param Parent userdata|integer
---@param ID string|integer
---@param PosX number
---@param PosY number
---@param nimg string
---@return userdata
function GUI:Image_Create(Parent, ID, PosX, PosY, nimg) end

---创建按钮控件
---* Parent   父控件对象
---* ID   控件ID
---* X     控件位置的横坐标
---* Y     控件位置的纵坐标
---* nimg     图片路径
---@param Parent  userdata
---@param ID  string
---@param X    number
---@param Y    number
---@param nimg    string
---@return userdata
function GUI:Button_Create(Parent, ID, X, Y, nimg) end;

---创建文本控件
---* Parent   父控件对象
---* ID   控件ID
---* X     控件位置的横坐标
---* Y     控件位置的纵坐标
---* fontSize     字体大小
---* fontColor     字体颜色
---* str     文本
---@param Parent  userdata
---@param ID  string
---@param X    number
---@param Y    number
---@param fontSize    number
---@param fontColor    string
---@param str    string
---@return userdata
function GUI:Text_Create(Parent, ID, X, Y, fontSize, fontColor, str) end;

---创建Bmp文本
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* fontColor   字体颜色,支持传空
---* str         文本
---* fontPath    字体文件路径, 例：`fonts/stfont.fnt`
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param fontColor   string
---@param str         string
---@param fontPath    string
---@return userdata
function GUI:BmpText_Create(parent, ID, x, y, fontColor, str, fontPath) end;

---创建艺术字文本
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* stringValue    文本内容
---* charMapFile    艺术字路径
---* itemWidth      单个字体宽度
---* itemHeight     单个字体高度
---* startCharMap   起始字符设置(&quot;/&quot;)
---* sheet		    字体内容(H5专属)<br>比如图片文字是“+-0123456789”,那这个sheet的值就是&quot;+-0123456789&quot;
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param stringValue    string
---@param charMapFile    string
---@param itemWidth      number
---@param itemHeight     number
---@param startCharMap   string
---@param sheet		    string
---@return userdata
function GUI:TextAtlas_Create(parent, ID, x, y, stringValue, charMapFile, itemWidth, itemHeight, startCharMap, sheet) end;

---创建富文本控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  str : 文本内容
---*  width : 富文本控件宽度
---*  Size : 字体大小
---*  Color : 颜色
---*  vspace : 富文本行间距
---*  hyperlinkCB : 超链回调函数
---@param parent userdata|integer
---@param ID string|integer
---@param x number
---@param y number
---@param str string
---@param width? number
---@param Size? number
---@param Color? string
---@param vspace? number
---@param hyperlinkCB? function
---@return userdata
function GUI:RichText_Create(parent, ID, x, y, str, width, Size, Color, vspace, hyperlinkCB) end

---创建原始富文本
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  str : 文本内容
---*  width : 富文本控件宽度
---*  Size : 字体大小
---*  Color : 颜色
---*  vspace : 富文本行间距
---*  hyperlinkCB : 超链回调函数
---*  fontPath : 字体文件路径
---*  outlineParam : 描边参数 outline: 描边大小 outlineColor: 描边颜色
---@param parent userdata|integer
---@param ID string|integer
---@param x number
---@param y number
---@param str string
---@param width number
---@param Size? number
---@param Color? string
---@param vspace? number
---@param hyperlinkCB? function
---@param fontPath? string
---@param outlineParam? table
---@return userdata
function GUI:RichTextFCOLOR_Create(parent, ID, x, y, str, width, Size, Color, vspace, hyperlinkCB, fontPath, outlineParam) end

---创建自定义组合富文本
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* width       富文本控件最大宽度
---* vspace      富文本行间距
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param width       number
---@param vspace      number
---@return userdata
function GUI:RichTextCombine_Create(parent, ID, x, y, width, vspace) end;

---创建自定义组合富文本cell
---* parent      父节点对象 [RichTextCombine]
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* type        cell类型 <br> 文本类型：1或TEXT<br>节点类型：2或NODE<br>换行类型：3 或 NEWLINE
---* param       额外参数, 参考如下:
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param type        number
---@param param       table
---@return userdata
function GUI:RichTextCombineCell_Create(parent, ID, x, y, type, param) end;

---创建滚动文本
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* width       文本宽度
---* fontSize    字体大小
---* fontColor   字体颜色
---* str         文本内容
---* scrollTime  滚动时长 (秒)
---* fontPath	 字体文件路径
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param width       number
---@param fontSize    number
---@param fontColor   number
---@param str         string
---@param scrollTime?  number
---@param fontPath?	 string
---@return userdata
function GUI:ScrollText_Create(parent, ID, x, y, width, fontSize, fontColor, str, scrollTime, fontPath) end;

---创建节点
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@return userdata
function GUI:Node_Create(parent, ID, x, y) end;

---创建Widget
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* width       宽
---* height      高
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param width?       number
---@param height?      number
---@return userdata
function GUI:Widget_Create(parent, ID, x, y, width, height) end;

---创建物品框
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* setData     配置数据
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param setData     table
---@return userdata
function GUI:ItemShow_Create(parent, ID, x, y, setData) end;

---创建物品放入框
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* img         放置框底图资源路径
---* boxindex    放置框 唯一ID
---* stdmode     允许传入的StdMode (&quot;*&quot;: 所有 、单个用number 、多个用table)
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param img         string
---@param boxindex    number
---@param stdmode     string/number/table
---@return userdata
function GUI:ItemBox_Create(parent, ID, x, y, img, boxindex, stdmode) end;

---创建复选框
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* nimg        正常图片路径
---* pimg        选中图片路径
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param nimg        string
---@param pimg        string
---@return userdata
function GUI:CheckBox_Create(parent, ID, x, y, nimg, pimg) end;

---创建输入框
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* width       宽度
---* height      高度
---* fontSize    字体大小
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param width       number
---@param height      number
---@param fontSize    number
---@return userdata
function GUI:TextInput_Create(parent, ID, x, y, width, height, fontSize) end;

---创建滚动条
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* barimg      滚动条背景图片
---* pbarimg     滚动条图片
---* nimg        滚动条拖动块图片
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param barimg      string
---@param pbarimg     string
---@param nimg        string
---@return userdata
function GUI:Slider_Create(parent, ID, x, y, barimg, pbarimg, nimg) end;

---创建圆形进度条
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* img         图片路径
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param img         string
---@return userdata
function GUI:ProgressTimer_Create(parent, ID, x, y, img) end;

---创建进度条
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* nimg        图片路径
---* direction   方向：<br>0 从左到右<br>1 从右到左
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param nimg        string
---@param direction   number
---@return userdata
function GUI:LoadingBar_Create(parent, ID, x, y, nimg, direction) end;

---创建特效控件
---*  parent : 父控件对象
---*  ID : 控件ID
---*  x :控件位置的横坐标
---*  y : 控件位置的纵坐标
---*  effecttype : 特效类型 0:特效、1:NPC、2:怪物、3:技能、4:人物、5:武器、6:翅膀、7:发型
---*  effectid : 	特效ID
---*  sex : 性别(0 男 1 女)
---*  act : 特效动作 0.待机 1.走 2.攻击 3.施法 4.死亡 5.跑步
---*  dir : 特效方向
---*  speed : 播放速度
---@param parent userdata|integer
---@param ID string|integer
---@param x number
---@param y number
---@param effecttype number
---@param effectid number
---@param sex? number
---@param act? number
---@param dir? number
---@param speed? number
---@return userdata
function GUI:Effect_Create(parent, ID, x, y, effecttype, effectid, sex, act, dir, speed) end

---创建一个角色静态模型
---*  _parent : 父控件对象
---*  _ID : 控件ID
---*  _PosX : 控件位置的横坐标
---*  _PosY : 控件位置的纵坐标
---*  sex : 性别 0 男性 1 女性
---*  feature : 模型属性
---*  scale : 缩放比例(0-1)
---*  useStaticScale : 缩放比例(0-1)
---*  job : 缩放比例(0-1)
---*  ext_param : 缩放比例(0-1)
---@param _parent userdata|integer
---@param _ID string
---@param _PosX number
---@param _PosY number
---@param sex number
---@param feature table
---@param scale? number
---@param useStaticScale? boolean
---@param job? number
---@param ext_param? table
---@return userdata
function GUI:UIModel_Create(_parent, _ID, _PosX, _PosY, sex, feature, scale, useStaticScale, job, ext_param) end

---创建层容器
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* width       宽度
---* height      长度
---* isClip      是否裁切
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param width       number
---@param height      number
---@param isClip?      boolean
---@return userdata
function GUI:Layout_Create(parent, ID, x, y, width, height, isClip) end;

---创建列表容器
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* width       容器宽度
---* height      容器高度
---* direction   1：垂直; 2：水平
---* cellWid	 单个cell 宽
---* cellHei	 单个cell 高
---* num		 需创建cell个数
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param width       number
---@param height      number
---@param direction   number
---@param cellWid	 number
---@param cellHei	 number
---@param num		 number
---@return userdata
function GUI:TableView_Create(parent, ID, x, y, width, height, direction, cellWid, cellHei, num) end;

---创建滚动容器
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* width       宽度
---* height      高度
---* direction   1：垂直; 2：水平
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param width       number
---@param height      number
---@param direction   number
---@return userdata
function GUI:ScrollView_Create(parent, ID, x, y, width, height, direction) end;

---创建翻页容器
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* width       宽度
---* height      高度
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param width       number
---@param height      number
---@return userdata
function GUI:PageView_Create(parent, ID, x, y, width, height, direction) end;

---创建滚动容器子节点
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* w           宽度
---* h           高度
---* createCB    创建子节点内容回调 [函数返回 widget]
---* activeCB	 判断是否需要激活/创建 [函数返回 boolean值]
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param w           number
---@param h           number
---@param createCB    function
---@param activeCB?	 function
---@param data?	     table
---@return userdata
function GUI:QuickCell_Create(parent, ID, x, y, w, h, createCB, activeCB, data) end;

---创建序列帧动画
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* prefix      前缀
---* suffix      后缀
---* beginframe  起始帧, 默认1
---* finishframe 结束帧
---* ext         附加参数, {speed = 播放速度(毫秒), count = 图片数量, loop = 播放次数(-1: 循环), finishhide = 播放结束是否隐藏(1: 隐藏)}
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param prefix      string
---@param suffix      string
---@param beginframe  number
---@param finishframe number
---@param ext         table
---@return userdata
function GUI:Frames_Create(parent, ID, x, y, prefix, suffix, beginframe, finishframe, ext) end;

---创建粒子特效
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* res         粒子特效资源路径 plist文件
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param res         string
---@return userdata
function GUI:ParticleEffect_Create(parent, ID, x, y, res) end;

---创建Spine动画
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* jsonPath    json文件路径
---* atlasPath   atlas文件路径
---* trackIndex  索引值
---* name        动画名
---* loop        动画是否循环
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param jsonPath    string
---@param atlasPath   string
---@param trackIndex  number
---@param name        string
---@param loop        boolean
---@return userdata
function GUI:SpineAnim_Create(parent, ID, x, y, jsonPath, atlasPath, trackIndex, name, loop) end;

---创建拖拽容器
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* width       宽
---* height      高
---* from     	 控件来自(界面位置)  官方默认的可参照元变量 ITEMFROMUI_ENUM, <br>自定义类型的示例 : <br>`SL:GetMetaValue(ITEMFROMUI_ENUM).xxx` <br>[xxx: 自定义类型名]
---* ext		 额外参数<br>beginMoveCB : 开始移动回调 <br>endMoveCB : 结束移动回调<br>cancelMoveCB : 取消移动回调 <br>equipPos: 放置装备的装备位置【来源 <br>`SL:GetMetaValue(ITEMFROMUI_ENUM).PALYER_EQUIP` 时生效】<br>pcDoubleCB : pc双击回调 <br> mouseScrollCB: 鼠标滚轮回调
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param width       number
---@param height      number
---@param from     	 number
---@param ext		 table
---@return userdata
function GUI:MoveWidget_Create(parent, ID, x, y, width, height, from, ext) end;

---创建刮图
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* showImg     展示图片资源
---* maskImg     遮罩图片资源
---* clearHei 	 刮除高度, 默认16
---* moveTime	 刮除时间, 单位: 秒
---* beginTime   开始点击到结束触发间隔, 单位: 秒
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param showImg     string
---@param maskImg     string
---@param clearHei 	 number
---@param moveTime	 number
---@param beginTime   number
---@return userdata
function GUI:ScrapePic_Create(parent, ID, x, y, showImg, maskImg, clearHei, moveTime, beginTime, callback) end;

---创建旋转容器
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* width       宽度
---* height      高度
---* scrollGap   滑动间隙, 默认100
---* param       子节点参数, 参考如下
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param width       number
---@param height      number
---@param scrollGap   number
---@param param       table
---@return userdata
function GUI:RotateView_Create(parent, ID, x, y, width, height, scrollGap, param) end;

---创建装备框
---* parent      父节点对象
---* ID          唯一ID
---* x           位置 横坐标
---* y           位置 纵坐标
---* pos    	 装备装戴位置
---* isHero		 是否英雄装备
---* data		 额外参数
---@param parent      userdata|integer
---@param ID          string
---@param x           number
---@param y           number
---@param pos    	 number
---@param isHero		 boolean
---@param data		 table
---@return userdata
function GUI:EquipShow_Create(parent, ID, x, y, pos, isHero, data) end;

---获取界面控件
---* Parent   父控件对象
---* ID   控件ID
---@param parent  userdata
---@param ID  string
function GUI:GetWindow(parent, ID) end;

---获取控件自定义参数
---* widget   界面对象
---@param widget  userdata
function GUI:Win_GetParam(widget) end;

---获取按钮文字
---* widget      按钮对象
---@param widget      userdata
---@return string 按钮文字
function GUI:Button_getTitleText(widget) end;

---获取文本
---* widget    对象
---@param widget    userdata
---@return string 文本内容
function GUI:Text_getString(widget) end;

---获取艺术字文本
---* widget      艺术字对象
---@param widget      userdata
---@return string 艺术字文本内容
function GUI:TextAtlas_getString(widget) end;

---获取滚动文本内容
---* widget      滚动文本对象
---@param widget      userdata
---@return string 滚动文本内容
function GUI:ScrollText_getString(widget) end;

---获取对应ID放置框的物品数据
---* widget      物品放入框控件对象
---* boxindex    放置框 唯一ID
---@param widget      userdata
---@param boxindex    number
---@return table 放置框的物品数据
function GUI:ItemBox_GetItemData(widget, boxindex) end;

---获取复选框是否选中
---* widget      复选框对象
---@param widget      userdata
---@return boolean true(选中)/false(未选中)
function GUI:CheckBox_isSelected(widget) end;

---获取输入框文本
---* widget      输入框对象
---@param widget      userdata
---@return string 输入框文本
function GUI:TextInput_getString(widget) end;

---获得滚动条进度
---* widget      滚动条对象
---@param widget      userdata
---@return number 滚动条进度
function GUI:Slider_getPercent(widget) end;

---获取圆形进度条百分比
---* widget      控件对象
---@param widget      userdata
---@return number 圆形进度条百分比
function GUI:ProgressTimer_getPercentage(widget) end;

---获取进度条进度
---* widget      进度条对象
---@param widget      userdata
---@return number 进度条进度
function GUI:LoadingBar_getPercent(widget) end;

---获取进度条颜色
---* widget      进度条对象
---@param widget      userdata
---@return string 进度条颜色值
function GUI:LoadingBar_getColor(widget) end;

---获取层背景图片文件路径
---* widget      层对象
---@param widget      userdata
---@return string 背景图片路径
function GUI:Layout_getBackGroundImageFile(widget) end;

---获取列表容器间隔
---* widget    容器对象
---@param widget    userdata
---@return number 间隔距离(像素)
function GUI:ListView_getItemsMargin(widget) end;

---获取列表容器最顶部可见范围子节点
---* widget    容器对象
---@param widget    userdata
---@return userdata
function GUI:ListView_getTopmostItemInCurrentView(widget) end;

---获取列表容器最底部部可见范围子节点
---* widget    容器对象
---@param widget    userdata
---@return userdata 底部范围子节点对象
function GUI:ListView_getBottommostItemInCurrentView(widget) end;

---获取子节点序列号
---* widget    容器对象
---* value    子节点对象
---@param widget    userdata
---@param value    userdata
---@return number 子节点序列号
function GUI:ListView_getItemIndex(widget, value) end;

---通过子节点序列号获取子节点对象
---* widget    容器对象
---* value    子节点序列号
---@param widget    userdata
---@param value    number
---@return userdata 子控件对象
function GUI:ListView_getItemByIndex(widget, value) end;

---获取列表容器所有子节点对象
---* widget    容器对象
---@param widget    userdata
---@return table 所有子节点对象
function GUI:ListView_getItems(widget) end;

---获取列表容器所有子节点数量
---* widget    容器对象
---@param widget    userdata
---@return number 子节点总数量
function GUI:ListView_getItemCount(widget) end;

---获取列表容器滚动范围大小
---* widget    容器对象
---@param widget    userdata
---@return table 列表容器滚动范围大小
function GUI:ListView_getInnerContainerSize(widget) end;

---获取列表容器内部滚动区域坐标
---* widget    容器对象
---@param widget    userdata
---@return table 列表容器内部滚动区域坐标
function GUI:ListView_getInnerContainerPosition(widget) end;

---获取滚动容器滚动范围大小
---* widget      容器对象
---@param widget      userdata
---@return table 滚动容器滚动范围大小
function GUI:ScrollView_getInnerContainerSize(widget) end;

---获取容器内部滚动区域坐标
---* widget      容器对象
---@param widget      userdata
---@return table 容器内部滚动区域坐标
function GUI:ScrollView_getInnerContainerPosition(widget) end;

---获取当前子页面序列号
---* widget      容器对象
---@param widget      userdata
---@return number 子页面序列号
function GUI:PageView_getCurrentPageIndex(widget) end;

---获取翻页容器子页面
---* widget      容器对象
---@param widget      userdata
---@return table 子页面对象
function GUI:PageView_getItems(widget) end;

---获取翻页容器子页面数量
---* widget      容器对象
---@param widget      userdata
---@return number 子页面数量
function GUI:PageView_getItemCount(widget) end;

---通过标记获取动作内容
---* widget      控件对象
---* tag         动作标记
---@param widget      userdata
---@param tag         number
---@return userdata
function GUI:getActionByTag(widget, tag) end;

---获取列表容器内部区域偏移位置
---* widget      tableView对象
---@param widget      userdata
function GUI:TableView_getContentOffset(widget) end;

---获取容器cell的下标/序列号
---* widget      tableViewCell对象
---@param cell      userdata
---@return number cell下标
function GUI:TableViewCell_getIdx(cell) end;

---获取对应下标item添加的子节点
---* widget      旋转容器对象
---* index       对应下标
---@param widget      userdata
---@param index       number
---@return userdata
function GUI:RotateView_getChildByIndex(widget, index) end;

---获取对应下标item
---* widget      旋转容器对象
---* index       对应下标
---@param widget      userdata
---@param index       number
---@return userdata 对应下标item
function GUI:RotateView_getItemByIndex(widget, index) end;

---获取父节点的快捷子控件组
---* parent      父节点
---@param parent      userdata|integer
---@return table  [key 为控件名] 父节点的快捷子控件组
function GUI:ui_delegate(parent) end;

---屏蔽自动修复坐标为整数
function GUI:DisableFixPosition() end;

---获取主界面左上挂接点
---@return userdata 主界面左上挂接点
function GUI:Attach_LeftTop() end;

---获取主界面右上挂接点
---@return userdata 主界面右上挂接点
function GUI:Attach_RightTop() end;

---获取主界面左下挂接点
---@return userdata 主界面左下挂接点
function GUI:Attach_LeftBottom() end;

---获取主界面右下挂接点
---@return userdata 主界面右下挂接点
function GUI:Attach_RightBottom() end;

---获取最上层UI挂接点
---@return userdata 最上层UI挂接点
function GUI:Attach_UITop() end;

---获取上层场景挂接点
---@return userdata 上层场景挂接点
function GUI:Attach_SceneF() end;

---获取下层场景挂接点
---@return userdata 下层场景挂接点
function GUI:Attach_SceneB() end;

---获取主界面最底层左上挂接点
---@return userdata 主界面最底层左上挂接点
function GUI:Attach_LeftTop_B() end;

---获取主界面最底层右上挂接点
---@return userdata 主界面最底层右上挂接点
function GUI:Attach_RightTop_B() end;

---获取主界面最底层左下挂接点
---@return userdata 主界面最底层左下挂接点
function GUI:Attach_Parent() end;

---获取主界面最底层右下挂接点
---@return userdata 主界面最底层右下挂接点
function GUI:Attach_RightBottom_B() end;

---获取主界面最顶层左上挂接点
---@return userdata 主界面最顶层左上挂接点
function GUI:Attach_LeftTop_T() end;

---获取主界面最顶层右上挂接点
---@return userdata 主界面最顶层右上挂接点
function GUI:Attach_RightTop_T() end;

---获取主界面最顶层左下挂接点
---@return userdata 主界面最顶层左下挂接点
function GUI:Attach_LeftBottom_T() end;

---获取主界面最顶层右下挂接点
---@return userdata 主界面最顶层右下挂接点
function GUI:Attach_RightBottom_T() end;

---获取自带父节点 [挂接点ID: 101-111]
---* ID      挂接点ID
---@param ID      number
---@return userdata 自带父节点
function GUI:Win_FindParent(ID) end;

---获取坐标
---* widget    控件对象
---@param widget    userdata
---@return table 控件坐标
function GUI:getPosition(widget) end;

---获取横坐标
---* widget    控件对象
---@param widget    userdata
---@return number 横坐标
function GUI:getPositionX(widget) end;

---获取纵坐标
---* widget    控件对象
---@param widget    userdata
---@return number 纵坐标
function GUI:getPositionY(widget) end;

---获取控件锚点
---* widget   控件对象
---@param widget   userdata
---@return table 控件锚点
function GUI:getAnchorPoint(widget) end;

---获取控件尺寸大小(纹理大小 不考虑缩放)
---* widget    控件对象
---@param widget    userdata
---@return table {height = height, width = width}
function GUI:getContentSize(widget) end;

---获取控件尺寸大小(考虑缩放的真实大小)
---* widget    控件对象
---@param widget    userdata
---@return table {height = height, width = width}
function GUI:getBoundingBox(widget) end;

---获取控件标签
---* widget      控件对象
---@param widget      userdata
---@return number 标签
function GUI:getTag(widget) end;

---获取控件旋转角度
---* widget    控件对象
---@param widget    userdata
---@return number 控件旋转角度
function getRotation(widget) end;

---获取控件是否显示状态
---* widget    控件对象
---@param widget    userdata
---@return boolean 控件是否显示
function GUI:getVisible(widget) end;

---获取控件Y轴方向缩放比例
---* widget    控件对象
---@param widget    userdata
---@return number 控件Y轴方向缩放比例
function GUI:getScaleY(widget) end;

---获取是否水平翻转
---* widget    控件对象
---@param widget    userdata
---@return boolean 是否水平翻转
function GUI:getFlippedX(widget) end;

---获取是否垂直翻转
---* widget    控件对象
---@param widget    userdata
---@return boolean 是否垂直翻转
function GUI:getFlippedY(widget) end;

---获得控件世界坐标
---* widget    控件对象
---@param widget    userdata
---@return table 控件世界坐标
function GUI:getWorldPosition(widget) end;

---获取控件是否可以触摸
---* widget    控件对象
---@param widget    userdata
---@return boolean 是否可触摸
function GUI:getTouchEnabled(widget) end;

---获取父节点
---* widget    子控件对象
---@param widget    userdata
---@return userdata 父节点
function GUI:getParent(widget) end;

---获取控件所有子节点
---* widget    父控件对象
---@param widget    userdata
---@return table 控件所有子节点
function GUI:getChildren(widget) end;

---获取控件名字
---* widget    控件对象
---@param widget    userdata
---@return string 控件名字
function GUI:getName(widget) end;

---通过控件名字获取子节点
---* widget    父控件对象
---* name     控件名字
---@param widget    userdata
---@param name     string
---@return userdata
function GUI:getChildByName(widget, name) end;

---通过控件标记获取子节点
---* widget    父控件对象
---* tag     控件标记
---@param widget    userdata
---@param tag     number
---@return userdata
function GUI:getChildByTag(widget, tag) end;

---获取控件触摸开始时位置
---* widget    控件对象
---@param widget    userdata
---@return table 触摸开始时位置{x = x, y = y}
function GUI:getTouchBeganPosition(widget) end;

---获取控件触摸移动时位置
---* widget    控件对象
---@param widget    userdata
---@return table 控件触摸移动时位置{x = x, y = y}
function GUI:getTouchMovePosition(widget) end;

---获取控件触摸结束时位置
---* widget    控件对象
---@param widget    userdata
---@return table 控件触摸结束时位置{x = x, y = y}
function GUI:getTouchEndPosition(widget) end;

---获取控件是否触摸吞噬
---* widget    控件对象
---@param widget    userdata
---@return boolean 是否触摸吞噬
function GUI:getSwallowTouches(widget) end;

---检查触摸位置是否被父节点裁剪
---* widget    控件对象
---* position   世界坐标
---@param widget    userdata
---@param position   table
---@return boolean 触摸位置是否被父节点裁剪
function GUI:isClippingParentContainsPoint(widget, position) end;

---设置控件自定义参数
---* widget   界面对象
---* param 参数内容
---@param widget   userdata
---@param param boolean
function GUI:Win_SetParam(widget, param) end;

---设置界面拖拽
---* widget   界面对象
---* dragLayer 拖拽区域控件
---@param widget   userdata
---@param dragLayer userdata
function GUI:Win_SetDrag(widget, dragLayer) end;

---设置主界面隐藏
---* widget      界面对象
---* value       是否隐藏, 普通面板生效
---@param widget      userdata
---@param value       boolean
function GUI:Win_SetMainHide(widget, value) end;

---设置界面绑定NPC
---* widget      界面对象
---* npcID       NPCID
---@param widget      userdata
---@param npcID       number
function GUI:Win_BindNPC(widget, npcID) end;

---设置界面浮起
---* widget      界面对象
---* zPanel      控件对象
---@param widget      userdata
---@param zPanel      userdata
function GUI:Win_SetZPanel(widget, zPanel) end;

---设置界面绑定事件
---* widget      界面对象
---* eventID     事件ID
---* eventTag    事件描述
---@param widget      userdata
---@param eventID     string
---@param eventTag    string
function GUI:Win_BindLuaEvent(widget, eventID, eventTag) end;

---设置界面内鼠标右键吞噬
---* widget      界面对象
---* state       是否吞噬
---@param widget      userdata
---@param state       boolean
function GUI:Win_SetSwallowRightMouseTouch(widget, state) end;

---设置图片九宫格
---* widget      图片对象
---* scale9l     左边比例
---* scale9r     右边比例
---* scale9t     上边比例
---* scale9b     下边比例
---@param widget      userdata
---@param scale9l     number
---@param scale9r     number
---@param scale9t     number
---@param scale9b     number
function GUI:Image_setScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end;

---设置图片是否变灰
---* widget      图片对象
---* isGrey      是否置灰
---@param widget      userdata
---@param isGrey      boolean
function GUI:Image_setGrey(widget, isGrey) end;

---设置按钮状态图片
---* widget                     按钮对象
---* Normalfilepath             正常状态图片路径
---* Pressedfilepath            按压状态图片路径
---* Disabledfilepath           禁用状态图片路径
---* TextureType                加载类型：<br>0 图片<br>1 图片集 plist文件
---@param widget                     userdata
---@param Normalfilepath             string
---@param Pressedfilepath            string
---@param Disabledfilepath           string
---@param TextureType                number
function GUI:Button_loadTextures(widget, Normalfilepath, Pressedfilepath, Disabledfilepath, TextureType) end;

---设置正常状态图片
---* widget      按钮对象
---* filepath    图片路径
---@param widget      userdata
---@param filepath    string
function GUI:Button_loadTextureNormal(widget, filepath) end;

---设置按下状态图片
---* widget      按钮对象
---* filepath    图片路径
---@param widget      userdata
---@param filepath    string
function GUI:Button_loadTexturePressed(widget, filepath) end;

---设置禁用状态图片
---* widget      按钮对象
---* filepath    图片路径
---@param widget      userdata
---@param filepath    string
function GUI:Button_loadTextureDisabled(widget, filepath) end;

---设置按钮文字
---* widget      按钮对象
---* value       按钮显示文本
---@param widget      userdata
---@param value       string
function GUI:Button_setTitleText(widget, value) end;

---设置按钮文字颜色
---* widget      按钮对象
---* value       色值（#000000）
---@param widget      userdata
---@param value       string
function GUI:Button_setTitleColor(widget, value) end;

---设置按钮文字大小
---* widget      按钮对象
---* value       字体大小（字号16）
---@param widget      userdata
---@param value       number
function GUI:Button_setTitleFontSize(widget, value) end;

---设置按钮文字样式
---* widget      按钮对象
---* value       字体样式（font.ttf）
---@param widget      userdata
---@param value       string
function GUI:Button_setTitleFontName(widget, value) end;

---设置按钮文本最大宽度
---* widget      按钮对象
---* value       文本最大宽度
---@param widget      userdata
---@param value       number
function GUI:Button_setMaxLineWidth(widget, value) end;

---设置按钮文本加描边
---* widget      按钮对象
---* color       描边色值（#000000）
---* outline     描边大小
---@param widget      userdata
---@param color       string
---@param outline     number
function GUI:Button_titleEnableOutline(widget, color, outline) end;

---取消按钮文本描边
---* widget      按钮对象
---@param widget      userdata
function GUI:Button_titleDisableOutLine(widget) end;

---设置按钮是否禁用(可触摸)
---* widget      按钮对象
---* value       是否禁用（可触摸）
---@param widget      userdata
---@param value       boolean
function GUI:Button_setBright(widget, value) end;

---设置按钮是否禁用(不可触摸)
---* widget      按钮对象
---* value       是否禁用（不可触摸）
---@param widget      userdata
---@param value       boolean
function GUI:Button_setBrightEx(widget, value) end;

---设置按钮当前状态
---* widget      按钮对象
---* value       状态（0正常 1按下）
---@param widget      userdata
---@param value       number
function GUI:Button_setBrightStyle(widget, value) end;

---设置按钮是否灰态
---* widget      按钮对象
---* value       是否灰态
---@param widget      userdata
---@param value       boolean
function GUI:Button_setGrey(widget, value) end;

---设置按钮九宫格
---* widget      按钮对象
---* scale9l     左边比例
---* scale9r     右边比例
---* scale9t     上边比例
---* scale9b     下边比例
---@param widget      userdata
---@param scale9l     number
---@param scale9r     number
---@param scale9t     number
---@param scale9b     number
function GUI:Button_setScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end;

---设置文本
---* widget    对象
---* value    文本
---@param widget    userdata
---@param value    string|integer
function GUI:Text_setString(widget, value) end;

---设置文本颜色
---* widget    对象
---* value    色值(&quot;#000000&quot;)
---@param widget    userdata
---@param value    string
function GUI:Text_setTextColor(widget, value) end;

---设置字体大小
---* widget    对象
---* value    字体大小
---@param widget    userdata
---@param value    number
function GUI:Text_setFontSize(widget, value) end;

---设置字体路径
---* widget    对象
---* value    字体文件路径<br>例: &quot;fonts/font.ttf&quot;
---@param widget    userdata
---@param value    string
function GUI:Text_setFontName(widget, value) end;

---设置字体描边
---* widget    对象
---* color    色值(&quot;#000000&quot;)
---* size     描边宽度
---@param widget    userdata
---@param color    string
---@param size     number
function GUI:Text_enableOutline(widget, color, size) end;

---设置是否启用下划线
---* widget    文本对象
---@param widget    userdata
function GUI:Text_enableUnderline(widget) end;

---设置文本最大行宽
---* widget    对象
---* value    宽度
---@param widget    userdata
---@param value    number
function GUI:Text_setMaxLineWidth(widget, value) end;

---设置文本垂直对齐
---* widget    对象
---* value    0：顶对齐<br> 1：垂直居中<br>2：底对齐
---@param widget    userdata
---@param value    number
function GUI:Text_setTextVerticalAlignment(widget, value) end;

---设置文本水平对齐
---* widget    对象
---* value    0：顶对齐<br> 1：垂直居中<br>2：底对齐
---@param widget    userdata
---@param value    number
function GUI:Text_setTextHorizontalAlignment(widget, value) end;

---设置文本尺寸
---* widget    对象
---* value    {width = 0, height = 0}
---@param widget    userdata
---@param value    table
function GUI:Text_setTextAreaSize(widget, value) end;

---设置倒计时文本
---* widget    对象
---* time     倒计时时间, 单位:秒
---* callback   倒计时结束触发
---* showType   倒计时时间显示方式 <br>0: xx时xx分xx秒 <br>1: 小于1天显示xx:xx:xx 大于显示xx天xx时xx分
---@param widget    userdata
---@param time     number
---@param callback?   function
---@param showType?   number
function Text_COUNTDOWN(widget, time, callback, showType) end;

---设置艺术字配置
---* widget      艺术字对象
---* stringValue    文本内容
---* charMapFile    艺术字路径
---* itemWidth      字体宽度
---* itemHeight     字体高度
---* startCharMap   起始字符设置(&quot;/&quot;)
---* sheet		    字体内容(H5专属)<br>比如图片文字是“+-0123456789”,那这个sheet的值就是&quot;+-0123456789&quot;
---@param widget      userdata
---@param stringValue    string
---@param charMapFile    string
---@param itemWidth      number
---@param itemHeight     number
---@param startCharMap   string
---@param sheet		    string
function GUI:TextAtlas_setProperty(widget, stringValue, charMapFile, itemWidth, itemHeight, startCharMap, sheet) end;

---设置艺术字文本
---* widget      艺术字对象
---* value       文本内容
---@param widget      userdata
---@param value       string
function GUI:TextAtlas_setString(widget, value) end;

---设置富文本背景颜色
---* widget      控件对象
---* color       颜色值, 例: &quot;#000000&quot;
---@param widget      userdata
---@param color       string
function GUI:RichText_setBackgroundColor(widget, color) end;

---设置滚动文本内容
---* widget      滚动文本对象
---* value       文本内容
---@param widget      userdata
---@param value       string
function GUI:ScrollText_setString(widget, value) end;

---设置滚动文本描边
---* widget      滚动文本对象
---* color       描边色值(&quot;#000000&quot;)
---* size        描边大小
---@param widget      userdata
---@param color       string
---@param size        number
function GUI:ScrollText_enableOutline(widget, color, size) end;

---设置滚动文本水平对齐
---* widget      滚动文本对象
---* value       对齐方式：<br>1 左对齐<br>2 水平居中<br>3 右对齐
---@param widget      userdata
---@param value       number
function GUI:ScrollText_setHorizontalAlignment(widget, value) end;

---设置滚动文本颜色
---* widget      滚动文本对象
---* value       色值(&quot;#000000&quot;)
---@param widget      userdata
---@param value       string
function GUI:ScrollText_setTextColor(widget, value) end;

---设置物品框单击事件
---* widget      物品框对象
---* eventCB      单击事件函数
---@param widget      userdata
---@param eventCB      function
function GUI:ItemShow_addReplaceClickEvent(widget, eventCB) end;

---设置物品框双击事件
---* widget      物品框对象
---* eventCB      双击事件函数
---@param widget      userdata
---@param eventCB      function
function GUI:ItemShow_addDoubleEvent(widget, eventCB) end;

---设置物品框长按事件
---* widget      物品框对象
---* eventCB      长按事件函数
---@param widget      userdata
---@param eventCB      function
function GUI:ItemShow_addPressEvent(widget, eventCB) end;

---设置物品框是否置灰
---* widget      物品框对象
---* value       是否置灰
---@param widget      userdata
---@param value       boolean
function GUI:ItemShow_setIconGrey(widget, value) end;

---设置物品框是否选中
---* widget      物品框对象
---* value       是否选中
---@param widget      userdata
---@param value       boolean
function GUI:ItemShow_setItemShowChooseState(widget, value) end;

---设置物品框是否拖动
---* widget      物品框对象
---* value       是否拖动
---@param widget      userdata
---@param value       boolean
function GUI:ItemShow_setMoveEable(widget, value) end;

---更新物品框内容
---* widget      物品框对象
---* itemData    配置数据
---@param widget      userdata
---@param itemData    table
function GUI:ItemShow_updateItem(widget, itemData) end;

---设置物品框是否触摸吞噬
---* widget      物品框对象
---* value       是否触摸吞噬
---@param widget      userdata
---@param value       boolean
function GUI:ItemShow_setItemTouchSwallow(widget, value) end;

---设置复选框默认状态背景图片
---* widget      复选框对象
---* value       默认状态图片路径
---@param widget      userdata
---@param value       string
function GUI:CheckBox_loadTextureBackGround(widget, value) end;

---设置复选框选中状态背景图片
---* widget      复选框对象
---* value       选中状态图片路径
---@param widget      userdata
---@param value       string
function GUI:CheckBox_loadTextureFrontCross(widget, value) end;

---设置复选框禁用状态背景图片
---* widget      复选框对象
---* value       禁用状态图片路径
---@param widget      userdata
---@param value       string
function GUI:CheckBox_loadTextureFrontCrossDisabled(widget, value) end;

---设置复选框选中或取消
---* widget      复选框对象
---* value       选中或取消
---@param widget      userdata
---@param value       boolean
function GUI:CheckBox_setSelected(widget, value) end;

---设置输入框字体颜色
---* widget      输入框对象
---* value       色值(&quot;#000000&quot;)
---@param widget      userdata
---@param value       string
function GUI:TextInput_setFontColor(widget, value) end;

---设置输入框字体
---* widget      输入框对象
---* value       字体路径
---* value2      字号
---@param widget      userdata
---@param value       string
---@param value2      number
function GUI:TextInput_setFont(widget, value, value2) end;

---设置输入框字体大小
---* widget      输入框对象
---* value       字号
---@param widget      userdata
---@param value       number
function GUI:TextInput_setFontSize(widget, value) end;

---设置输入框占位文本字体
---* widget      输入框对象
---* value       字体路径
---* value2      字体(&quot;font.ttf&quot;)
---@param widget      userdata
---@param value       string
---@param value2      string
function GUI:TextInput_setPlaceholderFont(widget, value, value2) end;

---设置输入框占位文本字体颜色
---* widget      输入框对象
---* value       色值(&quot;#000000&quot;)
---@param widget      userdata
---@param value       string
function GUI:TextInput_setPlaceholderFontColor(widget, value) end;

---设置输入框占位文本字体大小
---* widget      输入框对象
---* value       字号
---@param widget      userdata
---@param value       number
function GUI:TextInput_setPlaceholderFontSize(widget, value) end;

---设置输入框占位文本
---* widget      输入框对象
---* value       输入内容
---@param widget      userdata
---@param value       string
function GUI:TextInput_setPlaceHolder(widget, value) end;

---设置输入框文本
---* widget      输入框对象
---* value       输入内容
---@param widget      userdata
---@param value       string|integer
function GUI:TextInput_setString(widget, value) end;

---设置输入框行宽
---* widget      输入框对象
---* value       输入框控件宽度
---@param widget      userdata
---@param value       number
function GUI:TextInput_setMaxLength(widget, value) end;

---设置输入框水平对齐
---* widget      输入框对象
---* value       对齐方式：<br>0 顶对齐<br> 1 底对齐<br>2 水平居中
---@param widget      userdata
---@param value       number
function GUI:TextInput_setTextHorizontalAlignment(widget, value) end;

---设置输入框文本类型
---* widget      输入框对象
---* value       类型
---@param widget      userdata
---@param value       number
function GUI:TextInput_setInputFlag(widget, value) end;

---设置输入框键盘编辑类型
---* widget      输入框对象
---* value       类型
---@param widget      userdata
---@param value       number
function GUI:TextInput_setInputMode(widget, value) end;

---设置输入框弹出式键盘返回类型
---* widget      输入框对象
---* value       类型
---@param widget      userdata
---@param value       number
function GUI:TextInput_setReturnType(widget, value) end;

---设置输入框监听事件
---* widget      输入框对象
---* eventCB     事件处理函数
---@param widget      userdata
---@param eventCB     function
function GUI:TextInput_addOnEvent(widget, eventCB) end;

---设置滚动条背景图
---* widget      滚动条对象
---* value       背景图路径
---@param widget      userdata
---@param value       string
function GUI:Slider_loadBarTexture(widget, value) end;

---设置滚动条图片
---* widget      滚动条对象
---* value       滚动条图片路径
---@param widget      userdata
---@param value       string
function GUI:Slider_loadProgressBarTexture(widget, value) end;

---设置滚动条拖动块普通图片
---* widget      滚动条对象
---* value       拖动块图片路径
---@param widget      userdata
---@param value       string
function GUI:Slider_loadSlidBallTextureNormal(widget, value) end;

---设置滚动条进度
---* widget      滚动条对象
---* value       滚动条进度(0-100)
---@param widget      userdata
---@param value       number
function GUI:Slider_setPercent(widget, value) end;

---设置滚动条最大进度值
---* widget      滚动条对象
---* value       滚动条最大进度值
---@param widget      userdata
---@param value       number
function GUI:Slider_setMaxPercent(widget, value) end;

---设置滚动条触摸事件
---* widget      滚动条对象
---* value       事件函数
---@param widget      userdata
---@param value       function
function GUI:Slider_addOnEvent(widget, value) end;

---设置圆形进度条百分比
---* widget      控件对象
---* value       进度(0-100)
---@param widget      userdata
---@param value       number
function GUI:ProgressTimer_setPercentage(widget, value) end;

---设置圆形进度条方向
---* widget      控件对象
---* value       true 顺时针<br>false 逆时针
---@param widget      userdata
---@param value       boolean
function GUI:ProgressTimer_setReverseDirection(widget, value) end;

---设置圆形进度条动作和回调函数
---* widget      控件对象
---* time        时间
---* to          结束进度(0-100)
---* completeCB  回调函数
---* tag         标记
---@param widget      userdata
---@param time        number
---@param to          number
---@param completeCB  function
---@param tag         number
function GUI:ProgressTimer_progressTo(widget, time, to, completeCB, tag) end;

---设置圆形进度条背景图
---* widget      控件对象
---* img         图片路径
---@param widget      userdata
---@param img         string
function GUI:ProgressTimer_ChangeImg(widget, img) end;

---设置进度条图片
---* widget      进度条对象
---* value       图片路径
---@param widget      userdata
---@param value       string
function GUI:LoadingBar_loadTexture(widget, value) end;

---设置进度条方向
---* widget      进度条对象
---* value       方向：<br>0 从左到右<br>1 从右到左
---@param widget      userdata
---@param value       number
function GUI:LoadingBar_setDirection(widget, value) end;

---设置进度条进度
---* widget      进度条对象
---* value       进度(0-100)
---@param widget      userdata
---@param value       number
function GUI:LoadingBar_setPercent(widget, value) end;

---设置进度条颜色
---* widget      进度条对象
---* value       色值(&quot;#000000&quot;)
---@param widget      userdata
---@param value       string
function GUI:LoadingBar_setColor(widget, value) end;

---设置特效播放完自动移除
---* widget      特效对象
---@param widget      userdata
function GUI:Effect_setAutoRemoveOnFinish(widget) end;

---界面弹窗特效1
---* widget    控件对象
---* timelineCB  回调函数
---@param widget    userdata
---@param timelineCB?  function
function GUI:Timeline_Window1(widget, timelineCB) end;

---界面弹窗特效2
---* widget    控件对象
---* timelineCB  回调函数
---@param widget    userdata
---@param timelineCB?  function
function GUI:Timeline_Window2(widget, timelineCB) end;

---界面弹窗特效3
---* widget    控件对象
---* timelineCB  回调函数
---@param widget    userdata
---@param timelineCB?  function
function GUI:Timeline_Window3(widget, timelineCB) end;

---界面弹窗特效4
---* widget    控件对象
---* timelineCB  回调函数
---@param widget    userdata
---@param timelineCB?  function
function GUI:Timeline_Window4(widget, timelineCB) end;

---界面弹窗特效5
---* widget    控件对象
---* timelineCB  回调函数
---@param widget    userdata
---@param timelineCB?  function
function GUI:Timeline_Window5(widget, timelineCB) end;

---界面弹窗特效6
---* widget    控件对象
---* timelineCB  回调函数
---@param widget    userdata
---@param timelineCB?  function
function GUI:Timeline_Window6(widget, timelineCB) end;

---设置动画标记
---* action    控件对象
---* tag     标记值
---@param action    userdata
---@param tag     number
function GUI:Timeline_SetTag(action, tag) end;

---停止所有动画
---* widget    控件对象
---@param widget    userdata
function GUI:Timeline_StopAll(widget) end;

---通过标记停止动画
---* widget    控件对象
---* tag     标记值
---@param widget    userdata
---@param tag     number
function GUI:Timeline_StopByTag(widget, tag) end;

---动画淡出效果
---* widget    控件对象
---* time     时间
---* timelineCB  回调函数
---@param widget    userdata
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_FadeOut(widget, time, timelineCB) end;

---动画淡入效果
---* widget    控件对象
---* time     时间
---* timelineCB  回调函数
---@param widget    userdata
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_FadeIn(widget, time, timelineCB) end;

---动画修改透明度到某个值
---* widget    控件对象
---* value    透明度(0-255)
---* time     时间
---* timelineCB  回调函数
---@param widget    userdata
---@param value    number
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_FadeTo(widget, value, time, timelineCB) end;

---动画放大缩小
---* widget    控件对象
---* value    缩放比例(0-100)
---* time     时间
---* timelineCB  回调函数
---@param widget    userdata
---@param value    number
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_ScaleTo(widget, value, time, timelineCB) end;

---动画放大缩小（当前大小的某个比例）
---* widget    控件对象
---* value    缩放比例(0-100)
---* time     时间
---* timelineCB  回调函数
---@param widget    userdata
---@param value    number
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_ScaleBy(widget, value, time, timelineCB) end;

---动画旋转
---* widget    控件对象
---* value    旋转角度(0-360)
---* time     时间
---* timelineCB  回调函数
---@param widget    userdata
---@param value    number
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_RotateTo(widget, value, time, timelineCB) end;

---动画旋转（从原来角度 旋转到 某个角度）
---* widget    控件对象
---* value    旋转角度(0-360)
---* time     时间
---* timelineCB  回调函数
---@param widget    userdata
---@param value    number
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_RotateBy(widget, widget, value, time, timelineCB) end;

---动画移动（相对位置）
---* widget    控件对象
---* value    {x = 0, y = 0}
---* time     时间
---* timelineCB  回调函数
---@param widget    userdata
---@param value    table
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_MoveTo(widget, value, time, timelineCB) end;

---动画闪烁
---* widget    控件对象
---* value    闪烁次数
---* time     时间
---* timelineCB  回调函数
---@param widget    userdata
---@param value    number
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_Blink(widget, value, time, timelineCB) end;

---动画震动
---* widget    控件对象
---* time     时间
---* x      X轴震动像素
---* y      Y轴震动像素
---* timelineCB  回调函数
---@param widget    userdata
---@param time     number
---@param x      number
---@param y      number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_Shake(widget, time, x, y, timelineCB) end;

---动画疯狂抖动
---* widget    控件对象
---* time     时间
---* angle    抖动幅度（0-360）
---@param widget    userdata
---@param time     number
---@param angle    number
function GUI:Timeline_Waggle(widget, time, angle) end;

---动画延迟播放
---* widget    控件对象
---* time     延迟时间
---* timelineCB  回调函数
---@param widget    userdata
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_DelayTime(widget, time, timelineCB) end;

---动画回调方法
---* widget    控件对象
---* time     延迟时间
---* timelineCB  回调函数
---@param widget    userdata
---@param time     number
---@param timelineCB?  function
---@return userdata
function GUI:Timeline_CallFunc(widget, time, timelineCB) end;

---动画延迟显示
---* widget    控件对象
---* time     延迟时间
---@param widget    userdata
---@param time     number
---@return userdata
function GUI:Timeline_Show(widget, time) end;

---动画延迟隐藏
---* widget    控件对象
---* time     延迟时间
---@param widget    userdata
---@param time     number
---@return userdata
function GUI:Timeline_Hide(widget, time) end;

---缓动动画（由慢到快）
---* widget    对象
---* value    目标坐标位置
---* time     动作时间
---* callback   动作执行完的回调
---@param widget    userdata
---@param value    table
---@param time     number
---@param callback   function
---@return userdata
function GUI:Timeline_EaseSineIn_MoveTo(widget, value, time, callback) end;

---缓动动画（由快到慢）
---* widget    对象
---* value    目标坐标位置
---* time     动作时间
---* callback   动作执行完的回调
---@param widget    userdata
---@param value    table
---@param time     number
---@param callback   function
---@return userdata
function GUI:Timeline_EaseSineOut_MoveTo(widget, value, time, callback) end;

---数字滚动动画
---* widget    对象 [ 仅限Button、Text控件、TextAtlas控件]
---* cur     当前数值
---* target    目标数值
---* interval   变动间隔（秒）
---@param widget    userdata
---@param cur     number
---@param target    number
---@param interval   number
function GUI:Timeline_DigitChange(widget, cur, target, interval) end;

---设置层背景颜色
---* widget      层对象
---* value       色值(&quot;#000000&quot;)<br> ! 渐变色需传参table `{&quot;#FF0000&quot;, &quot;#FFFFFF&quot;}`
---@param widget      userdata
---@param value       string
function GUI:Layout_setBackGroundColor(widget, value) end;

---设置层背景颜色类型
---* widget      层对象
---* value       类型(1单色，2渐变色)
---@param widget      userdata
---@param value       number
function GUI:Layout_setBackGroundColorType(widget, value) end;

---设置层背景颜色不透明度
---* widget      层对象
---* value       不透明度(0-255)
---@param widget      userdata
---@param value       number
function GUI:Layout_setBackGroundColorOpacity(widget, value) end;

---设置层背景是否裁切
---* widget      层对象
---* value       是否裁切
---@param widget      userdata
---@param value       boolean
function GUI:Layout_setClippingEnabled(widget, value) end;

---设置层背景图片
---* widget      层对象
---* value       图片路径
---@param widget      userdata
---@param value       string
function GUI:Layout_setBackGroundImage(widget, value) end;

---设置层背景图片九宫格
---* widget      层对象
---* scale9l     左边比例
---* scale9r     右边比例
---* scale9t     上边比例
---* scale9b     下边比例
---@param widget      userdata
---@param scale9l     number
---@param scale9r     number
---@param scale9t     number
---@param scale9b     number
function GUI:Layout_setBackGroundImageScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end;

---移除层背景图片设置
---* widget      层对象
---@param widget      userdata
function GUI:Layout_removeBackGroundImage(widget) end;

---设置列表容器对齐方式
---* widget    容器对象
---* value    0：左对齐<br>1：右对齐<br>2：水平居中<br>3：顶对齐<br>4：底对齐<br>5：垂直居中
---@param widget    userdata
---@param value    number
function GUI:ListView_setGravity(widget, value) end;

---设置列表容器滑动方向
---* widget    容器对象
---* value    1：垂直; 2：水平
---@param widget    userdata
---@param value    number
function GUI:ListView_setDirection(widget, value) end;

---设置列表容器间隔
---* widget    容器对象
---* value    间隔大小(50像素)
---@param widget    userdata
---@param value    number
function GUI:ListView_setItemsMargin(widget, value) end;

---设置列表容器是否有裁切
---* widget    容器对象
---* value    是否有裁切
---@param widget    userdata
---@param value    boolean
function GUI:ListView_setClippingEnabled(widget, value) end;

---设置列表容器背景颜色
---* widget      tableView对象
---* value		 十六进制颜色值 例: &quot;#FFFFFF&quot;
---@param widget      userdata
---@param value		 string
function GUI:TableView_setBackGroundColor(widget, value) end;

---设置列表容器背景颜色类型
---* widget    容器对象
---* value    1：单色，2：渐变色
---@param widget    userdata
---@param value    number
function GUI:ListView_setBackGroundColorType(widget, value) end;

---设置列表容器背景透明度
---* widget    容器对象
---* value    透明度(0-255)
---@param widget    userdata
---@param value    number
function GUI:ListView_setBackGroundColorOpacity(widget, value) end;

---设置列表容器背景图片
---* widget    容器对象
---* value    图片路径
---@param widget    userdata
---@param value    string
function GUI:ListView_setBackGroundImage(widget, value) end;

---设置列表容器背景图片九宫格
---* widget    容器对象
---* scale9l   左边比例
---* scale9r   右边比例
---* scale9t   上边比例
---* scale9b   下边比例
---@param widget    userdata
---@param scale9l   number
---@param scale9r   number
---@param scale9t   number
---@param scale9b   number
function GUI:ListView_setBackGroundImageScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end;

---设置列表容器滚动事件
---* widget    容器对象
---* eventCB   事件函数
---@param widget    userdata
---@param eventCB   function
function GUI:ListView_addOnScrollEvent(widget, eventCB) end;

---设置列表容器滚动到某百分比位置(垂直方向)
---* widget    容器对象
---* percent   百分比(0-100)
---* time     时间(秒)
---* bool     是否衰减滚动速度
---@param widget    userdata
---@param percent   number
---@param time     number
---@param bool     boolean
function GUI:ListView_scrollToPercentVertical(widget, percent, time, bool) end;

---设置列表容器滚动到某百分比位置(水平方向)
---* widget    容器对象
---* percent   百分比(0-100)
---* time     时间(秒)
---* bool     是否衰减滚动速度
---@param widget    userdata
---@param percent   number
---@param time     number
---@param bool     boolean
function GUI:ListView_scrollToPercentHorizontal(widget, percent, time, bool) end;

---添加鼠标滚轮滑动列表容器事件
---* widget    容器对象
---@param widget    userdata
function GUI:ListView_addMouseScrollPercent(widget) end;

---设置滚动容器滚动范围大小
---* widget      容器对象
---* value1      宽度 或 尺寸
---* value2      高度
---@param widget      userdata
---@param value1      number|table
---@param value2?      number
function GUI:ScrollView_setInnerContainerSize(widget, value1, value2) end;

---设置滚动容器滚动方向
---* widget      容器对象
---* value       1：垂直; 2：水平
---@param widget      userdata
---@param value       number
function GUI:ScrollView_setDirection(widget, value) end;

---设置滚动容器是否有回弹
---* widget      容器对象
---* value       是否有回弹
---@param widget      userdata
---@param value       boolean
function GUI:ScrollView_setBounceEnabled(widget, value) end;

---设置滚动容器是否有裁切
---* widget      容器对象
---* value       是否有裁切
---@param widget      userdata
---@param value       boolean
function GUI:ScrollView_setClippingEnabled(widget, value) end;

---设置滚动容器背景颜色
---* widget      容器对象
---* value       色值(&quot;#000000&quot;)<br> ! 渐变色需传参table `{&quot;#FF0000&quot;, &quot;#FFFFFF&quot;}`
---@param widget      userdata
---@param value       string
function GUI:ScrollView_setBackGroundColor(widget, value) end;

---设置滚动容器背景颜色类型
---* widget      容器对象
---* value       1：单色，2：渐变色
---@param widget      userdata
---@param value       number
function GUI:ScrollView_setBackGroundColorType(widget, value) end;

---设置滚动容器背景透明度
---* widget      容器对象
---* value       透明度(0-255)
---@param widget      userdata
---@param value       number
function GUI:ScrollView_setBackGroundOpacity(widget, value) end;

---设置滚动容器背景图片
---* widget      容器对象
---* value       图片路径
---@param widget      userdata
---@param value       string
function GUI:ScrollView_setBackGroundImage(widget, value) end;

---设置滚动器背景图片九宫格
---* widget      容器对象
---* scale9l     左边比例
---* scale9r     右边比例
---* scale9t     上边比例
---* scale9b     下边比例
---@param widget      userdata
---@param scale9l     number
---@param scale9r     number
---@param scale9t     number
---@param scale9b     number
function GUI:ScrollView_setBackGroundImageScale9Slice(widget, scale9l, scale9r, scale9t, scale9b) end;

---移除滚动容器背景图片设置
---* widget      容器对象
---@param widget      userdata
function GUI:ScrollView_removeBackGroundImage(widget) end;

---设置滚动容器滚动事件
---* widget      容器对象
---* eventCB     事件函数
---@param widget      userdata
---@param eventCB     function
function GUI:ScrollView_addOnScrollEvent(widget, eventCB) end;

---滚动容器加载子节点
---* widget      容器对象
---* value       子节点对象
---@param widget      userdata
---@param value       userdata
function GUI:ScrollView_addChild(widget, value) end;

---滚动容器删除所有子节点
---* widget      容器对象
---@param widget      userdata
function GUI:ScrollView_removeAllChildren(widget) end;

---滚动容器衰减滚动（顶部）
---* widget      容器对象
---* time        时间
---* boolvalue   是否衰减（顶部）
---@param widget      userdata
---@param time        number
---@param boolvalue   boolean
function GUI:ScrollView_scrollToTop(widget, time, boolvalue) end;

---滚动容器衰减滚动（底部）
---* widget      容器对象
---* time        时间
---* boolvalue   是否衰减（底部）
---@param widget      userdata
---@param time        number
---@param boolvalue   boolean
function GUI:ScrollView_scrollToBottom(widget, time, boolvalue) end;

---滚动容器衰减滚动（顶左）
---* widget      容器对象
---* time        时间
---* boolvalue   是否衰减（底部）
---@param widget      userdata
---@param time        number
---@param boolvalue   boolean
function GUI:ScrollView_scrollToTopLeft(widget, time, boolvalue) end;

---滚动容器衰减滚动（右边）
---* widget      容器对象
---* time        时间
---* boolvalue   是否衰减（右边）
---@param widget      userdata
---@param time        number
---@param boolvalue   boolean
function GUI:ScrollView_scrollToRight(widget, time, boolvalue) end;

---滚动容器衰减滚动（左边）
---* widget      容器对象
---* time        时间
---* boolvalue   是否衰减（左边）
---@param widget      userdata
---@param time        number
---@param boolvalue   boolean
function GUI:ScrollView_scrollToLeft(widget, time, boolvalue) end;

---滚动容器衰减滚动（垂直方向滚动）
---* widget      容器对象
---* percent     百分比
---* time        时间
---* boolvalue   是否衰减滚动速度
---@param widget      userdata
---@param percent     number
---@param time        number
---@param bool   boolean
function GUI:ScrollView_scrollToPercentVertical(widget, percent, time, bool) end;

---滚动容器衰减滚动（水平方向滚动）
---* widget      容器对象
---* percent     百分比
---* time        时间
---* boolvalue   是否衰减滚动速度
---@param widget      userdata
---@param percent     number
---@param time        number
---@param bool   boolean
function GUI:ScrollView_scrollToPercentHorizontal(widget, percent, time, bool) end;

---滚动容器添加滚动条
---* parent      父节点对象
---* param       布局参数
---@param widget      userdata
---@param value       table
function GUI:SetScrollViewVerticalBar(widget, value) end;

---设置翻页容器是否有裁切
---* widget      容器对象
---* value       是否有裁切
---@param widget      userdata
---@param value       boolean
function GUI:PageView_setClippingEnabled(widget, value) end;

---设置翻页容器背景颜色
---* widget      容器对象
---* value       色值(&quot;#000000&quot;)<br> ! 渐变色需传参table `{&quot;#FF0000&quot;, &quot;#FFFFFF&quot;}`
---@param widget      userdata
---@param value       string
function GUI:PageView_setBackGroundColor(widget, value) end;

---设置翻页容器背景颜色类型
---* widget      容器对象
---* value       1：单色，2：渐变色
---@param widget      userdata
---@param value       number
function GUI:PageView_setBackGroundColorType(widget, value) end;

---设置翻页容器背景透明度
---* widget      容器对象
---* value       透明度(0-255)
---@param widget      userdata
---@param value       number
function GUI:PageView_setBackGroundColorOpacity(widget, value) end;

---设置翻页容器滚动到子页面
---* widget      容器对象
---* index       子页面序列号
---@param widget      userdata
---@param index       number
function GUI:PageView_scrollToItem(widget, index) end;

---设置翻页容器当前子页序列号
---* widget      容器对象
---* index       子页面序列号
---@param widget      userdata
---@param index       number
function GUI:PageView_setCurrentPageIndex(widget, index) end;

---移动动作
---* time        时间
---* x           位置 横坐标
---* y           位置 纵坐标
---@param time        number
---@param x           number
---@param y           number
function GUI:ActionMoveTo(time, x, y) end;

---移动动作（相对位置）
---* time        时间
---* x           位置 横坐标
---* y           位置 纵坐标
---@param time        number
---@param x           number
---@param y           number
function GUI:ActionMoveBy(time, x, y) end;

---缩放动作
---* time        时间
---* ratio       缩放比例（百分比）
---@param time        number
---@param ratio       number
function GUI:ActionScaleTo(time, ratio, ...) end;

---缩放动作（原有基础上缩放）
---* time        时间
---* ratio       缩放比例（百分比）
---@param time        number
---@param ratio       number
function GUI:ActionScaleBy(time, ratio, ...) end;

---旋转动作
---* time        时间
---* angle       旋转角度
---@param time        number
---@param angle       number
function GUI:ActionRotateTo(time, angle) end;

---旋转动作（原有基础上旋转）
---* time        时间
---* angle       旋转角度
---@param time        number
---@param angle       number
function GUI:ActionRotateBy(time, angle) end;

---淡入动作
---* time        时间
---@param time        number
function GUI:ActionFadeIn(time) end;

---淡出动作
---* time        时间
---@param time        number
function GUI:ActionFadeOut(time) end;

---闪烁动作
---* time        时间
---* num         闪烁次数
---@param time        number
---@param num         number
function GUI:ActionBlink(time, num) end;

---动画回调函数
---* callback        回调函数
---@param callback        function
function GUI:CallFunc(callback) end;

---动作延迟
---* time    延迟时间
---@param time    number
function GUI:DelayTime(time) end;

---设置粒子持续时间
---* widget      粒子特效
---* value       持续时间, 单位: 秒 <br> -1 表示永久
---@param widget      userdata
---@param value       number
function GUI:ParticleEffect_setDuration(widget, value) end;

---设置总粒子数量
---* widget      粒子特效
---* value       数量
---@param widget      userdata
---@param value       number
function GUI:ParticleEffect_setTotalParticles(widget, value) end;

---新增拖拽类型和拖拽事件
---* fromType    控件来自位置类型名
---* toType      控件到达位置类型名
---* fromToEvent 从fromType类型控件 拖拽到 toType类型控件 触发的函数
---* toFromEvent 从toType类型控件 拖拽到 fromType类型控件 触发的函数
---@param fromType    string
---@param toType      string
---@param fromToEvent function
---@param toFromEvent function
function GUI:AddMoveWidgetTypeEvent(fromType, toType, fromToEvent, toFromEvent) end;

---设置子cell创建方法
---* widget      tableView对象
---* func		 创建函数 传入参数(cell父节点, cell下标)
---@param widget      userdata
---@param func		 function
function GUI:TableView_setCellCreateEvent(widget, func) end;

---设置列表容器滚动方向
---* widget      tableView对象
---* value		 滚动方向 1：垂直; 2：水平
---@param widget      userdata
---@param value		 number
function GUI:TableView_setDirection(widget, value) end;

---设置列表容器内部区域偏移位置
---* widget      tableView对象
---* x			 偏移坐标X
---* y			 偏移坐标Y
---@param widget      userdata
---@param x			 number
---@param y			 number
function GUI:TableView_setContentOffset(widget, x, y) end;

---添加列表容器点击cell事件
---* widget      tableView对象
---* func		 点击cell触发回调
---@param widget      userdata
---@param func		 function
function GUI:TableView_addOnTouchedCellEvent(widget, func) end;

---列表容器滚动到某cell位置
---* widget      tableView对象
---* index		 对应cell下标
---@param widget      userdata
---@param index		 number
function GUI:TableView_scrollToCell(widget, index) end;

---添加容器滚动回调
---* widget      tableView对象
---* func		 容器滚动回调函数 param1: TableView控件
---@param widget      userdata
---@param func		 function
function GUI:TableView_addOnScrollEvent(widget, func) end;

---设置容器cell个数
---* widget      tableView对象
---* func		 cell总个数(int)/返回cell总个数的函数(func)
---@param widget      userdata
---@param func		 number
function GUI:TableView_setTableViewCellsNumHandler(widget, func) end;

---设置装备框显示自动刷新
---* widget      装备框对象
---@param widget      userdata
function GUI:EquipShow_setAutoUpdate(widget) end;

---设置坐标
---* widget   控件对象
---* x     横坐标
---* y     纵坐标
---@param widget   userdata
---@param x     number
---@param y?     number
function GUI:setPosition(widget, x, y) end;

---设置横坐标
---* widget    控件对象
---* value    横坐标
---@param widget    userdata
---@param value    number
function GUI:setPositionX(widget, value) end;

---设置纵坐标
---* widget    控件对象
---* value     纵坐标
---@param widget    userdata
---@param value     number
function GUI:setPositionY(widget, value) end;

---设置控件锚点
---* widget    控件对象
---* x      横坐标
---* y      纵坐标
---@param widget    userdata
---@param x      number
---@param y      number
function GUI:setAnchorPoint(widget, x, y) end;

---设置控件尺寸大小
---* widget    控件对象
---* sizeW    宽度
---* sizeH    长度
---@param widget    userdata
---@param sizeW    number|table
---@param sizeH?    number
function GUI:setContentSize(widget, sizeW, sizeH) end;

---设置忽略设置的自定义尺寸大小
---* widget    控件对象
---* value    是否忽略用户定义尺寸大小
---@param widget    userdata
---@param value    boolean
function GUI:setIgnoreContentAdaptWithSize(widget, value) end;

---设置控件标签
---* widget    控件对象
---* value    标签值
---@param widget    userdata
---@param value    number
function GUI:setTag(widget, value) end;

---设置控件名字
---* widget    控件对象
---* value    名字
---@param widget    userdata
---@param value    string
function GUI:setName(widget, value) end;

---设置控件置灰
---* widget    控件对象
---* isGrey    是否置灰
---@param widget    userdata
---@param isGrey    boolean
function GUI:setGrey(widget, isGrey) end;

---设置控件旋转角度
---* widget    控件对象
---* value    旋转角度（0 - 360）
---@param widget    userdata
---@param value    number
function GUI:setRotation(widget, value) end;

---设置控件X轴倾斜角度
---* widget    控件对象
---* value    倾斜角度（0 - 360）
---@param widget    userdata
---@param value    number
function GUI:setRotationSkewX(widget, value) end;

---设置控件Y轴倾斜角度
---* widget    控件对象
---* value    倾斜角度（0 - 360）
---@param widget    userdata
---@param value    number
function GUI:setRotationSkewY(widget, value) end;

---设置控件可见性
---* widget    控件对象
---* value    是否显示
---@param widget    userdata
---@param value    boolean
function GUI:setVisible(widget, value) end;

---设置控件不透明度
---* widget    控件对象
---* value    不透明度(0-255), 默认255
---@param widget    userdata
---@param value    number
function GUI:setOpacity(widget, value) end;

---获取控件不透明度
---* widget    控件对象
---@param widget    userdata
---@return number 控件不透明度
function GUI:getOpacity(widget) end;

---设置控件缩放
---* widget    控件对象
---* value    缩放比例, 默认1.0
---@param widget    userdata
---@param value    number
function GUI:setScale(widget, value) end;

---获取控件缩放比例
---* widget    控件对象
---@param widget    userdata
---@return number 控件缩放比例
function GUI:getScale(widget) end;

---设置控件X轴方向缩放
---* widget    控件对象
---* value    缩放比例, 默认1.0
---@param widget    userdata
---@param value    number
function GUI:setScaleX(widget, value) end;

---获取控件X轴方向缩放比例
---* widget    控件对象
---@param widget    userdata
---@return number 控件X轴方向缩放比例
function GUI:getScaleX(widget) end;

---设置控件Y轴方向缩放
---* widget    控件对象
---* value    缩放比例, 默认1.0
---@param widget    userdata
---@param value    number
function GUI:setScaleY(widget, value) end;

---设置水平X轴方向翻转
---* widget    控件对象
---* value    X轴方向是否翻转
---@param widget    userdata
---@param value    boolean
function GUI:setFlippedX(widget, value) end;

---垂直Y轴方向翻转
---* widget    控件对象
---* value    Y轴方向是否翻转
---@param widget    userdata
---@param value    boolean
function GUI:setFlippedY(widget, value) end;

---设置控件渲染层级
---* widget    控件对象
---* value    渲染层级, 值越大显示越靠前
---@param widget    userdata
---@param value    number
function GUI:setLocalZOrder(widget, value) end;

---设置控件是否跟随父控件变化透明度
---* widget    控件对象
---* value    是否跟随
---@param widget    userdata
---@param value    boolean
function GUI:setCascadeOpacityEnabled(widget, value) end;

---设置控件的所有子控件是否跟随变化透明度
---* widget    控件对象
---* value    是否跟随
---@param widget    userdata
---@param value    boolean
function GUI:setChildrenCascadeOpacityEnabled(widget, value) end;

---设置控件是否可以触摸
---* widget    控件对象
---* value    是否触摸
---@param widget    userdata
---@param value    boolean
function GUI:setTouchEnabled(widget, value) end;

---设置延迟可触摸
---* widget    控件对象
---* delay    延迟触摸间隔
---@param widget    userdata
---@param delay    number
function GUI:delayTouchEnabled(widget, delay) end;

---设置控件是否可以鼠标触摸
---* widget    控件对象
---* value    是否鼠标触摸
---@param widget    userdata
---@param value    boolean
function GUI:setMouseEnabled(widget, value) end;

---设置控件是否触摸吞噬
---* widget    控件对象
---* value    是否吞噬
---@param widget    userdata
---@param value    boolean
function GUI:setSwallowTouches(widget, value) end;

---设置控件吞噬鼠标按键事件 [检查自身触摸吞噬时]
---* widget    控件对象
---@param widget    userdata
function GUI:setMouseRSwallowTouches(widget) end;

---设置控件点击事件
---* widget    控件对象
---* func    回调函数
---@param widget    userdata
---@param func    function
function GUI:addOnClickEvent(widget, func) end;

---设置控件触摸事件
---* widget    控件对象
---* func    回调函数
---@param widget    userdata
---@param func    function
function GUI:addOnTouchEvent(widget, func) end;

---设置控件长按触发事件
---* widget    控件对象
---* func    回调函数
---@param widget    userdata
---@param func    function
function GUI:addOnLongTouchEvent(widget, func) end;

---设置控件鼠标进入/移出事件
---* widget    控件对象
---* param    onEnterFunc: function 鼠标进入回调函数<br>onLeaveFunc: function 鼠标移出回调函数<br>onInsideFunc: function 鼠标一直在内部回调函数
---@param widget    userdata
---@param param    table
function GUI:addMouseMoveEvent(widget, param) end;

---设置鼠标按钮事件
---* widget    控件对象
---* param    onRightDownFunc: function 鼠标右键点击事件 <br> OnRightUpFunc: function 鼠标右键松开事件<br> needTouchPos: boolean 需要传入鼠标触摸位置<br>OnScrollFunc: function 鼠标滚轮滚动事件
---@param widget    userdata
---@param param    table
function GUI:addMouseButtonEvent(widget, param) end;

---设置鼠标经过控件显示文本
---* widget    控件对象
---* str     文本
---* pos     位置
---* anr     锚点
---* param    checkCallback: function 检查接触点是否能展示[函数传入参数: pos <br>返回: true | false ]
---@param widget    userdata
---@param str     string
---@param pos     table
---@param anr     table
---@param param?    table
function GUI:addMouseOverTips(widget, str, pos, anr, param) end;

---键盘监听事件
---* codeKeys   要监听的键盘键key
---* pressedCB  按下回调
---* releaseCB  松开回调
---* checkFullSort 兼容全顺序键盘key排列, 针对监听多键
---@param codeKeys   string | table
---@param pressedCB  function
---@param releaseCB?  function
---@param checkFullSort? boolean
function GUI:addKeyboardEvent(codeKeys, pressedCB, releaseCB, checkFullSort) end;

---移除键盘监听
---* codeKeys   要移除监听的键盘键key
---@param codeKeys   string | table
function GUI:removeKeyboardEvent(codeKeys) end;

---通过对象关闭界面
---* widget   界面对象
---@param widget   userdata
function GUI:Win_Close(widget) end;

---通过ID关闭界面
---* ID   界面ID
---@param ID  string
function GUI:Win_CloseByID(ID) end;

---通过NPCID关闭界面
---* NPCID   NPCID
---@param NPCID  number
function GUI:Win_CloseByNPCID(NPCID) end;

---通过键盘的Esc键关闭界面
---* widget   界面对象
---* value 石否关闭
---@param widget   userdata
---@param value boolean
function GUI:Win_SetESCClose(widget, value) end;

---关闭所有界面
function GUI:Win_CloseAll() end;

---判断对象是否为空
---* widget      对象
---@param widget      userdata
---@return boolean
function GUI:Win_IsNull(widget) end;

---判断对象是否不为空
---* widget      对象
---@param widget      userdata
---@return boolean
function GUI:Win_IsNotNull(widget) end;

---加载纹理图片
---* widget      图片对象
---* filepath    图片路径
---@param widget      userdata
---@param filepath    string
function GUI:Image_loadTexture(widget, filepath) end;

---禁用文本特效
---* widget    对象
---* value    特效类型：<br>0：正常<br> 1：描边<br>2：阴影<br>3：发光
---@param widget    userdata
---@param value    number
function GUI:Text_disableEffect(widget, value) end;

---禁用文本普通特效
---* widget    对象
---@param widget    userdata
function GUI:Text_disableNormal(widget) end;

---禁用文本描边特效
---* widget    对象
---@param widget    userdata
function GUI:Text_disableOutLine(widget) end;

---禁用文本阴影特效
---* widget    对象
---@param widget    userdata
function GUI:Text_disableShadow(widget) end;

---禁用文本发光特效
---* widget    对象
---@param widget    userdata
function GUI:Text_disableGlow(widget) end;

---添加自定义富文本cell
---* widget      控件对象
---* elements    [RichTextCombineCell] 单个元素控件对象 或 控件对象table
---@param widget      userdata
---@param elements    userdata
function GUI:RichTextCombine_pushBackElements(widget, elements) end;

---添加cell完毕格式化富文本
---* widget      控件对象
---@param widget      userdata
function GUI:RichTextCombine_format(widget) end;

---添加富文本url点击触发事件
---* widget      控件对象
---* handle      触发函数 (param1: 富文本控件, param2: string 文本传递内容)
---@param widget      userdata
---@param handle      function
function GUI:RichText_setOpenUrlEvent(widget, handle) end;

---调用GUILayout/Item.lua中的函数
---* widget      物品框对象
---* funcname    GUILayout/Item.lua中的函数名字
---* ...         可变参数
---@param widget      userdata
---@param funcname    string
---@param ...         any
function GUI:ItemShow_OnRunFunc(widget, funcname, ...) end;

---清空对应ID放置框的传入数据
---* widget      物品放入框控件对象
---* boxindex    放置框 唯一ID
---@param widget      userdata
---@param boxindex    number
function GUI:ItemBox_RemoveBoxData(widget, boxindex) end;

---更新对应ID放置框的物品数据
---* widget      物品放入框控件对象
---* boxindex    放置框 唯一ID
---* itemData    填充指定的ItemData数据<br>
---@param widget      userdata
---@param boxindex    number
---@param itemData    table
function GUI:ItemBox_UpdateBoxData(widget, boxindex, itemData) end;

---关闭输入框输入
---* widget      输入框对象
---@param widget      userdata
function GUI:TextInput_closeInput(widget) end;

---特效播放
---* widget      特效对象
---* act         0 待机<br>1 走<br>2 攻击<br>3 施法 <br>4 死亡<br>5 跑步
---* dir         方向
---* isLoop      是否循环播放
---* speed       播放速度
---* isSequence  倒放参数 [仅false为倒放特效 ]
---@param widget      userdata
---@param act         number
---@param dir         number
---@param isLoop      boolean
---@param speed?       number
---@param isSequence?  boolean
function GUI:Effect_play(widget, act, dir, isLoop, speed, isSequence) end;

---特效停止
---* widget      特效对象
---* frameIndex  第几帧
---* act         0 待机<br>1 走<br>2 攻击<br>3 施法 <br>4 死亡<br>5 跑步
---* dir         方向
---@param widget      userdata
---@param frameIndex  number
---@param act         number
---@param dir         number
function GUI:Effect_stop(widget, frameIndex, act, dir) end;

---特效播放完成事件
---* widget      特效对象
---* value       播放完成回调函数
---@param widget      userdata
---@param value       function
function GUI:Effect_addOnCompleteEvent(widget, value) end;

---移除列表容器背景图片设置
---* widget    容器对象
---@param widget    userdata
function GUI:ListView_removeBackGroundImage(widget) end;

---列表容器加载子节点
---* widget    容器对象
---* value    子节点对象（末尾加载）
---@param widget    userdata
---@param value    userdata
function GUI:ListView_pushBackCustomItem(widget, value) end;

---列表容器加载子节点（序列号）
---* widget    容器对象
---* value    子节点对象
---* value2    序列号（index = 1）
---@param widget    userdata
---@param value    userdata
---@param value2    number
function GUI:ListView_insertCustomItem(widget, value, value2) end;

---列表容器删除所有子节点
---* widget    容器对象
---@param widget    userdata
function GUI:ListView_removeAllItems(widget) end;

---通过序列号删除列表容器子节点
---* widget    容器对象
---* index    序列号位置
---@param widget    userdata
---@param index    number
function GUI:ListView_removeItemByIndex(widget, index) end;

---列表容器删除子节点
---* widget    容器对象
---* item     子节点对象
---@param widget    userdata
---@param item     userdata
function GUI:ListView_removeChild(widget, item) end;

---跳转到列表容器序列号节点位置
---* widget    容器对象
---* value    序列号位置
---@param widget    userdata
---@param value    number
function GUI:ListView_jumpToItem(widget, value) end;

---某一时间内滑动到列表容器顶部
---* widget    容器对象
---* time     时间
---* boolvalue  滑动速度是否减弱
---@param widget    userdata
---@param time     number
---@param boolvalue  boolean
function GUI:ListView_scrollToTop(widget, time, boolvalue) end;

---某一时间内滑动到列表容器底部
---* widget    容器对象
---* time     时间
---* boolvalue  滑动速度是否减弱
---@param widget    userdata
---@param time     number
---@param boolvalue  boolean
function GUI:ListView_scrollToBottom(widget, time, boolvalue) end;

---列表容器刷新
---* widget    容器对象
---@param widget    userdata
function GUI:ListView_doLayout(widget) end;

---列表容器可见区域绘制
---* widget    容器对象
---@param widget    userdata
function GUI:ListView_paintItems(widget) end;

---列表容器可见区域自动绘制
---* widget    容器对象
---@param widget    userdata
function GUI:ListView_autoPaintItems(widget) end;

---翻页容器加载子页面
---* widget      容器对象
---* value       子页面对象
---@param widget      userdata
---@param value       userdata
function GUI:PageView_addPage(widget, value) end;

---翻页容器加监听事件
---* widget      容器对象
---* eventCB     监听事件函数
---@param widget      userdata
---@param eventCB     function
function GUI:PageView_addOnEvent(widget, eventCB) end;

---刷新展示QuickCell
---* widget      QuickCell对象
---@param widget      userdata
function GUI:QuickCell_Refresh(widget) end;

---强制退出/ 清理内容QuickCell
---* widget      QuickCell对象
---@param widget      userdata
function GUI:QuickCell_Exit(widget) end;

---播放动作
---* widget      控件对象
---* value       动作内容
---@param widget      userdata
---@param value       userdata
function GUI:runAction(widget, value) end;

---停止所有动作
---* widget        控件对象
---@param widget        userdata
function GUI:stopAllActions(widget) end;

---通过标记停止动作
---* widget      控件对象
---* tag         动作标记
---@param widget      userdata
---@param tag         number
function GUI:stopActionByTag(widget, tag) end;

---动作显示
function GUI:ActionShow() end;

---动作隐藏
function GUI:ActionHide() end;

---移除自身
function GUI:ActionRemoveSelf() end;

---播放顺序
---* action      动作对象
---@param action      userdata
---@return userdata
function GUI:ActionSequence(action, ...) end;

---多个动作同时播放
---* action      动作对象
---@param action      userdata
---@return userdata
function GUI:ActionSpawn(action, ...) end;

---循环播放
---* action      动作对象
---* time        时间
---@param action      userdata
---@param time        number
---@return userdata
function GUI:ActionRepeat(action, time) end;

---一直循环播放
---* action      动作对象（一直循环）
---@param action      userdata
---@return userdata
function GUI:ActionRepeatForever(action) end;

---复合动作（加速度向右，反方向缓慢移动）
---* action      动作对象
---@param action      userdata
---@return userdata
function GUI:ActionEaseBackIn(action) end;

---复合动作（快速移动到结束，然后缓慢返回到结束）
---* action      动作对象
---@param action      userdata
---@return userdata
function GUI:ActionEaseBackOut(action) end;

---指数缓冲动作（缓慢开始, 加速结束）
---* action      动作对象
---@param action      userdata
---@return userdata
function GUI:ActionEaseExponentialIn(action) end;

---指数缓冲动作（加速开始, 缓慢结束）
---* action      动作对象
---@param action      userdata
---@return userdata
function GUI:ActionEaseExponentialOut(action) end;

---指数缓冲动作（动作缓慢开始和终止）
---* action      动作对象
---@param action      userdata
---@return userdata
function GUI:ActionEaseExponentialInOut(action) end;

---加载容器所有列表数据
---* widget      tableView对象
---@param widget      userdata
function GUI:TableView_reloadData(widget) end;

---添加容器鼠标滚动事件
---* widget      tableView对象
---* func		 鼠标滚动回调函数传参{widget = widget, x = 滚动坐标X, y = 滚动坐标Y} [不填采用官方默认添加滚动]
---@param widget      userdata
---@param func		 function
function GUI:TableView_addMouseScrollEvent(widget, func) end;

---添加子节点到旋转容器对应下标item
---* widget      旋转容器对象
---* value       控件对象
---* index       对应下标
---@param widget      userdata
---@param value       userdata
---@param index       number
function GUI:RotateView_addChild(widget, value, index) end;

---加载UI文件
---* parent   父节点对象
---* filename  文件路径
---@param parent   userdata
---@param filename  string
function GUI:LoadExport(parent, filename) end;

---对应控件的节点坐标转换为世界坐标
---* widget    控件对象
---* x      节点坐标X
---* y      节点坐标Y
---@param widget    userdata
---@param x      number
---@param y      number
---@return table 世界坐标
function GUI:convertToWorldSpace(widget, x, y) end;

---世界坐标转换为对应控件的节点坐标
---* widget    控件对象
---* x      世界坐标X
---* y      世界坐标Y
---@param widget    userdata
---@param x      number
---@param y      number
---@return table 对应控件的节点坐标
function GUI:convertToNodeSpace(widget, x, y) end;

---加载子控件
---* widget    父控件对象
---* child    子控件对象)
---@param widget    userdata
---@param child    userdata
function GUI:addChild(widget, child) end;

---移除传入控件的所有子节点
---* widget    控件对象
---@param widget    userdata
function GUI:removeAllChildren(widget) end;

---将传入控件从父节点上移除
---* widget    控件对象
---@param widget    userdata
function GUI:removeFromParent(widget) end;

---通过名字删除传入控件的对应子节点
---* widget    控件对象
---* name     控件名字
---@param widget    userdata
---@param name     string
function GUI:removeChildByName(widget, name) end;

---开启定时器
---* widget    控件对象
---* callback   回调函数
---* delay    时间间隔
---@param widget    userdata
---@param callback   function
---@param delay    number
function GUI:schedule(widget, callback, delay) end;

---停止定时器
---* widget    控件对象
---@param widget    userdata
function GUI:unSchedule(widget) end;

---显示文本Tips
---* tips     显示文本
---* worldPos   世界坐标
---* anchorPoint 锚点
---@param tips     string
---@param worldPos   table
---@param anchorPoint table
function GUI:ShowWorldTips(tips, worldPos, anchorPoint) end;

---关闭文本Tips
function GUI:HideWorldTips() end;

---自适应布局
---* pNode     控件对象
---* param   布局参数
---@param pNode     userdata
---@param param   table
---@return table {width = width, height = height}
function GUI:UserUILayout(pNode, param) end;

---派发事件
---* eventID      	事件ID
---* data      数据
---@param eventID      string
---@param data      any
function SL:onLUAEvent(eventID, data) end;

---添加自动使用弹窗
---* key      元变量Key
---* ...      数值
---@param key      string
---@param ...      any
function SL:SetMetaValue(key, ...) end;

---打印所有能获取的元变量
function SL:PrintAllMetaValue() end;

---打印所有元变量Key
function SL:PrintMetaKey() end;

---日志打印
function SL:release_print(...) end;

---DEBUG下日志打印(Print)
function SL:Print(...) end;

---DEBUG下日志打印(PrintEx)
function SL:PrintEx(...) end;

---DEBUG下日志打印(PrintTraceback)
function SL:PrintTraceback(...) end;

---DEBUG下日志打印(dump)
---* data    需要打印的表
---* desciption  打印表描述
---* nesting 需要打印的深度
---@param data    table
---@param desciption  string
---@param nesting number
function SL:dump(data, desciption, nesting) end;

---json字符串解密
---* jsonStr  json字符串
---* isfilter  是否过滤违禁词 默认为true
---@param jsonStr  string
---@param isfilter?  boolean
---@return table json table
function SL:JsonDecode(jsonStr, isfilter) end;

---json字符串加密
---* jsonData json表
---* isfilter 是否过滤违禁词 默认为true
---@param jsonData table
---@param isfilter boolean
---@return string  json string
function SL:JsonEncode(jsonData, isfilter) end;

---颜色转换函数
---* hexStr  16进制字符
---@param hexStr  string
---@return table 从16进制字符转为{r, g, b}
function SL:ConvertColorFromHexString(hexStr) end;

---文件路径是否存在
---* path 文件路径
---@param path string
---@return boolean 文件路径是否存在
function SL:IsFileExist(path) end;

---深拷贝
---* data  需深拷贝内容
---@param data  table
---@return table 深拷贝内容
function SL:CopyData(data) end;

---字符串分割
---* str  分割内容
---* delimiter  分割字符
---@param str  string
---@param delimiter  string
---@return table 拆分后字符
function SL:Split(str, delimiter) end;

---文本提示
---* str         显示文本
---@param str         string
function SL:ShowSystemTips(str) end;

---哈希表转成按数组
---* hashTab         转换表
---* sortFunc       排序方法
---@param hashTab         table
---@param sortFunc       function
---@return table 转换后table
function SL:HashToSortArray(hashTab, sortFunc) end;

---显示提示文本框
---* str         显示文本
---* width       显示宽度, 默认: 1136
---* pos         坐标, 默认: {x = 0, y = 0}
---* anchorPoint 锚点, 默认: {x = 0, y = 1}
---@param str         string
---@param width       number
---@param pos         table
---@param anchorPoint table
function SL:SHOW_DESCTIP(str, width, pos, anchorPoint) end;

---加载文件
---* file         文件名
---@param file         string
function SL:RequireFile(file) end;

---拆解文件
---* path         文件路径
---* delimiter    指定分隔符
---* callback     拆解回调方法 传入拆分后table参数
---@param path         string
---@param delimiter    string
---@param callBack     function
function SL:LoadTxtFile(path, delimiter, callBack) end;

---数字转换成万、亿单位
---* num          数值
---* places       显示小数点后几位数
---@param num          number
---@param places?       number
---@return string 转换后数字
function SL:GetSimpleNumber(num, places) end;

---血量单位显示
---* hp           血量数值
---* pointBit     显示小数点后几位, 默认保留后两位
---@param hp           number
---@param pointBit?     number
---@return string 转换后血量
function SL:HPUnit(hp, pointBit) end;

---中文转换成竖着显示
---* str           需转换中文
---@param str           string
---@return string 转换后中文字符
function SL:ChineseToVertical(str) end;

---阿拉伯数字转中文大写
---* num           需转换阿拉伯数字
---@param num           number
---@return string 大写中文数字
function SL:NumberToChinese(num) end;

---获取字符串的byte长度
---* str           字符串
---@param str           string
---@return number 字符串的byte长度
function SL:GetUTF8ByteLen(str) end;

---时间格式化成字符串显示
---* sec          秒数
---* isToStr      是否转成字符串输出, 空或false则返回table <br>{d = 天数, h = 小时, m = 分钟, s = 秒}
---* isSimple     是否简化字符串[基于isToStr 为 true]
---@param sec          number
---@param isToStr?      boolean
---@param isSimple?     boolean
---@return table 时间格式化成字符串 格式:xx天xx时xx分xx秒
function SL:SecondToHMS(sec, isToStr, isSimple) end;

---数字转化为千分位字符串
---* num          数字
---@param num          number
---@return string 千分位字符串无
function SL:GetThousandSepString(num) end;

---lua table转成config配置表
---* tab          需要转换的table
---* name         转出文件名
---* destPath     文件保存的路径, 默认目录：dev/scripts/game_config/
---* sortFunc     外层排序函数
---@param tab          table
---@param name         string
---@param destPath     string
---@param sortFunc     function
function SL:SaveTableToConfig(tab, name, destPath, sortFunc) end;

---十六进制转十进制
---* hexStr          十六进制
---@param hexStr          string
---@return number 十进制
function SL:HexToInt(hexStr) end;

---MD5加密
---* str          加密字符
---@param str          string
---@return string 加密后字符
function SL:GetStrMD5(str) end;

---UTF8转GBK编码
---* str          需要转换的字符
---@param str          string
---@return string 转换后字符
function SL:UTF8ToGBK(str) end;

---GBK转UTF8编码
---* str          需要转换的字符
---@param str          string
---@return string 转换后字符
function SL:GBKToUTF8(str) end;

---计算两坐标间的平方距离
---* pt1  		  起始坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---* pt2  		  结束坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt1  		  table
---@param pt2  		  table
---@return number 两坐标间的平方距离
function SL:GetPointDistanceSQ(pt1, pt2) end;

---计算两坐标间的距离
---* pt1  		  起始坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---* pt2  		  结束坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt1  		  table
---@param pt2  		  table
---@return number 两坐标间的距离
function SL:GetPointDistance(pt1, pt2) end;

---计算向量长度
---* pt  		  GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt  		  table
---@return number 向量长度
function SL:GetPointLength(pt) end;

---计算向量长度平方
---* pt  		  GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt  		  table
---@return number
function SL:GetPointLengthSQ(pt) end;

---计算两点中心点坐标
---* pt1  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---* pt2  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt1  		  table
---@param pt2  		  table
---@return table 两点中心点坐标
function SL:GetMidPoint(pt1, pt2) end;

---计算两点相加坐标
---* pt1  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---* pt2  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt1  		  table
---@param pt2  		  table
---@return table 两点相加坐标
function SL:GetAddPoint(pt1, pt2) end;

---计算两点相减坐标
---* pt1  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---* pt2  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt1  		  table
---@param pt2  		  table
---@return table 两点相减坐标
function SL:GetSubPoint(pt1, pt2) end;

---标准向量化坐标
---* pt  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt  		  table
---@return table 标准向量化坐标
function SL:GetNormalizePoint(pt) end;

---计算两向量夹角弧度值
---* pt1  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---* pt2  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt1  		  table
---@param pt2  		  table
---@return number 两向量夹角弧度值
function SL:GetPointAngle(pt1, pt2) end;

---计算两向量夹角角度值
---* pt1  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---* pt2  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt1  		  table
---@param pt2  		  table
---@return number 两向量夹角角度值
function SL:GetPointRotate(pt1, pt2) end;

---计算自身弧度值
---* pt  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt  		  table
---@return number 自身弧度值
function SL:GetPointAngleSelf(pt) end;

---计算自身角度值
---* pt  		  坐标 GUI:p(x, y) 或 <br>{x = x, y = y}
---@param pt  		  table
---@return number 自身角度值
function SL:GetPointRotateSelf(pt) end;

---获取高16位值
---* value  		   被操作值
---@param value  		  number
---@return number 高16位值
function SL:GetH16Bit(value) end;

---获取低16位值
---* value  		  被操作值
---@param value  		  number
---@return number 高16位值
function SL:GetL16Bit(value) end;

---跳转到某个超链
---* id  		  对应界面的跳转id
---@param id  		  number
function SL:JumpTo(id) end;

---退出到选角界面
function SL:ExitToRoleUI() end;

---退出到选角界面(强制小退)
function SL:ForceExitToRoleUI() end;

---退出到登录界面
function SL:ExitToLoginUI() end;

---退出游戏
function SL:ExitGame() end;

---发送GM命令到聊天
---* msg   gm命令
---@param msg   string
function SL:RequestSendChatGMMsg(msg) end;

---创建一个红点到节点
---* targetNode   目标控件
---* offset       偏移位置 例: {x = 5, y = 5}
---@param targetNode   userdata
---@param offset?       table
---@return userdata
function SL:CreateRedPoint(targetNode, offset) end;

---设置文本样式(按钮、文本)
---* widget   按钮或者文本对象
---* colorID       0 - 255 色值ID
---@param widget   userdata
---@param colorID       number
function SL:SetColorStyle(widget, colorID) end;

---获取对应色值ID的配置
---* colorID       0 - 255 色值ID
---@param colorID       number
---@return table 对应色值ID的配置
function SL:GetColorCfg(colorID) end;

---检查是否满足条件
---@return boolean 是否满足条件
function SL:CheckCondition(conditionStr) end;

---显示气泡提醒
---* id   气泡ID
---* path       气泡图片资源路径
---* callback   气泡点击回调
---@param id   number
---@param path       string
---@param callback   function
function SL:AddBubbleTips(id, path, callback) end;

---删除气泡提醒
---* ID   气泡ID
---@param ID   number
function SL:DelBubbleTips(ID) end;

---重新加载地图
function SL:ReloadMap() end;

---请求HTTP Get方式
---* url     链接地址
---* httpCB  回调函数
---@param url    string
---@param httpCB function
function SL:HTTPRequestGet(url, httpCB) end;

---请求HTTP Post方式
---* url        链接地址
---* httpCB     回调函数
---* suffix     请求信息
---* head       请求头
---@param url       string
---@param httpCB    function
---@param suffix    string
---@param head      table
function SL:HTTPRequestPost(url, httpCB, suffix, head) end;

---本地公告展示
---* data       具体参数配置
---@param data      table
function SL:ShowLocalNoticeByType(data) end;

---震屏
---* time       震动时间 (毫秒)
---* distance   震动距离
---@param time      number
---@param distance  number
function SL:ShakeScene(time, distance) end;

---注册控件事件
---* widget  控件对象
---* msg   描述
---* msgtype  窗体事件id
---* callback  回调函数
---@param widget  userdata
---@param msg  string
---@param msgtype number
---@param callback function
function SL:RegisterWndEvent(widget, msg, msgtype, callback) end;

---注销控件事件
---* widget  控件对象
---* desc   描述
---* msgtype  窗体事件id
---@param widget  userdata
---@param desc  string
---@param msgtype number
function SL:UnRegisterWndEvent(widget, desc, msgtype) end;

---添加窗体控件自定义属性
---* widget    控件对象
---* desc      描述
---* key       属性名称
---* value     属性值
---@param widget    userdata
---@param desc      string
---@param key       string
---@param value     any
function SL:AddWndProperty(widget, desc, key, value) end;

---删除窗体控件自定义属性
---* widget    控件对象
---* desc      描述
---* key       属性名称
---@param widget    userdata
---@param desc      string
---@param key       string
function SL:DelWndProperty(widget, desc, key) end;

---获取窗体控件自定义属性
---* widget    控件对象
---* desc      描述
---* key       属性名称
---@param widget    userdata
---@param desc      string
---@param key       string
---@return any
function SL:GetWndProperty(widget, desc, key) end;

---开启一个定时器
---* callback    回调函数
---* time    时间
---@param callback    function
---@param time    number
---@return number 定时器ID
function SL:Schedule(callback, time) end;

---停止一个定时器
---* scheduleID    定时器ID
---@param scheduleID    number
function SL:UnSchedule(scheduleID) end;

---开启一个单次定时器
---* callback    回调函数
---* time    时间
---@param callback    function
---@param time    number
function SL:ScheduleOnce(callback, time) end;

---开启一个定时器, 绑定node节点
---* node    bode节点
---* callback    回调函数
---* time    时间
---@param node    userdata
---@param callback    function
---@param time    number
function SL:schedule(node, callback, time) end;

---开启一个单次定时器, 绑定node节点
---* node    bode节点
---* callback    回调函数
---* time    时间
---@param node    userdata
---@param callback    function
---@param time    number
function SL:scheduleOnce(node, callback, time) end;

---打开引导
---* data   数据结构如下, 参考示例
---@param data  table 引导对象
function SL:StartGuide(data) end;

---关闭引导
---* guide   引导对象
---@param guide  userdata
function SL:CloseGuide(guide) end;

---存储字符到本地
---* key   字段名
---* data   数据
---@param key   any
---@param data  number
function SL:SetLocalString(key, data) end;

---从本地读取字符
---* key   字段名
---@param key   any
---@return string 字符
function SL:GetLocalString(key) end;

---背包刷新
function SL:RequestRefreshBagPos() end;

---使用物品
---* Index 物品Index
---@param Index number
function SL:RequestUseItemByIndex(Index) end;

---批量勾选背包物品
---* data 物品唯一ID 数组
---@param data table
function SL:RequestSetBagItemChoose(data) end;

---丢弃物品
---* itemData 装备数据
---@param itemData table
function SL:RequestIntoDropBagItem(itemData) end;

---检测人物是否可穿戴
---* itemData 装备数据
---@param itemData table
---@return boolean 是否可穿戴
function SL:CheckItemUseNeed(itemData) end;

---检测英雄是否可穿戴
---* itemData 装备数据
---@param itemData table
---@return boolean 是否可穿戴
function SL:CheckItemUseNeed_Hero(itemData) end;

---人物装备穿戴
---* itemData   装备数据
---* pos        装备位置
---* isFromHero 是否来自英雄背包
---@param itemData   table
---@param pos        number
---@param isFromHero boolean
function SL:RequestPlayerTakeOnEquip(itemData, pos, isFromHero) end;

---人物装备脱下
---* itemData   装备数据
---* isToHero   是否脱到英雄背包
---@param itemData   table
---@param isToHero   boolean
function SL:RequestPlayerTakeOffEquip(itemData, isToHero) end;

---英雄装备穿戴
---* itemData   装备数据
---* pos        装备位置
---* isFromPlayer 是否来自人物背包
---@param itemData   table
---@param pos        number
---@param isFromPlayer boolean
function SL:RequestHeroTakeOnEquip(itemData, pos, isFromPlayer) end;

---英雄装备脱下
---* itemData   装备数据
---* isToPlayer   是否脱到人物背包
---@param itemData   table
---@param isToPlayer   boolean
function SL:RequestHeroTakeOffEquip(itemData, isToPlayer) end;

---查看他人角色界面
---* data   extent: 子页id<br> 1装备、2状态、3属性、4技能、6称号、11时装
---@param data   table
function SL:OpenOtherPlayerUI(data) end;

---关闭他人角色界面
function SL:CloseOtherPlayerUI() end;

---移除英雄角色界面对应子页id内容
---* data   extent: 子页id<br> 1装备、2状态、3属性、4技能、6称号、11时装
---@param data   table
function SL:CloseMyPlayerHeroPageUI(data) end;

---查看他人英雄界面
---* data   extent: 子页id<br> 1装备、2状态、3属性、4技能、6称号、11时装
---@param data   table
function SL:OpenOtherPlayerHeroUI(data) end;

---关闭他人英雄界面
function SL:CloseOtherPlayerHeroUI() end;

---交易行查看他人界面
---* data   extent: 子页id<br> 1装备、2状态、3属性、4技能、6称号、11时装
---@param data   table
function SL:CloseTradingBankHeroPageUI(data) end;

---打开装备面板
---* param   param: <br>1: 自己人物<br>2：自己英雄<br>11：其他玩家人物<br>12：其他玩家英雄<br>21：交易行人物<br>22：交易行英雄
---@param param   number
function SL:OpenPlayerEquipUI(param) end;

---打开状态面板
---* param   param: <br>1: 自己人物<br>2：自己英雄<br>11：其他玩家人物<br>12：其他玩家英雄<br>21：交易行人物<br>22：交易行英雄
---@param param   number
function SL:OpenPlayerBaseAttrUI(param) end;

---打开属性面板
---* param   param: <br>1: 自己人物<br>2：自己英雄<br>11：其他玩家人物<br>12：其他玩家英雄<br>21：交易行人物<br>22：交易行英雄
---@param param   number
function SL:OpenPlayerExtraAttrUI(param) end;

---打开技能面板
---* param   param: <br>1: 自己人物<br>2：自己英雄<br>11：其他玩家人物<br>12：其他玩家英雄<br>21：交易行人物<br>22：交易行英雄
---@param param   number
function SL:OpenPlayerSkillUI(param) end;

---打开称号面板
---* param   param: <br>1: 自己人物<br>2：自己英雄<br>11：其他玩家人物<br>12：其他玩家英雄<br>21：交易行人物<br>22：交易行英雄
---@param param   number
function SL:OpenPlayerTitleUI(param) end;

---打开时装面板
---* param   param: <br>1: 自己人物<br>2：自己英雄<br>11：其他玩家人物<br>12：其他玩家英雄<br>21：交易行人物<br>22：交易行英雄
---@param param   number
function SL:OpenPlayerSuperEquipUI(param) end;

---打开主界面技能按钮区域
---* param   param: <br>1: 自己人物<br>2：自己英雄<br>11：其他玩家人物<br>12：其他玩家英雄<br>21：交易行人物<br>22：交易行英雄
---@param param   number
function SL:OpenGuideEnter(param) end;

---关闭主界面技能按钮区域
function SL:CloseGuideEnter() end;

---打开任务栏
function SL:OpenAssistUI() end;

---关闭任务栏
function SL:CloseAssistUI() end;

---打开主界面小地图收缩(手机端)
function SL:OpenMiniMapChangeUI() end;

---关闭主界面小地图收缩(手机端)
function SL:CloseMiniMapChangeUI() end;

---直接调用支付
function SL:OpenCallPayUI() end;

---打开快捷使用框
---* itemData  真实物品数据
---* equipPos  物品为装备时装戴的装备位置
---* isBook    是否是技能书
---* isHero    是否为英雄
---@param itemData  table
---@param equipPos  number
---@param isBook    boolean
---@param isHero    boolean
function SL:OpenAutoUsePopUI(itemData, equipPos, isBook, isHero) end;

---关闭快捷使用框
---* makeIndex 物品唯一ID
---* isHero    是否为英雄
---@param makeIndex number
---@param isHero    boolean
function SL:CloseAutoUsePopUI(makeIndex, isHero) end;

---打开开宝箱动画页
---* itemData  宝箱物品数据
---@param itemData  table
function SL:OpenTreasure(itemData) end;

---关闭开宝箱动画页
function SL:CloseTreasure() end;

---打开宝箱奖励界面
---* itemData  宝箱物品数据
---@param itemData  table
function SL:OpenGoldBox(itemData) end;

---关闭宝箱奖励界面
function SL:CLoseGoldBox() end;

---打开通用描述Tips
---* data   str: 描述内容 <br> worldPos: 提示位置<br> width: 描述内容宽度<br> anchorPoint: 锚点<br>formatWay: 设置为1 解析富文本格式: `<font></font>`[！否则默认解析老脚本富文本`<RText/FCOLOR=254>`]
---@param data   table
function SL:OpenCommonDescTipsUI(data) end;

---关闭通用描述Tips
function SL:CloseCommonDescTipsUI() end;

---打开通用弹窗
---* data   str: 文本<br>btnType: 按钮类型 int 1:&quot;确定&quot; 2:{&quot;确定&quot;,&quot;取消&quot;} <br> btnDesc: 按钮描述 table<br> showEdit: 是否显示输入框<br>editParams: 输入框参数table <br>```{ inputMode: 键盘编辑类型, maxLength: 可输入最大长度, str: 默认文本内容}```<br> callback: 按钮回调 [参数1: 点击的按钮id 参数2: 额外参数 table: {editStr=输入框字符串}]
---@param data   table
function SL:OpenCommonTipsUI(data) end;

---关闭通用弹窗
function SL:CloseCommonTipsUI() end;

---打开道具拆分弹窗
---* itemData   物品数据
---@param itemData   table
function SL:OpenItemSplitPop(itemData) end;

---关闭道具拆分弹窗
function SL:CloseItemSplitPop() end;

---打开网址/链接
---* url   网址/链接
---@param url   string
function SL:OpenURL(url) end;

---表中的对应 id 的颜色转换成 RGB 格式
---* id   cfg_colour_style 表中的对应 id
---@param id   number
---@return table {r = 255, g = 255, b = 255}
function SL:GetColorByStyleId(id) end;

---表中的对应 id 的颜色转换成 16进制 格式
---* id   cfg_colour_style 表中的对应 id
---@param id   number
---@return string  16进制 格式
function SL:GetHexColorByStyleId(id) end;

---表中的对应 id 的颜色大小
---* id   cfg_colour_style 表中的对应 id
---@param id   number
---@return number size
function SL:GetSizeByStyleId(id) end;

---Color3B颜色转化为hex 16进制
---* color3B   例: {r = 255, g = 255, b = 255}
---@param color3B   table
---@return string 16进制 &quot;#FFFFFF&quot;
function SL:GetColorHexFromRGB(color3B) end;

---播放按钮点击音效
function SL:PlayBtnClickAudio() end;

---播放音效
---* id   cfg_sound表对应id
---* isLoop 是否循环
---@param id   number
---@param isLoop? boolean
function SL:PlaySound(id, isLoop) end;

---播放登陆-选角音效
function SL:PlaySelectRoleAudio() end;

---播放开宝箱音效
function SL:PlayOpenBoxAudio() end;

---播放宝箱内选中音效
function SL:PlayFlashBoxAudio() end;

---停止音效
---* id   cfg_sound表对应id
---@param id   number
function SL:StopSound(id) end;

---停止所有音效
function SL:StopAllAudio() end;

---发送[普通消息]到聊天
---* msg  	    消息内容
---* channel    设置频道, 不设置默认当前聊天频道
---@param msg  	    string
---@param channel    number
function SL:RequestSendChatNormalMsg(msg, channel) end;

---发送[系统提示]到聊天框
---* msg 提示内容
---* FColor 字体颜色ID
---* BColor 背景颜色ID
---@param msg string
---@param fcolor number
---@param bcolor number
function SL:ShowSystemChat(msg, fcolor, bcolor) end;

---发送[装备]到聊天
---* channel    设置频道, 不设置默认当前聊天频道
---@param channel    number
function SL:RequestSendChatEquipMsg(channel) end;

---新增本地掉落消息到聊天
---* data  	    Msg: 掉落内容富文本<br> FColor: 字体颜色ID <br> BColor: 背景颜色ID <br> dropType: 掉落分类ID (1-10)
---@param data  	    table
function SL:AddDropChatMsgShow(data) end;

---资源下载
---* path        保存的文件路径
---* url         下载资源地址
---* downloadCB  回调函数
---@param path        string
---@param url         string
---@param downloadCB  function
function SL:DownLoadRes(path, url, downloadCB) end;

---小地图资源下载
---* mapId       小地图Id
---* callback    回调函数
---@param mapId       number
---@param callback    function
function SL:DownloadMiniMapRes(mapId, callback) end;

---删除GM缓存资源
---* filePath        文件路径
---@param filePath        string
function SL:RemoveGMResFile(filePath) end;

---快速选择目标
---* data  type:<br>&amp;emsp;0: 玩家<br>&amp;emsp;50: 怪物<br>&amp;emsp;400: 英雄<br>imgNotice: 没有目标时是否创建范围圈<br>systemTips: 没有目标时是否弹提示
---@param data  table
function SL:QuickSelectTarget(data) end;

---控件加入到元变量自动刷新的组件
---* metaValue  传入已配置元变量的字符串 <br>&amp;<元变量KEY/参数>&amp; <br>例 : <br> 红点变量U91: &amp;<REDKEY/U91>&amp; <br>角色名: &amp;<USER_NAME>&amp;
---* widget 文本控件 Text
---@param metaValue  string
---@param widget userdata
function SL:CustomAttrWidgetAdd(metaValue, widget) end;

---检测控件是否可视
---* node 控件
---* touchPos 当前接触坐标
---@param node userdata
---@param touchPos table
---@return boolean 控件是否可视
function SL:CheckNodeCanCallBack(node, touchPos) end;

---添加提升按钮
---* id  按钮id 必须唯一!!!! (同脚本命令加的id也不能重复)
---* name 按钮展示文本
---* func 点击按钮跳转函数
---@param id  number
---@param name string
---@param func function
function SL:AddUpgradeBtn(id, name, func) end;

---删除提升按钮
---* id  按钮id 必须唯一!!!! (同脚本命令加的id也不能重复)
---@param id  number
function SL:RemoveUpgradeBtn(id) end;

---模拟左键点击事件
---* widget    控件对象
---@param widget    userdata
function SL:WinClick(widget) end;

---世界坐标转化为地图坐标
---* worldX  世界坐标X
---* worldY  世界坐标Y
---@param worldX  number
---@param worldY  number
---@return number 地图坐标
function SL:ConvertWorldPos2MapPos(worldX, worldY) end;

---地图坐标转化为世界坐标
---* mapX  地图坐标X
---* mapY  地图坐标Y
---* centerOfGrid  是否在地图格中心
---@param mapX  number
---@param mapY  number
---@param centerOfGrid? boolean
---@return number 世界坐标
function SL:ConvertMapPos2WorldPos(mapX, mapY, centerOfGrid) end;

---世界坐标转化为屏幕坐标
---* worldX  世界坐标X
---* worldY  世界坐标Y
---@param worldX  number
---@param worldY  number
---@return number 屏幕坐标
function SL:ConvertWorldPos2Screen(worldX, worldY) end;

---屏幕坐标转化为世界坐标
---* screenX  屏幕坐标X
---* screenY  屏幕坐标Y
---@param screenX  number
---@param screenY  number
---@return number 世界坐标
function SL:ConvertScreen2WorldPos(screenX, screenY) end;

---打开QQ
function SL:RequestOpenQQ() end;

---加QQ
---* id  QQ号
---@param id  number
function SL:RequestJoinQQ(id) end;

---加QQ群
---* key  QQ群key
---@param key  number
function SL:RequestJoinQQGroup(key) end;

---打开微信
function SL:RequestOpenWX() end;

---添加地图特效
---* ID        该地图特效标识 必须唯一!!!!
---* mapID     添加到的地图ID
---* sfxId     特效ID
---* x         地图坐标X
---* y         地图坐标Y
---* loop      是否循环播放特效, 不填默认循环播放
---* showType  显示位置 0:在后面 1: 在前面
---@param ID        number
---@param mapID     string
---@param sfxId     number
---@param x         number
---@param y         number
---@param loop      boolean
---@param showType  number
function SL:AddMapSpecialEffect(ID, mapID, sfxId, x, y, loop, showType) end;

---删除地图特效
---* ID        该地图特效标识 必须唯一!!!!
---* mapID     添加到的地图ID
---@param ID        number
---@param mapID     string
function SL:RmvMapSpecialEffect(ID, mapID) end;

---添加Actor特效
---* actorID   玩家id
---* sfxID     特效ID
---* isFront   是否在模型前 默认在前面
---* offX      x偏移
---* offY      y偏移
---@param actorID   number
---@param sfxID     number
---@param isFront   boolean
---@param offX      number
---@param offY      number
function SL:AddActorEffect(actorID, sfxID, isFront, offX, offY) end;

---删除Actor特效
---* actorID   玩家id
---* sfxID     特效ID
---@param actorID   number
---@param sfxID     number
function SL:RmvActorEffect(actorID, sfxID) end;

---强攻
function SL:RequestForceAttack() end;

---拉起充值
---* payWay  1 支付宝 2 花呗 3 微信 -1不选择(手机端接入SDK不选择支付渠道)
---* currencyID 货币ID
---* price 支付金额
---* productIndex 商品索引/商品ID
---@param payWay  number
---@param currencyID number
---@param price number
---@param productIndex number
function SL:RequestPay(payWay, currencyID, price, productIndex) end;

---兑换激活码
---* cdk  激活码
---@param cdk  string
function SL:RequestCDK(cdk) end;

---请求改变PK模式
---* pkmode  pk模式
---@param pkmode  number
function SL:RequestChangePKMode(pkmode) end;

---请求改变宠物战斗模式
---* pkmode  宝宝模式
---@param pkmode  number
function SL:RequestChangePetPKMode(pkmode) end;

---请求从仓库取出道具
---* data   道具数据
---@param data  table
function SL:RequestPutOutStorageData(data) end;

---请求道具放入仓库
---* data   道具数据
---@param data  table
function SL:RequestSaveItemToNpcStorage(data) end;

---请求使用道具
---* itemData   道具数据
---@param itemData  table
function SL:RequestUseItem(itemData) end;

---请求使用英雄道具
---* itemData   道具数据
---@param itemData  table
function SL:RequestUseHeroItem(itemData) end;

---拆分道具
---* data  道具数据
---* num   数量
---@param data  table
---@param num   number
function SL:RequestSplitItem(data, num) end;

---拆分道具(英雄)
---* data  道具数据
---* num   数量
---@param data  table
---@param num   number
function SL:RequestSplitHeroItem(data, num) end;

---请求购买商品
---* index  商品Index
---* count    购买数量
---@param index  number
---@param count   number
function SL:RequestStoreBuy(index, count) end;

---召唤英雄或收回
function SL:RequestCallOrOutHero() end;

---请求玩家首饰盒状态
function SL:RequestOpenPlayerBestRings() end;

---请求英雄首饰盒状态
function SL:RequestOpenHeroBestRings() end;

---请求宠物锁定
---* targetID  目标宠物ID
---@param targetID  number
function SL:RequestLockPetID(targetID) end;

---请求取消宠物锁定
---* targetID  目标宠物ID
---@param targetID  number
function SL:RequestUnLockPetID(targetID) end;

---释放技能
---* skillID  技能ID
---@param skillID  number
function SL:RequestLaunchSkill(skillID) end;

---请求施法合击
function SL:RequestMagicJointAttack() end;

---查看目标玩家信息
---* targetID  目标ID
---* notForbid 是否不判断地图禁止查看
---@param targetId  number
---@param notForbid boolean
function SL:RequestLookPlayer(targetId, notForbid) end;

---请求开关开关型技能
---* skillID  技能ID
---@param skillID  number
function SL:RequestOnOffSkill(skillID) end;

---请求行会申请列表
function SL:RequestGuildAllyApplyList() end;

---拒绝行会结盟申请
---* guildID  行会ID
---@param guildID  number
function SL:RequestGuildRejectAllyApply(guildID) end;

---请求行会成员列表
function SL:RequestGuildMemberList() end;

---请求世界行会列表
---* page  分页id
---@param page  number
function SL:RequestWorldGuildList(page) end;

---邀请玩家入会
---* uid  玩家id
---@param uid  number
function SL:RequestGuildInviteMember(uid) end;

---踢出行会
---* uid  玩家id
---@param uid  number
function SL:RequestSubGuildMember(uid) end;

---任命行会职位
---* uid  玩家id
---* rank 职位id 1-5
---@param uid  number
---@param rank number
function SL:RequestGuildAppointRank(uid, rank) end;

---请求创建队伍
function SL:RequestCreateTeam() end;

---邀请玩家入队
---* uid  玩家id
---* name 玩家昵称
---@param uid?  number
---@param name? string
function SL:RequestInviteJoinTeam(uid, name) end;

---拒绝组队邀请
---* uid  玩家id
---@param uid  number
function SL:RequestRefuseTeamInvite(uid) end;

---同意组队邀请
function SL:RequestAgreeTeamInvite(uid) end;

---同意申请入队
---* uid  玩家id
---@param uid  number
function SL:RequestApplyAgree(uid) end;

---请求入队申请列表
function SL:RequestApplyData() end;

---请求附近队伍
function SL:RequestNearTeam() end;

---请求加入队伍
---* uid  队长id
---@param uid  number
function SL:RequestApplyJoinTeam(uid) end;

---离开队伍
function SL:RequestLeaveTeam() end;

---保存允许组队状态
---* TEAM_STATUS_PERMIT   允许组队状态
---* status   1允许 0不允许
---@param TEAM_STATUS_PERMIT  string
---@param status  number
function SL:SetValue(TEAM_STATUS_PERMIT, status) end;

---踢出队伍
---* uid  玩家id
---@param uid  number
function SL:RequestSubTeamMember(uid) end;

---移交队长
---* uid  玩家id
---@param uid  number
function SL:RequestTransferTeamLeader(uid) end;

---请求进行交易
---* uid  玩家id
---@param uid  number
function SL:RequestTrade(uid) end;

---请求好友列表
function SL:RequestFriendList() end;

---请求添加好友
---* uname 玩家昵称
---@param uname string
function SL:RequestAddFriend(uname) end;

---删除好友
---* uid  玩家id
---@param uid  number
function SL:RequestDelFriend(uid) end;

---好友加到黑名单
---* uname 玩家昵称
---@param uname string
function SL:RequestAddBlacklistByName(uname) end;

---移出黑名单
---* uid  玩家id
---@param uid  number
function SL:RequestOutBlacklist(uid) end;

---同意好友申请
---* uname 玩家昵称
---@param uname string
function SL:RequestAgreeFriendApply(uname) end;

---清空好友申请列表
function SL:RequestClearFriendApplyList() end;

---请求获取邮件列表 一次十条
function SL:RequestMailList() end;

---删除已读邮件
function SL:RequestDelReadMail() end;

---读邮件
---* mailId 邮件ID
---@param mailId number
function SL:RequestReadMail(mailId) end;

---删除邮件
---* mailId 邮件ID
---@param mailId number
function SL:RequestDelMail(mailId) end;

---邮件全部提取
function SL:RequestGetAllMailItems() end;

---邮件提取
---* mailId 邮件ID
---@param mailId number
function SL:RequestGetMailItems(mailId) end;

---请求拍卖行上架列表
---* listType 1: 表示查询自己上架的物品，2: 表示查询参与过的
---@param listType number
function SL:RequestAuctionPutList(listType) end;

---拍卖行请求上架
---* makeindex 物品唯一ID
---* count     数量
---* bidPrice  竞拍价格
---* buyPrice  一口价
---* currencyID 货币ID
---* rebate    折扣
---@param makeindex number
---@param count     number
---@param bidPrice  number
---@param buyPrice  number
---@param currencyID number
---@param rebate    number
function SL:RequestAuctionPutin(makeindex, count, bidPrice, buyPrice, currencyID, rebate) end;

---拍卖行请求下架
---* makeindex 物品唯一ID
---@param makeindex number
function SL:RequestAuctionPutout(makeindex) end;

---拍卖行请求重新上架
---* makeindex 物品唯一ID
---* count     数量
---* bidPrice  竞拍价格
---* buyPrice  一口价
---* currencyID 货币ID
---* rebate    折扣
---@param makeindex number
---@param count     number
---@param bidPrice  number
---@param buyPrice  number
---@param currencyID number
---@param rebate    number
function SL:RequestAuctionRePutin(makeindex, count, bidPrice, buyPrice, currencyID, rebate) end;

---拍卖行请求竞价
---* makeindex 物品唯一ID
---* price     竞拍价
---@param makeindex number
---@param price     number
function SL:RequestAuctionBid(makeindex, price) end;

---拍卖行请求领取竞拍成功物品
---* makeindex 物品唯一ID
---@param makeindex number
function SL:RequestAcquireBidItem(makeindex) end;

---请求排行榜数据
---* type 类别ID
---* selectType 选择类别
---@param type number
---@param selectType number
function SL:RequestRankData(type, selectType) end;

---请求玩家排行榜数据
---* userID   玩家ID
---* type 玩家/英雄 1玩家 2英雄
---@param userID   number
---@param type number
function SL:RequestPlayerRankData(userID, type) end;

---提交任务
---* missionID 任务ID
---@param missionID number
function SL:RequestSubmitMission(missionID) end;

---请求玩家称号数据
function SL:RequestTitleList() end;

---请求取下称号
function SL:RequestDisboardTitle() end;

---请求激活称号
---* titleId 称号id
---@param titleId number
function SL:RequestActivateTitle(titleId) end;

---切换英雄状态
---* type  状态值
---@param type  number
function SL:RequestChangeHeroMode(type) end;

---请求英雄称号数据
function SL:RequestTitleList_Hero() end;

---英雄请求取下称号
function SL:RequestDisboardTitle_Hero() end;

---英雄请求激活称号
---* titleId  称号id
---@param titleId  number
function SL:RequestActivateTitle_Hero(titleId) end;

---通知服务端 英雄时装显示开关
---* type  2 : 设置显示神魔<br> 1 : 设置时装显示
---@param type  number
function SL:SendSuperEquipSetting_Hero(type) end;

---英雄请求锁定目标
---* actorID  actorID
---* isPlayer 是否人物
---@param actorID  number
---@param isPlayer boolean
function SL:RequestLockTargetByHero(actorID, isPlayer) end;

---英雄取消锁定
function SL:RequestCancelLockByHero() end;

---请求合成
---* compoundID      合成ID
---@param compoundID      number
function SL:ResquestCompoundItem(compoundID) end;

---请求敏感词检测
---* str   需要检测的文本
---* type 文本类型 <br> 1 : 昵称类<br> 2 : 聊天类<br> 3 : 行会公告
---* callback  检测完毕的回调事件<br> 事件传入参数: param1: boolean 能否通过 param2: 文本
---@param str  string
---@param type number
---@param callback function
function SL:RequestCheckSensitiveWord(str, type, callback) end;

---邀请上马
---* uid  玩家id
---@param uid  number
function SL:RequestInvitePlayerInHorse(uid) end;

---请求地图组队成员数据
function SL:RequestMiniMapTeam() end;

---请求地图怪物数据
function SL:RequestMiniMapMonsters() end;

---请求内功技能数据
---* isHero   是否请求英雄
---@param isHero  boolean
function SL:RequestInternalSkillData(isHero) end;

---请求经络穴位激活
---* typeID  经络ID
---* aucPointID 穴位ID
---* isHero  是否请求英雄
---@param typeID  number
---@param aucPointID number
---@param isHero  boolean
function SL:RequestAucPointOpen(typeID, aucPointID, isHero) end;

---修炼经络
---* typeID  经络ID
---* isHero   是否请求英雄
---@param typeID  number
---@param isHero  boolean
function SL:RequestMeridianLevelUp(typeID, isHero) end;

---设置连击技能
---* key      键位 (1, 2, 3, 4)
---* skillID 技能ID
---* isHero   是否请求英雄
---@param key     number
---@param skillID number
---@param isHero  boolean
function SL:RequestSetComboSkill(key, skillID, isHero) end;

---请求设置内功条前置开关 并刷新显示
---* show     是否开启 默认true
---@param show     boolean
function SL:RequestNGHudShow(show) end;

---请求获取宝箱物品奖励
function SL:RequestGetGoldBoxReward() end;

---请求再开启宝箱
function SL:RequestOpenGoldBox() end;

---请求确认加属性点
---* data      加点数据table `{&quot;Bonus&quot;:[{&quot;id&quot;:1,&quot;value&quot;:1}, ...]}`
---* m_nBonusPoint  剩余加点数
---@param data     table
---@param m_nBonusPoint number
function SL:RequestAddReinAttr_N(data, m_nBonusPoint) end;

---请求求购数据
---* data      请求参数
---@param data     table
function SL:RequestPurchaseItemList(data) end;

---请求求购出售物品
---* data      请求参数 {guid = 求购列表标识id, qty = 出售数量}
---@param data     table
function SL:RequestPurchaseSell(data) end;

---请求上架求购物品
---* data      请求参数
---@param data     table
function SL:RequestPurchasePutIn(data) end;

---请求下架求购物品
---* guid  求购列表标识id, 不填则全部下架
---@param guid  number
function SL:RequestPurchasePutOut(guid) end;

---请求取出求购已收物品
---* guid  求购列表标识id, 不填则全部取出
---@param guid  number
function SL:RequestPurchaseTakeOut(guid) end;

---请求点击NPC
---* npcID  NPCID
---@param npcID  number
function SL:RequestNPCTalk(npcID) end;

MAIL_CURRENT_ID = '设置当前邮件ID'
BAG_PAGE_CUR = '设置当前选中的背包页'
CHAT_CHANNEL_RECEIVIND = '切换聊天频道接收状态'
CUR_CHAT_CHANNEL = '当前聊天频道'
SETTING_VALUE = '设置的数据'
SETTING_PICK_VALUE = '设置捡物品数据'
SETTING_PICK_GROUP_VALUE = '设置捡物品组数据'
SETTING_RANK_DATA = '设置排序相关数据'
SETTING_BOSS_REMIND_TYPE = '设置boss提示类型'
SETTING_BOSS_REMIND_VALUE = '设置boss提示值'
PLAYER_SUPEREQUIP_SHOW = '角色面板时装显示开关'
HERO_SUPEREQUIP_SHOW = '英雄面板时装显示开关'
SKILL_KEY = '设置技能快捷键'
HERO_GUARD_ISCLICK = '是否点击英雄守护按钮'
HERO_ACTIVES_STATES = '英雄激活的状态列表'
COMPOUND_OPEN_ID = '合成打开的ID'
SELECT_TARGET_ID = '选择目标ID'
ATTACK_STATE = 'PC锁定攻击状态'
FUNCDOCK_PARAM = '功能菜单参数设置'
CLIPBOARD_TEXT = '设置剪贴板文本'
DROPITEM_FLY_WORLD_POSITION = '设置 自动拾取-掉落物-飞向的世界坐标'
QUICK_USE_NUM = '设置快捷栏个数'
GUIDE_EVENT_BEGAN = '特定状况引导事件开始通知'
GUIDE_EVENT_END = '特定状况引导事件结束通知'
INTERNAL_SKILL_ONOFF = '设置人物内功技能开关'
WIN_DEVICE_SIZE = '修改PC端屏幕分辨率'
STALL_SELECT_ID = '摆摊设置选中的物品唯一ID'
TEAM_STATUS_PERMIT = '设置允许组队状态'
ADD_STATUS_PERMIT = '设置允许添加状态'
DEAL_STATUS_PERMIT = '设置允许交易状态'
SHOW_STATUS_PERMIT = '设置允许显示状态'
TURN_DIR = '设置转向方向'
SELECT_SHIFT_ATTACK_ID = '设置PC持续攻击目标ID'
CHAT_DROP_TYPE_IS_RECEIVE = '设置是否接收该分类掉落信息'
AUTOUSE_MAKEINDEX_BY_POS = '添加自动使用弹窗'
SCREEN_WIDTH = '屏幕宽'
SCREEN_HEIGHT = '屏幕高'
NOTCH_PHONE_INFO = '是否刘海屏'
PLATFORM_ANDROID = '安卓平台'
PLATFORM_IOS = 'iOS平台'
PLATFORM_WINDOWS = 'Windows平台'
PLATFORM_MOBILE = '手机平台(包含安卓和iOS)'
WINPLAYMODE = 'PC操作模式'
IS_PC_PLAY_MODE = '是否PC操作模式, 等同WINPLAYMODE'
CURRENT_OPERMODE = '操作模式(PC=1, 手机=2)'
GAME_ID = '游戏ID'
CHANNEL_ID = '渠道ID'
PACKAGE_NAME = 'APK包名'
VERSION_NAME = 'APK版本名'
VERSION_CODE = 'APK版本号'
LOCAL_RES_VERSION = '原始/本地客户端版本号'
REMOTE_RES_VERSION = '热更客户端版本号'
REMOTE_GM_RES_VERSION = 'GM资源版本号'
DEVICE_UNIQUE_ID = 'PC唯一设备ID'
PROMOTE_ID = '推广员ID'
FPS = '游戏帧率'
NET_TYPE = '网络类型'
BATTERY = '手机电量'
GAME_DATA = '获取cfg_game_data配置'
IS_SDK_LOGIN = '是否是SDK登录'
BOX996_LOGIN = '是否是996盒子登录'
CLOUD996_DEVICE = '是否是996云真机'
YIDUN_DATA = '获取易盾的反外挂数据'
SERVER_OPTION = '服务器开关'
SERVER_ID = '服务器ID'
SERVER_NAME = '服务器名字'
MAIN_SERVER_ID = '主服务器ID'
RES_VERSION = '资源版本'
UID = '账号ID'
LOGIN_DATA = '登录角色信息'
RESTORE_ROLES = '可恢复角色信息'
SERVER_VALUE = '服务端下发的变量值'
CURRENT_TALK_NPC_ID = '获取当前对话NPC的ID'
CURRENT_TALK_NPC_TYPEINDEX = '获取当前对话NPC的Index'
CURRENT_TALK_NPC_LAYER = '获取当前打开的NPC面板(txt面板)'
M2_FORBID_SAY = 'M2是否禁止说话'
MAP_ID = '地图ID'
MAP_NAME = '地图名字'
MAP_DATA_ID = '地图数据ID'
MINIMAP_ID = '小地图ID'
IN_SAFE_AREA = '是否是安全区域'
MAP_FORBID_LEVEL_AND_JOB = '是否禁止职业和等级'
MAP_FORBID_SAY = '是否禁止说话'
MAP_SHOW_HPPER = '是否血量显示百分比'
MAP_FORBID_LOOK = '是否禁止查看'
MAP_FORBID_LAUNCH_SKILL = '是否禁止释放某技能'
MINIMAP_ABLE = '小地图资源是否有效'
MAP_DATA_LOADED = '地图map文件是否加载(false表示正在下载中)'
MAP_ROWS = '地图横向格子数'
MAP_COLS = '地图纵向格子数'
MINIMAP_FILE = '获取小地图文件路径'
MAP_SIZE_WIDTH_PIXEL = '地图获取宽度像素'
MAP_SIZE_HEIGHT_PIXEL = '地图获取高度像素'
MAP_IS_OBSTACLE = '获取地图格子是否是阻挡'
MAP_PATH_SIZE = '地图计算起点到终点X或者Y 变化最大的差值'
MAP_PATH_POINTS = '地图计算路径坐标'
MAP_CURRENT_PATH_INDEX = '地图获取当前路径坐标index'
MAP_PLAYER_POS = '地图获取人物坐标'
MAP_GET_MONSTERS = '地图获取怪物列表位置等信息'
MAP_GET_PORTALS = '地图获取传送点列表位置等信息'
FIND_IN_VIEW_PLAYER_LIST = '获取视野内玩家列表'
FIND_IN_VIEW_MONSTER_LIST = '获取视野内怪物列表'
FIND_IN_VIEW_NPC_LIST = '获取视野内NPC列表'
IN_SIEGE_AREA = '是否在攻城区域'
PET_ALIVE = '是否有存活的宝宝'
PET_LOCK_ID = '宠物锁定的目标ID'
USEHERO = '是否开启英雄'
HERO_IS_ALIVE = '是否召唤英雄'
HERO_IS_ACTIVE = '是否激活英雄'
HERO_ID = '英雄ID'
HERO_STATES_SYS_VALUES = '英雄状态系统能设置的列表'
HERO_ACTIVES_STATES = '英雄激活的状态列表'
HERO_STATE = '获取英雄状态'
HERO_GUARDSTATE = '获取英雄守护状态'
HERO_GUARD_ISCLICK = '是否点击守护按钮'
MONEY = '获取货币数量'
MONEY_ASSOCIATED = '获取货币数量(包括 等价替换道具的数量)'
STD_ITEMS = '获取所有道具信息'
ITEM_DATA = '根据道具index获取道具信息'
ITEM_COUNT = '根据道具index或者名字获取道具数量'
ITEM_NAME = '根据道具index获取道具名字'
ITEM_INDEX_BY_NAME = '根据道具名字获取道具index'
ITEM_NAME_COLOR = '获取道具名字颜色'
ITEM_NAME_COLOR_VALUE = '道具名字颜色,”#FFFFFF”格式'
ITEM_NAME_COLORID = '道具名字颜色ID, 颜色表ID'
ITEM_PROMPT_DATA = '道具表prompt解析后数据'
ITEM_CUSTOM_ATTR = '获取物品自定义属性数据'
ITEM_IS_BIND = '物品是否绑定'
EQUIP_DATA_BY_MAKEINDEX = '根据MakeIndex获取装备数据'
STORAGE_DATA_BY_MAKEINDEX = '根据MakeIndex获取仓库数据'
QUICKUSE_DATA_BY_MAKEINDEX = '根据MakeIndex获取快捷栏数据'
LOOKPLAYER_DATA_BY_MAKEINDEX = '根据MakeIndex获取查看他人装备数据'
QUICKUSE_DATA = '获取快捷使用数据'
CHECK_USE_ITEM_BUFF = '检查禁止使用物品buff'
ITEM_CAN_AUTOUSE = '物品能否自动使用'
SKILLBOOK_CAN_USE = '技能书能否使用'
ITEM_BELONG_BY_MAKEINDEX = '根据MakeIndex获取物品归属'
BAG_MAKEINDEX_BY_POS = '获取背包物品唯一ID'
ITEM_ARTICLE_ENUM = '物品规则类型枚举'
ITEM_SCALE = '道具框默认缩放'
BATTLE_IS_AFK = '是否自动挂机中'
BATTLE_AFK_BEGIN = '开始自动挂机'
BATTLE_AFK_END = '结束自动挂机'
BATTLE_IS_AUTO_MOVE = '是否自动寻路中'
BATTLE_MOVE_BEGIN = '开始自动寻路'
BATTLE_MOVE_END = '结束自动寻路'
BATTLE_IS_AUTO_PICK = '是否自动捡物中'
BATTLE_PICK_BEGIN = '开始自动捡物'
BATTLE_PICK_END = '结束自动捡物'
USER_ID = '主玩家actorID'
ACTOR_IS_PLAYER = '是否是玩家'
ACTOR_IS_NETPLAYER = '是否是网络玩家'
ACTOR_IS_MONSTER = '是否是怪物'
ACTOR_IS_NPC = '是否是NPC'
ACTOR_IS_HERO = '是否是英雄'
ACTOR_IS_HUMAN = '是否是人形怪'
ACTOR_NAME = '获取actor 名字'
ACTOR_HP = '获取 actor Hp'
ACTOR_MAXHP = '获取actor Max Hp'
ACTOR_MP = '获取actor Mp'
ACTOR_MAXMP = '获取actor Max Mp'
ACTOR_LEVEL = '获取actor等级'
ACTOR_JOB_ID = '获取actor职业'
ACTOR_SEX = '获取actor性别'
ACTOR_IS_DEATH = 'actor是否死亡'
ACTOR_OWNER_ID = '获取actor归属ID'
ACTOR_OWNER_NAME = '获取actor归属名字'
ACTOR_BIGICON_ID = '获取怪物大图标ID'
SELECT_TARGET_ID = '选中的目标actorID或者怪物归属者'
TARGET_ATTACK_ENABLE = '检查该目标是否可以攻击'
ACTOR_TEAM_STATE = '获取actor组队状态'
ACTOR_GUILD_ID = '获取actor行会ID'
ACTOR_GUILD_NAME = '获取actor行会名字'
ACTOR_TYPE_INDEX = '获取actor的typeIndex'
ACTOR_DIR = '获取actor方向'
ACTOR_MAP_X = '获取actor地图坐标X'
ACTOR_MAP_Y = '获取actor地图坐标Y'
ACTOR_POSITION_X = '获取actor世界坐标X'
ACTOR_POSITION_Y = '获取actor世界坐标Y'
ACTOR_MASTER_ID = '获取actor主人ID'
ACTOR_HAVE_MASTER = '获取actor是否有主人'
ACTOR_FACTION = '获取actor阵营ID'
ACTOR_IN_SAFE_ZONE = '获取actor是否在安全区'
ACTOR_APPR_ID = '获取actor的外观ID'
ACTOR_MOUNT_NODE = '获取actor挂接点'
ACTOR_CAN_LOCK_BY_HERO = '检查英雄选中的目标是否能锁定'
ACTOR_PKLV = '获取actor红名灰名'
ACTOR_SERVER_ID = '获取actor区服ID, 跨服时使用'
ACTOR_IS_IN_STALL = 'actor是否在摆摊'
ACTOR_STALL_NAME = '获取actor摆摊名'
ACTOR_IS_OFFLINE = '获取actor是否是离线状态玩家'
ACTOR_IS_MYSTERY_MAN = 'actor是否是神秘人'
ACTOR_IS_HUSHEN = '获取actor是否拥有护身'
ACTOR_IS_MAINPLAYER = 'actor是否是主玩家'
ACTOR_NATION_ID = '获取actor国家ID'
ACTOR_HORSE_MASTER_ID = '获取actor坐骑的主驾ID'
ACTOR_HORSE_COPILOT_ID = '获取actor坐骑的副驾ID'
ACTOR_IS_HORSE_COPILOT = 'actor是否是坐骑的副驾'
ACTOR_IS_DOUBLE_HORSE = 'actor是否是双人坐骑'
ACTOR_IS_BODY_HORSE = 'actor是否是连体坐骑'
ACTOR_MOVE_EFFECT = '获取actor的足迹特效ID'
ACTOR_DEAR_ID = '获取actor的夫妻ID'
ACTOR_MENTOR_ID = '获取actor的师徒ID'
ACTOR_NEAR_SHOW = '获取actor是否在附近显示'
ACTOR_IS_MOVE = '获取actor是否在移动状态'
ACTOR_IS_HORSEBACK_RADING = 'actor是否是骑马状态'
ACTOR_STOME_MODE = '获取actor(怪物)是否石化状态'
ACTOR_RACE_SERVER = '获取actor(怪物) race server'
ACTOR_RACE_IMG = '获取actor(怪物) race img'
ACTOR_HIDE_NAME = '获取actor(怪物)是否不显示名字'
ACTOR_HIDE_HP_BAR = '获取actor(怪物)是否不显示血条'
ACTOR_NATION_ENEMY_PK = '获取actor(怪物)国家模式是否可被攻击'
ACTOR_GM_DATA = '获取actor的GM自定义数据'
ACTOR_IS_BORN = 'actor是否出生'
ACTOR_IS_CAVE = 'actor是否钻回洞穴'
ACTOR_BUFF_DATA = 'actor身上所有buff数据'
ACTOR_HAS_ONE_BUFF = 'actor是否有某个buff'
ACTOR_BUFF_DATA_BY_ID = '获取actor身上某个buff数据'
PKMODE = '获取当前PK模式'
PKMODE_CAN_USE = '该PK模式是否可以切换'
PET_PKMODE = '获取宠物PK模式'
PET_ALIVE = '是否有存活的宝宝'
PET_LOCK_ID = '宠物锁定的目标ID'
KFSTATE = '是否处于跨服'
SERVER_TIME = '当前服务器时间'
X = '人物当前坐标X'
Y = '人物当前坐标Y'
BUBBLETIPS_INFO = '根据气泡index获取气泡数据'
BONUSPOINT = '转生属性点'
IS_PICK_STATE = '是否是自动拾取状态'
PC_POS_Y = 'PC端Y轴适配'
SCREEN_WIDTH = '获取该组界面配置信息'
DARK_STATE = '黑夜当前状态'
UIMODEL_HAIR_OFFSET = '内观头发偏移配置'
UIMODEL_EQUIP_OFFSET = '内观装备偏移配置'
TOUCH_STATE = '屏幕点击状态'
BEST_RING_WIN_ISOPEN = '首饰盒界面是否打开'
BEST_RING_OPENSTATE = '首饰盒开启状态'
CHECK_FUNCBTN_SHOW = '检查当前类别功能菜单的某种按钮是否显示'
MOUSE_MOVE_POS = '鼠标移动位置'
CHECK_MINIMAP_OPEN = '小地图界面是否打开'
TRADINGBANK_OPENSTATUS = '交易行开启状态'
OPEN_SERVER_TIME = '开服时间戳'
OPEN_SERVER_DAY = '开服天数'
MERGE_SERVER_COUNT = '合服次数'
MERGE_SERVER_TIME = '合服时间戳'
MERGE_SERVER_DAY = '合服天数'
BUFF_CONFIG = '获取buffID的配置表数据'
SHOW_STATUS_PERMIT = '允许在附近显示状态'
TARGET_MAPPOS_DIR = '获取目标地图坐标到初始地图坐标的方向'
CHECK_REDPOINT_ID = '检测红点表对应id是否满足条件'
CTRL_PRESSED = 'PC端 CTRL键是否按下'
PC_NP_STATUS = 'PC端 是否开启NP反外挂'
SELECT_SHIFT_ATTACK_ID = '获取PC持续攻击目标'
IS_PICKABLE_DROPITEM = '掉落物是否可拾取'
AUTOUSE_MAKEINDEX_BY_POS = '获取已添加的自动使用弹窗物品唯一ID'
CHECK_IN_GUIDE = '是否在引导中'
PICK_ACTORID_BY_POS = 'PC 按坐标选中actor'
CHAT_EMOJI = '获取聊天表情包'
CHAT_INPUT_CACHE = '获取聊天输入历史记录缓存'
CHAT_SHOW_ITEMS = '获取聊天显示的道具'
CHAT_CHANNEL_IS_RECEIVE = '当前频道是否接受聊天信息'
CHAT_DROP_TYPE_IS_RECEIVE = '是否接收该分类掉落信息'
CHATANDTIPS_USE_FONT = '聊天 Tips使用的字体路径'
CHAT_CUR_CHAT_CHANNEL = '获取当前聊天频道'
CHAT_TARGETS = '获取聊天目标'
CHAT_CUR_CD_TIME = '获取当前聊天CD时间'
CHAT_IS_CLOSE_FAKE_DROP = '是否关闭假掉落'
TEAM_NEAR = '附近队伍列表'
TEAM_MEMBER_LIST = '队伍成员列表'
TEAM_MEMBER_COUNT = '当前队伍人数'
TEAM_MEMBER_MAX_COUNT = '队伍最大人数'
TEAM_IS_MEMBER = '是否是队伍成员'
TEAM_STATUS_PERMIT = '允许组队状态'
TEAM_APPLY = '入队申请列表'
DOCKTYPE_NENUM = 'func dock enum'
MAIL_LIST = '邮件列表'
MAIL_BY_ID = '根据邮件ID获取邮件'
MAIL_BY_ID = '当前邮件ID'
AUCTION_BIDPRICE_MIN = '默认最低竞拍价'
AUCTION_BIDPRICE_MAX = '默认最高竞拍价'
AUCTION_BUYPRICE_MIN = '默认最低一口价'
AUCTION_BUYPRICE_MAX = '默认最高一口价'
AUCTION_DEFAULT_SHELF = '默认货架数量'
AUCTION_PUT_LIST_CNT = '上架列表数量'
AUCTION_MONEY = '拍卖行货币'
AUCTION_CAN_BID = '是否可竞价'
AUCTION_CAN_BUY = '是否可一口价'
AUCTION_HAVE_MY_BIDDING = '是否有我的竞拍物品'
AUCTION_ITEM_STATE = '拍卖行物品状态'
AUCTION_MY_SHOW_LIST = '获取拍卖行我的展示可寄售道具'
FRIEND_MAX_COUNT = '最大好友人数'
FRIEND_INFO_BY_UID = '根据userID获取好友信息'
FRIEND_INFO_BY_NAME = '根据userName获取好友信息'
SOCIAL_IS_FRIEND = '是否是好友'
SOCIAL_IS_BLICKLIST = '是否在黑名单'
FRIEND_LIST = '获取好友列表'
FRIEND_BLACKLIST = '获取黑名单数据'
FRIEND_APPLYLIST = '好友申请列表'
ADD_STATUS_PERMIT = '允许添加状态'
GUILD_MEMBER_LIST = '行会成员列表'
GUILD_APPLY_LIST = '行会申请列表'
GUILD_ALLY_APPLY_LIST = '行会结盟申请列表'
GUILD_WORLD_LIST = '获取世界行会列表'
GUILD_CREATE = '获取创建公会消耗信息'
GUILD_INFO = '我的行会信息'
GUILD_OFFICIAL_NAME_BY_RANK = '获取行会职位名称'
GUILD_MEMBER_INFO = '通过uid获取行会成员信息'
TRADE_TARGET_ID = '交易的目标ID'
TRADE_TARGET_NAME = '交易的目标名字'
TRADE_TARGET_DATA = '要交易的玩家信息'
TRADE_MY_LOCK_STATUS = '交易自己锁定状态'
TRADE_TARGET_LOCK_STATUS = '交易对方锁定状态'
RANK_DATA_BY_TYPE = '根据页签index获取排行榜数据'
MISSION_ITEM_ORDER = '根据任务类型/ID获取任务排序值'
SKILL_INFO_FILTER = '筛选技能数据'
SKILL_NAME = '获取技能名字'
SKILL_ICON_PATH = '获取技能图标'
SKILL_RECT_ICON_PATH = '获取矩形技能图标'
SKILL_IS_ONOFF_SKILL = '是否是开关型技能'
SKILL_IS_ON_SKILL = '技能是否开启'
LEARNED_SKILLS = '获取已学技能'
SKILL_IS_ACTIVE = '是否是主动技能'
SKILL_DATA = '获取技能数据'
SKILL_TRAIN_DATA = '获取技能的等级熟练度数据'
SKILL_CONFIG = '获取技能配置'
SKILL_KEY = '获取技能快捷键'
SKILL_LEVEL = '获取技能等级'
MAX_BAG = '背包最大格子数量'
HERO_MAX_BAG = '英雄背包最大格子数量'
N_MAX_BAG = '仓库最大格子数量'
BAG_CUR_PAGE = '当前选中的背包页签'
BAG_IS_FULL = '背包是否满'
BAG_REMAIN_COUNT = '背包剩余格子数'
BAG_USED_COUNT = '背包已使用格子数'
BAG_CHECK_NEED_SPACE = '检测物品背包是否有富余格子数存放'
SETTING_ENABLED = '设置是否生效'
SETTING_VALUE = '获取设置的数据'
SETTING_CONFIG = '获取设置的配置'
SETTING_PICK_VALUE = '获取物品拾取设置'
SETTING_PICK_CONFIG = '可以拣的物品配置'
SETTING_IS_ITEM_PICK_CAN_SET = '物品是否可以设置'
SETTING_PICK_GROUP_VALUE = '拾取组的数据'
SETTING_MAPSCALE_PER = '通过值获取地图缩放对应百分比'
SETTING_MAPSCALE_VALUE = '通过百分比获取地图缩放值'
EQUIPMAP_BY_STDMODE = '装备Map'
EX_SHOWLAST_MAP = '除装备Map 显示持久的stdmode'
TIP_POSLIST_BY_STDMODE = '通过stdmode获取TIPS装备位列表'
IS_SAMESEX_EQUIP = '是否是该玩家性别装备'
CUSTOM_DESC = '对cfg_custpro_caption操作 根据key获取描述'
CUSTOM_ICON = '对cfg_custpro_caption操作 根据key获取图片id'
ATTR_CONFIG = '对cfg_att_score表操作 获取属性配置'
SUIT_CONFIG = '对cfg_suit表操作 获取对应套装id配置'
SUITEX_CONFIG = '对cfg_suitex表操作 获取对应套装id配置'
ITEMTYPE_ENUM = '物品类型'
ITEMTYPE = '根据道具数据获取物品类型'
CUST_ABIL_MAP = '自定义属性ID映射Map'
RECHARGE_PRODUCTS = '充值商品信息列表'
RECHARGE_PRODUCT_BY_ID = '通过商品Id获取商品信息'
IS_SDK_PAY = '是否接入第三方SDK'
STALL_SELL_SHOW_NAME = '获取购买摊位名字'
STALL_ONSELL_DATA = '获取购买摊位物品信息'
STALL_MYSELL_DATA = '获取我的摊位物品信息'
HAVE_GOLDBOX_OPENTIME = '是否还有重摇/开启次数'
IS_NEW_BOUNS = '是否启用新版属性加点'
NEW_BOUNS_CONFIG = '获取新版属性加点配置数据'
NEW_BOUNS_ADD_DATA = '获取新版属性已加点数据'
PURCHASE_FILTER_LIST = '世界求购菜单列表'
PURCHASE_CURRENCIES = '求购货币列表'
PURCHASE_MENU_CONFIG_BY_ID = '对应ID 菜单栏配置'
PURCHASE_ITEM_LIST_BY_TYPE = '分类物品列表'
USER_ID = '玩家ID'
USER_NAME = '玩家名字'
JOB = '玩家职业'
LEVEL = '玩家等级'
RELEVEL = '玩家转生等级'
JOB_NAME = '职业名字'
SEX = '玩家性别'
REAL_USER_NAME = '玩家真实姓名'
USER_NAME_COLOR = '玩家名字颜色值'
DIR = '人物方向'
USER_IS_DIE = '角色是否死亡'
USER_IS_CANREVIVE = '角色是否能复活'
HP = '当前血量'
MAXHP = '最大血量'
MP = '当前蓝量'
MAXMP = '最大蓝量'
BURST = '暴击几率'
BURST_DAM = '暴击伤害'
IMM_ATT = '物伤减免'
IMM_MAG = '魔伤减免'
LUCK = '幸运'
AC = '最小物防'
MAXAC = '最大物防'
MAC = '最小魔防'
MAXMAC = '最大魔防'
DC = '最小物理'
MAXDC = '最大物理'
MC = '最小魔法'
MAXMC = '最大魔法'
SC = '最小道术'
MAXSC = '最大道术'
HIT = '准确'
SPD = '敏捷'
EXP = '当前经验'
MAXEXP = '最大经验'
HITSPD = '攻速'
HW = '腕力'
MAXHW = '最大可穿戴腕力'
BW = '重量'
MAXBW = '玩家最大负重'
WW = '穿戴负重'
MAXWW = '最大穿戴负重'
HUNGER = '体力恢复'
DRESS = '获取玩家身上衣服的名字'
WEAPON = '获取玩家身上武器的名字'
RIGHTHAND = '获取玩家身上勋章的名字'
HELMET = '获取玩家身上头盔的名字'
NECKLACE = '获取玩家身上项链的名字'
RINGR = '获取玩家身上右戒指的名字'
RINGL = '获取玩家身上左戒指的名字'
ARMRINGR = '获取玩家身上右手镯的名字'
ARMRINGL = '获取玩家身上左手镯的名字'
BUJUK = '获取玩家身上护符、玉佩、宝珠的名字'
BELT = '获取玩家身上腰带的名字'
BOOTS = '获取玩家身上鞋子的名字'
CHARM = '获取玩家身上宝石的名字'
EQUIPBYPOS = '获取玩家某一装备位的装备名'
CUR_ABIL_BY_ID = '根据类型id获取属性值'
EQUIP_DATA = '获取玩家某一装备数据'
EQUIP_DATA_LIST = '获取玩家对应装备位数据列表'
EQUIP_EMBATTLE = '获取玩家法阵数据'
FEATURE = '玩家外观数据'
HAIR = '发型ID'
EQUIP_POS_DATAS = '获取装备位对应MakeIndex数据'
TITLES = '玩家的称号数据'
TITLE_DATA_BY_ID = '获取玩家对应ID的称号数据'
TITLE_ACTIVATE_ID = '玩家激活的称号id'
MAX_ABIL_BY_ID = '人物内功最大内力值'
CUR_ABIL_BY_ID = '人物内功当前内力值'
CUR_ABIL_BY_ID = '人物内功等级'
MAX_ABIL_BY_ID = '人物内功当前斗转星移值'
CUR_ABIL_BY_ID = '人物内功当前经验值'
INTERNAL_SKILLS = '获取人物拥有内功技能列表'
INTERNAL_SKILL_DATA = '获取人物内功技能数据'
INTERNAL_SKILL_TRAIN_DATA = '获取人物内功技能等级熟练度数据'
INTERNAL_SKILL_ONOFF = '获取人物内功技能开关'
INTERNAL_SKILL_RECT_ICON_PATH = '获取人物内功技能矩形图标路径'
INTERNAL_SKILL_NAME = '获取人物内功技能名字'
INTERNAL_SKILL_DESC = '获取人物内功技能描述'
MERIDIAN_DESC = '获取人物内功经络的穴位描述'
MERIDIAN_AUCPOINT_STATE = '获取人物内功对应经络的穴位是否激活列表'
MERIDIAN_OPEN_LIST = '获取人物内功经络的开关列表'
MERIDIAN_LV = '获取人物内功对应经络等级'
HAVE_COMBO_SKILLS = '获取人物所有拥有的连击技能'
COMBO_SKILL_DATA = '获取人物对应连击技能'
COMBO_SKILL_TRAIN_DATA = '获取人物连击技能等级熟练度数据'
SET_COMBO_SKILLS = '获取人物设置为连击的数据'
OPEN_COMBO_NUM = '人物开启的连击个数'
IS_LEARNED_INTERNAL = '人物是否学习内功'
EXTRA_COMBO_BJRATE = '获取对应连击格子额外加暴击几率'
RUN_STEP = '跑步移动格子数'
CAN_RUN_ABLE = '能否跑'
LOOK_TARGET_ID = '当前查看他人角色ID'
LOOK_TARGET_NAME = '当前查看他人角色名字'
LOOK_TARGET_NAME_COLOR = '当前查看他人角色名字颜色ID'
PLAYER_INITED = '玩家属性初始化完成'



WND_EVENT_MOUSE_LB_DOWN = "鼠标左键按下事件"
WND_EVENT_MOUSE_LB_UP = "鼠标左键弹起事件"
WND_EVENT_MOUSE_LB_CLICK = "鼠标左键点击事件"
WND_EVENT_MOUSE_LB_DBCLICK = "鼠标左键双击事件"
WND_EVENT_MOUSE_RB_DOWN = "鼠标右键按下事件"
WND_EVENT_MOUSE_RB_UP = "鼠标右键弹起事件"
WND_EVENT_MOUSE_RB_CLICK = "鼠标右键点击事件"
WND_EVENT_MOUSE_RB_DBCLICK = "鼠标右键双击事件"
WND_EVENT_MOUSE_MOVE = "鼠标移动事件"
WND_EVENT_MOUSE_WHEEL = "鼠标滚轮滚动事件"
WND_EVENT_MOUSE_IN = "鼠标进入控件事件"
WND_EVENT_MOUSE_OUT = "鼠标离开控件事件"
WND_EVENT_WND_VISIBLE = "可见状态发生变化事件"
WND_EVENT_WND_POS_CHANGE = "控件位置发生变化事件"
WND_EVENT_WND_SIZECHANGE = "窗口大小发生变化事件"
WND_EVENT_WND_DESTROY = "窗体被销毁事件"

LUA_EVENT_ROLE_PROPERTY_INITED = "玩家角色属性初始化完毕"
LUA_EVENT_ROLE_PROPERTY_CHANGE = "玩家属性变化时"
LUA_EVENT_LEVELCHANGE = "等级改变"
LUA_EVENT_REINLEVELCHANGE = "转生等级改变"
LUA_EVENT_HPMPCHANGE = "HP/MP改变"
LUA_EVENT_EXPCHANGE = "EXP改变"
LUA_EVENT_BATTERYCHANGE = "电池电量改变"
LUA_EVENT_NETCHANGE = "网络状态改变"
LUA_EVENT_WEIGHTCHANGE = "负重改变"
LUA_EVENT_PKMODECHANGE = "pk模式改变"
LUA_EVENT_AFKBEGIN = "自动挂机开始"
LUA_EVENT_AFKEND = "自动挂机结束"
LUA_EVENT_AUTOMOVEBEGIN = "自动寻路开始"
LUA_EVENT_AUTOMOVEEND = "自动寻路结束"
LUA_EVENT_AUTOPICKBEGIN = "自动捡物开始"
LUA_EVENT_AUTOPICKEND = "自动捡物结束"
LUA_EVENT_MAINBUFFUPDATE = "主玩家buff刷新"
LUA_EVENT_BUFFUPDATE = "通用buff刷新"
LUA_EVENT_TALKTONPC = "与NPC对话"
LUA_EVENT_CHANGESCENE = "切换地图(包含同地图)"
LUA_EVENT_MAPINFOCHANGE = "切换地图(不同地图)"
LUA_EVENT_MAPINFOINIT = "地图初始化"
LUA_EVENT_MAP_STATE_CHANGE = "地图状态改变"
LUA_EVENT_MAP_SIEGEAREA_CHANGE = "地图攻城区域状态改变"
LUA_EVENT_OPENWIN = "打开界面"
LUA_EVENT_CLOSEWIN = "关闭界面"
LUA_EVENT_WINDOW_CHANGE = "窗体尺寸改变"
LUA_EVENT_DEVICE_ROTATION_CHANGED = "设备方向改变"
LUA_EVENT_MONEYCHANGE = "货币变化"
LUA_EVENT_GUILD_MAIN_INFO = "行会信息刷新"
LUA_EVENT_GUILD_CREATE = "行会创建消耗"
LUA_EVENT_GUILD_WORLDLIST = "世界行会列表刷新"
LUA_EVENT_GUILD_APPLYLIST = "入会申请列表刷新"
LUA_EVENT_GUILDE_ALLY_APPLY_UPDATE = "结盟申请列表刷新"
LUA_EVENT_TRADE_MONEY_CHANGE = "对方交易货币改变"
LUA_EVENT_TRADE_MY_MONEY_CHANGE = "自己交易货币改变"
LUA_EVENT_TRADE_STATUS_CHANGE = "对方交易状态改变"
LUA_EVENT_TRADE_MY_STATUS_CHANGE = "自己交易状态改变"
LUA_EVENT_ADDFIREND = "添加好友"
LUA_EVENT_REMFIREND = "删除好友"
LUA_EVENT_JOINTEAM = "加入队伍"
LUA_EVENT_LEAVETEAM = "离开队伍"
LUA_EVENT_REF_ITEM_LIST = "刷新背包道具列表"
LUA_EVENT_PLAYER_EQUIP_CHANGE = "角色装备数据操作"
LUA_EVENT_BAG_ITEM_CHANGE = "背包数据变化"
LUA_EVENT_REF_HERO_ITEM_LIST = "刷新英雄背包道具列表"
LUA_EVENT_HERO_EQUIP_CHANGE = "英雄装备变化"
LUA_EVENT_HERO_BAG_ITEM_CAHNGE = "英雄背包数据变化"
LUA_EVENT_DISCONNECT = "断线"
LUA_EVENT_RECONNECT = "重连"
LUA_EVENT_TAKE_ON_EQUIP = "玩家穿戴装备"
LUA_EVENT_TAKE_OFF_EQUIP = "玩家脱掉装备"
LUA_EVENT_HERO_TAKE_ON_EQUIP = "英雄穿戴装备"
LUA_EVENT_HERO_TAKE_OFF_EQUIP = "英雄脱掉装备"
LUA_EVENT_SETTING_CAHNGE = "设置项改变"
LUA_EVENT_BESTRINGBOX_STATE = "首饰盒状态改变"
LUA_EVENT_ACTOR_IN_OF_VIEW = "玩家/怪物/NPC进视野"
LUA_EVENT_ACTOR_OUT_OF_VIEW = "玩家/怪物/NPC出视野"
LUA_EVENT_DROPITEM_IN_OF_VIEW = "掉落物进视野"
LUA_EVENT_DROPITEM_OUT_OF_VIEW = "掉落物出视野"
LUA_EVENT_TARGET_HP_CHANGE = "目标血量变化"
LUA_EVENT_TARGET_CAHNGE = "目标改变"
LUA_EVENT_ACTOR_OWNER_CHANGE = "目标归属改变"
LUA_EVENT_HERO_ANGER_CAHNGE = "英雄怒气改变"
LUA_EVENT_PLAYER_BEHAVIOR_STATE_CAHNGE = "玩家行为状态改变（站立、走、跑等）"
LUA_EVENT_PLAYER_ACTION_BEGIN = "主玩家行为动作开始（站立、走、跑等）"
LUA_EVENT_PLAYER_ACTION_COMPLETE = "主玩家行为动作结束（站立、走、跑等）"
LUA_EVENT_NET_PLAYER_ACTION_BEGIN = "网络玩家行为动作开始（站立、走、跑等）"
LUA_EVENT_NET_PLAYER_ACTION_COMPLETE = "网络玩家行为动作结束（站立、走、跑等）"
LUA_EVENT_MONSTER_ACTION_BEGIN = "怪物行为动作开始（站立、走、跑等）"
LUA_EVENT_MONSTER_ACTION_COMPLETE = "怪物行为动作结束（站立、走、跑等）"
LUA_EVENT_ACTOR_GMDATA_UPDATE = "玩家/怪物GM自定义数据改变"
LUA_EVENT_SKILL_INIT = "初始化技能"
LUA_EVENT_SKILL_ADD = "新增技能"
LUA_EVENT_SKILL_DEL = "删除技能"
LUA_EVENT_SKILL_UPDATE = "技能更新"
LUA_EVENT_SUMMON_MODE_CHANGE = "召唤物-状态改变"
LUA_EVENT_SUMMON_ALIVE_CHANGE = "召唤物-存活状态改变"
LUA_EVENT_BUBBLETIPS_STATUS_CHANGE = "气泡状态改变"
LUA_EVENT_PLAY_MAGICBALL_EFFECT = "脚本魔血球动画"
LUA_EVENT_AUTOFIGHT_TIPS_SHOW = "自动战斗提示显示与否"
LUA_EVENT_AUTOMOVE_TIPS_SHOW = "自动寻路提示显示与否"
LUA_EVENT_AUTOPICK_TIPS_SHOW = "自动捡物提示显示与否"
LUA_EVENT_HERO_LOGIN_OROUT = "英雄登录/登出"
LUA_EVENT_REIN_ATTR_CHANGE = "转生点数据变化"
LUA_EVENT_ASSIST_MISSION_TOP = "主界面-辅助-任务置顶"
LUA_EVENT_ASSIST_MISSION_ADD = "主界面-辅助-任务增加"
LUA_EVENT_ASSIST_MISSION_CHANGE = "主界面-辅助-任务改变"
LUA_EVENT_ASSIST_MISSION_REMOVE = "主界面-辅助-任务移除"
LUA_EVENT_ASSIST_MISSION_SHOW = "主界面-辅助-任务显示和隐藏"
LUA_EVENT_TEAM_MEMBER_UPDATE = "主界面-辅助-队伍刷新"
LUA_EVENT_TEAM_NEAR_UPDATE = "附近队伍刷新"
LUA_EVENT_TEAM_APPLY_UPDATE = "申请入队列表刷新"
LUA_EVENT_RANK_PLAYER_UPDATE = "排行榜个人数据刷新"
LUA_EVENT_RANK_DATA_UPDATE = "排行榜分类数据刷新"
LUA_EVENT_BIND_MAINPLAYER = "绑定主玩家"
LUA_EVENT_PLAYER_MAPPOS_CHANGE = "主玩家位置改变"
LUA_EVENT_FRIEND_LIST_UPDATE = "好友列表刷新"
LUA_EVENT_FRIEND_APPLY = "收到好友申请"
LUA_EVENT_MAIL_UPDATE = "邮件列表刷新"
LUA_EVENT_ITEMTIPS_MOUSE_SCROLL = "ITEMTIPS鼠标滚轮滚动"
LUA_EVENT_PCMINIMAP_STATUS_CHANGE = "PC主界面小地图展示状态改变"
LUA_EVENT_DARK_STATE_CHANGE = "黑夜状态改变"
LUA_EVENT_MONSTER_IGNORELIST_ADD = "设置-怪物忽略列表增加"
LUA_EVENT_BOSSTIPSLIST_ADD = "设置-boss提示-增加"
LUA_EVENT_MONSTER_NAME_RM = "设置-怪物类型删除"
LUA_EVENT_SKILL_RANKDATA_ADD = "设置-技能数据添加"
LUA_EVENT_SKILLBUTTON_DISTANCE_CHANGE = "技能边距调整"
LUA_EVENT_PLAYER_FRAME_PAGE_ADD = "角色框增加子页"
LUA_EVENT_PLAYER_FRAME_NAME_RRFRESH = "角色外框角色名刷新"
LUA_EVENT_ROLE_PROPERTY_INITED = "玩家角色属性初始化完毕"
LUA_EVENT_PLAYER_LOOK_FRAME_PAGE_ADD = "查看他人角色框增加子页"
LUA_EVENT_PLAYER_GUILD_INFO_CHANGE = "玩家行会信息改变"
LUA_EVENT_HERO_FRAME_PAGE_ADD = "英雄框增加子页"
LUA_EVENT_HERO_FRAME_NAME_RRFRESH = "英雄框名字刷新"
LUA_EVENT_HERO_LOOK_FRAME_PAGE_ADD = "查看他人英雄框增加子页"
LUA_EVENT_TRAD_PLAYER_LOOK_FRAME_PAGE_ADD = "交易行查看他人玩家框增加子页"
LUA_EVENT_TRAD_HERO_LOOK_FRAME_PAGE_ADD = "交易行查看他人英雄框增加子页"
LUA_EVENT_SERVER_VALUE_CHANGE = "服务器下发的变量改变"
LUA_EVENT_MAIN_PLAYER_REVIVE = "主玩家复活"
LUA_EVENT_NET_PLAYER_REVIVE = "网络玩家复活"
LUA_EVENT_MONSTER_REVIVE = "怪物复活"
LUA_EVENT_MAIN_PLAYER_DIE = "主玩家死亡"
LUA_EVENT_NET_PLAYER_DIE = "网络玩家死亡"
LUA_EVENT_MONSTER_DIE = "怪物死亡"
LUA_EVENT_NPCLAYER_OPENSTATUS = "NPC界面打开/关闭状态刷新"
LUA_EVENT_NPC_TALK = "NPC对话[打开TXT-NPC界面]"
LUA_EVENT_MINIMAP_FIND_PATH = "寻路路径"
LUA_EVENT_MINIMAP_MONSTER = "小地图怪物数据刷新"
LUA_EVENT_MINIMAP_PLAYER = "小地图人物坐标刷新"
LUA_EVENT_MINIMAP_TEAM = "小地图组队成员数据刷新"
LUA_EVENT_MINIMAP_RELEASE = "小地图释放内存"
LUA_EVENT_PLAYER_INTERNAL_FORCE_CHANGE = "人物内力值改变"
LUA_EVENT_PLAYER_INTERNAL_EXP_CHANGE = "人物内功经验值改变"
LUA_EVENT_PLAYER_INTERNAL_LEVEL_CHANGE = "人物内功等级改变"
LUA_EVENT_INTERNAL_SKILL_ADD = "人物内功技能增加"
LUA_EVENT_INTERNAL_SKILL_DEL = "人物内功技能删除"
LUA_EVENT_INTERNAL_SKILL_UPDATE = "人物内功技能刷新"
LUA_EVENT_PLAYER_LEARNED_INTERNAL = "人物学习内功"
LUA_EVENT_MERIDIAN_DATA_REFRESH = "人物内功经络数据刷新"
LUA_EVENT_PLAYER_INTERNAL_DZVALUE_CHANGE = "人物内功斗转值改变/恢复"
LUA_EVENT_PLAYER_COMBO_SKILL_ADD = "人物连击技能增加"
LUA_EVENT_PLAYER_COMBO_SKILL_DEL = "人物连击技能删除"
LUA_EVENT_PLAYER_COMBO_SKILL_UPDATE = "人物连击技能刷新"
LUA_EVENT_PLAYER_SET_COMBO_REFRESH = "人物设置的连击技能刷新"
LUA_EVENT_PLAYER_COMBO_SKILLCD_STATE = "人物连击技能CD状态"
LUA_EVENT_PLAYER_OPEN_COMBO_NUM = "人物开启连击格子数"
LUA_EVENT_HERO_INTERNAL_FORCE_CHANGE = "英雄内力值改变"
LUA_EVENT_HERO_INTERNAL_EXP_CHANGE = "英雄内功经验值改变"
LUA_EVENT_HERO_INTERNAL_LEVEL_CHANGE = "英雄内功等级改变"
LUA_EVENT_HERO_INTERNAL_SKILL_ADD = "英雄内功技能增加"
LUA_EVENT_HERO_INTERNAL_SKILL_DEL = "英雄内功技能删除"
LUA_EVENT_HERO_INTERNAL_SKILL_UPDATE = "英雄内功技能刷新"
LUA_EVENT_HERO_LEARNED_INTERNAL = "英雄学习内功"
LUA_EVENT_HERO_MERIDIAN_DATA_REFRESH = "英雄内功经络数据刷新"
LUA_EVENT_HERO_INTERNAL_DZVALUE_CHANGE = "英雄内功斗转值改变/恢复"
LUA_EVENT_HERO_COMBO_SKILL_ADD = "英雄连击技能增加"
LUA_EVENT_HERO_COMBO_SKILL_DEL = "英雄连击技能删除"
LUA_EVENT_HERO_COMBO_SKILL_UPDATE = "英雄连击技能刷新"
LUA_EVENT_HERO_SET_COMBO_REFRESH = "英雄设置连击技能刷新"
LUA_EVENT_HERO_OPEN_COMBO_NUM = "英雄开启连击格子数"
LUA_EVENT_HERO_PROPERTY_CHANGE = "英雄属性变化"
LUA_EVENT_NOTICE_SERVER = "顶部跑马灯全服公告"
LUA_EVENT_NOTICE_SERVER_EVENT = "屏幕跑马灯系统公告"
LUA_EVENT_NOTICE_SYSYTEM = "屏幕跑马灯公告可控制Y轴"
LUA_EVENT_NOTICE_SYSYTEM_SCALE = "系统公告缩放"
LUA_EVENT_NOTICE_SYSYTEM_XY = "跑马灯公告可控制XY轴"
LUA_EVENT_NOTICE_SYSYTEM_TIPS = "系统提示弹窗"
LUA_EVENT_NOTICE_TIMER = "聊天上方倒计时公告"
LUA_EVENT_NOTICE_DELETE_TIMER = "移除倒计时公告"
LUA_EVENT_NOTICE_ITEM_TIPS = "飘字物品获取/消耗提示"
LUA_EVENT_NOTICE_ATTRIBUTE = "飘字属性变化"
LUA_EVENT_NOTICE_EXP = "飘字经验变化"
LUA_EVENT_NOTICE_DROP = "公告掉落物品提示"
LUA_EVENT_RICHTEXT_OPEN_URL = "富文本超链(href)点击触发"
LUA_EVENT_KF_STATUS_CHANGE = "跨服状态改变"
LUA_EVENT_QUICKUSE_DATA_OPER = "快捷栏道具数据变动触发"
LUA_EVENT_ENTER_WORLD = "进入游戏世界主界面已经初始化"
LUA_EVENT_LEAVE_WORLD = "离开游戏世界小退触发"
LUA_EVENT_PLAYER_IN_SAFEZONE_CHANGE = "主玩家安全区状态改变"
LUA_EVENT_NET_PLAYER_IN_SAFEZONE_CHANGE = "网络玩家安全区状态改变"
LUA_EVENT_PLAYER_STALL_STATUS_CHANGE = "主玩家摆摊状态改变"
LUA_EVENT_NET_PLAYER_STALL_STATUS_CHANGE = "网络玩家摆摊状态改变"
LUA_EVENT_PLAYER_HUSHEN_STATUS_CHANGE = "主玩家护身状态改变"
LUA_EVENT_NET_PLAYER_HUSHEN_STATUS_CHANGE = "网络玩家护身状态改变"
LUA_EVENT_PLAYER_TEAM_STATUS_CHANGE = "主玩家组队状态改变"
LUA_EVENT_NET_PLAYER_TEAM_STATUS_CHANGE = "网络玩家组队状态改变"
LUA_EVENT_PURCHASE_ITEM_LIST_PULL = "求购列表数据返回"
LUA_EVENT_PURCHASE_ITEM_LIST_COMPLETE = "求购列表加载完成"
LUA_EVENT_PURCHASE_SEARCH_ITEM_UPDATE = "求购搜索参数刷新"
LUA_EVENT_PURCHASE_MYITEM_UPDATE = "我的求购数据刷新"
LUA_EVENT_PURCHASE_WORLDITEM_UPDATE = "世界求购数据刷新"
LUA_EVENT_RED_POINT_ADD = "红点增(按红点表cfg_redpoint配置)"
LUA_EVENT_RED_POINT_DEL = "红点删(按红点表cfg_redpoint配置)"
LUA_EVENT_FLYIN_BTN_ITEM_COMPLETE = "道具飞入指定按钮完成"
LUA_EVENT_STORAGE_DATA_CHANGE = "仓库数据变动"
LUA_EVENT_HERO_LOCK_CHANGE = "英雄锁定刷新"
LUA_EVENT_PLAYER_TITLE_CHANGE = "人物称号数据变动"
LUA_EVENT_SKILL_ADD_TO_UI_WIN32 = "PC端-添加技能到主界面触发"
LUA_EVENT_SKILL_REMOVE_TO_UI_WIN32 = "PC端-移除主界面技能触发"
LUA_EVENT_SKILL_CD_TIME_CHANGE = "技能CD时间变动"
