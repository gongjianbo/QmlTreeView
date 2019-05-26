import QtQuick 2.7
import QtQuick.Controls 2.3

Item{
    id:tree_root
    property alias model: list_view.model
    property int currentItem: 0 //当前选中item
    property variant checkedArray: [] //当前已勾选的items


    //背景
    Rectangle{
        id:background_rect
        anchors.fill: parent
        color: "green"
        border.width: 1
        border.color: "darkgreen"
    }

    //主要是为了可以横向滚动，listview字节有点问题
    Flickable {
        anchors.fill: parent
        contentWidth: 500
        clip: true

        ListView{
            id:list_view
            //通过+1来给每个item一个唯一的index
            //可以配合root的currentItem来做高亮
            property int itemCount: 0
            anchors.fill: parent
            anchors.margins: 1
            //model: //model由外部设置，通过解析json
            delegate: list_delegate
            //clip: true  //这里不用加
            onModelChanged: {
                checkedArray=[];
            }
        }
        //end list_view

        Component{
            id:list_delegate
            Row{
                id:list_itemgroup

                //canvas 画项之间的连接线
                Canvas{
                    id:list_canvas
                    width: 20
                    height: list_itemcol.height
                    //最后一项的连接线没有尾巴
                    property bool isLastItem: (index==parent.ListView.view.count-1)
                    onPaint: {
                        var ctx = getContext("2d")

                        // setup the stroke
                        ctx.strokeStyle = "red"

                        // create a path
                        ctx.beginPath()
                        ctx.moveTo(10,0)
                        ctx.lineTo(10,list_itemrow.height/2)
                        // ctx.moveTo(10,0)

                        ctx.lineTo(20,list_itemrow.height/2)
                        if(!isLastItem){
                            ctx.moveTo(10,list_itemrow.height/2)
                            ctx.lineTo(10,height)
                        }
                        // stroke path
                        ctx.stroke()
                    }

                    //项图标框
                    Rectangle{
                        id:item_titleicon
                        visible: false
                        width: 10
                        height: 10
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: list_canvas.width/4
                        anchors.topMargin: list_itemrow.height/4
                        //anchors.verticalCenter: parent.verticalCenter
                        //可以替换为image，根据是否有子项/是否展开加载不同的图片
                        color: item_repeater.count
                               ?item_sub.visible?"white":"gray"
                        :"black"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                if(item_repeater.count)
                                    item_sub.visible=!item_sub.visible;
                            }
                        }
                    }

                    //项勾选框
                    Rectangle{
                        id:item_optionicon
                        visible: false
                        width: 10
                        height: 10
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.leftMargin: list_canvas.width/4
                        anchors.topMargin: list_itemrow.height/4
                        //anchors.verticalCenter: parent.verticalCenter
                        property bool checked: false
                        //可以替换为image，勾选框
                        color: checked
                               ?"lightgreen"
                               :"red"
                        MouseArea{
                            anchors.fill: parent
                            onClicked: {
                                item_optionicon.checked=!item_optionicon.checked;
                                if(item_optionicon.checked){
                                    check(list_itemrow.itemIndex);
                                }else{
                                    uncheck(list_itemrow.itemIndex);
                                }
                                var str="checked ";
                                for(var i in checkedArray)
                                    str+=String(checkedArray[i])+" ";
                                console.log(str)
                            }
                        }
                    }

                }

                //项内容：包含一行item和子项的listview
                Column{
                    id:list_itemcol

                    //这一项的内容，这里只加了一个text
                    Row {
                        id:list_itemrow
                        width: list_view.width
                        height: item_text.implicitHeight+6
                        spacing: 5

                        property int itemIndex;


                        Rectangle{
                            height: item_text.implicitHeight+6
                            width: parent.width
                            anchors.verticalCenter: parent.verticalCenter
                            color: (currentItem===list_itemrow.itemIndex)
                                   ?"cyan"
                                   :"orange"

                            Text {
                                id:item_text
                                anchors.left: parent.left
                                anchors.verticalCenter: parent.verticalCenter
                                text: modelData.text
                                font.pixelSize: 20
                                font.family: "SimSun"
                            }

                            MouseArea{
                                anchors.fill: parent
                                onClicked: {
                                    currentItem=list_itemrow.itemIndex;
                                    console.log("selected",list_itemrow.itemIndex)
                                }
                            }
                        }


                        Component.onCompleted: {
                            list_itemrow.itemIndex=list_view.itemCount;
                            list_view.itemCount+=1;

                            if(modelData.istitle)
                                item_titleicon.visible=true;
                            else if(modelData.isoption)
                                item_optionicon.visible=true;
                        }
                    }

                    //放子项
                    Column{
                        id:item_sub
                        visible: false
                        //上级左侧距离=小图标宽+x偏移
                        x:10
                        Item {
                            width: 10
                            height: item_repeater.contentHeight
                            //需要加个item来撑开，如果用Repeator获取不到count
                            ListView{
                                id:item_repeater
                                anchors.fill: parent
                                delegate: list_delegate
                                model:modelData.subnodes
                            }
                        }
                    }

                }
            }
            //end list_itemgroup
        }
        //end list_delegate
    }
    //end Flickable

    //勾选时放入arr中
    function check(index){
        checkedArray.push(index);
    }

    //取消勾选时从arr移除
    function uncheck(index){
        var i = checkedArray.length;

        while (i--) {
            if (checkedArray[i] === index) {
                checkedArray.splice(i,1);
                break;
            }
        }
    }
}
