# QmlTreeView

> Customize TreeView with ListView in QtQuick.Controls 2.x,No need for c++. （机翻英语）用Lisview自定义的Treeview，不用C++代码实现model。

> Model can be obtained by parsing JSON. model可以通过解析json获得。

# Environment（开发环境）

> （2022-05-28）Win10 64bit + Qt5.15.2 + MSVC2019 32/64bit

# Note（备注）

> （2022-05-28）The code is for reference only, and should be modified according to the actual application requirements. 代码仅供参考，要实际应用需求结合自己的需求进行修改。

> （2022-05-28）Listview cache was not considered in the previous version, so a larger model will release the delegate item outside the boundary after scrolling. Therefore, the check and expand status of the item should not be saved in the item, but should be placed in the external variable or model. 之前的版本中没有考虑 ListView cache，所以大一点的 model 在滚动后会释放边界外的 delegate item，所以 item 的勾选、展开等状态不应该保存在 item 中，而应该放到外部变量或者 model 中。

> （2019-05-26）If you encounter coding problems, you can delete the Chinese notes and try again. 如果遇到编码问题可以把中文注释删了再试试。

# Demo Show（展示）

### 初版demo样式[20190526]
![demo](https://github.com/gongjianbo/QmlTreeView/blob/master/img/demo.png)

### 改进版demo样式[20190528]
![demo2](https://github.com/gongjianbo/QmlTreeView/blob/master/img/demo_2.png)

> You can replace icons, backgrounds, etc. according to your own needs. 可以根据自己的需要替换图标、背景等。

### ui原型图
![ui](https://github.com/gongjianbo/QmlTreeView/blob/master/img/uimodel.png)

