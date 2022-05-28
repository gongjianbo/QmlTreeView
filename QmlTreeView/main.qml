import QtQuick 2.7
import QtQuick.Controls 2.7
import QtQuick.Window 2.7

Window {
    id: root_window
    visible: true
    width: 640
    height: 480
    title: qsTr("QmlTreeView By GongJianBo")
    color: Qt.rgba(3/255,26/255,35/255,1)

    //滚动条可以自己设置
    //ListView横向滚动条需要设置如下两个参数(如果是竖向的ListView)
    //contentWidth: 500
    //flickableDirection: Flickable.AutoFlickIfNeeded
    TreeView{
        id: item_tree
        width: parent.width/2
        anchors{
            left: parent.left
            top: parent.top
            bottom: parent.bottom
            margins: 10
        }
        //model: []

        //set model data
        Component.onCompleted: {
            console.log(1)
            root_window.setTestDataA();
            console.log(2)
        }
    }

    Column{
        anchors{
            right: parent.right
            top: parent.top
            margins: 10
        }
        spacing: 10
        Button{
            text: "ChangeModel"
            checkable: true
            //changed model data
            onClicked: {
                if(checked){
                    root_window.setTestDataB();
                }else{
                    root_window.setTestDataA();
                }
            }
        }
        Button{
            text: "AutoExpand"
            onClicked: item_tree.autoExpand=!item_tree.autoExpand
        }
    }

    function setTestDataA(){
        item_tree.model=JSON.parse('[
        {
            "text":"1 one",
            "istitle":true,
            "subnodes":[
                {"text":"1-1 two","istitle":true},
                {
                    "text":"1-2 two",
                    "istitle":true,
                    "subnodes":[
                        {"text":"1-2-1 three","isoption":true},
                        {"text":"1-2-2 three","isoption":true}
                    ]
                }
            ]
        },
        {
            "text":"2 one",
            "istitle":true,
            "subnodes":[
                {"text":"2-1 two","istitle":true},
                {
                    "text":"2-2 two",
                    "istitle":true,
                    "subnodes":[
                        {"text":"2-2-1 three","isoption":true},
                        {"text":"2-2-2 three","isoption":true}
                    ]
                }
            ]
        },
        {
            "text":"3 one",
            "istitle":true,
            "subnodes":[
                {"text":"3-1 two","istitle":true},
                {"text":"3-2 two","istitle":true}
            ]
        },
        {
            "text":"4 one",
            "istitle":true,
            "subnodes":[
                {"text":"4-1 two","istitle":true},
                {
                    "text":"4-2 two",
                    "istitle":true,
                    "subnodes":[
                        {"text":"4-2-1 three","isoption":true},
                        {"text":"4-2-2 three","isoption":true}
                    ]
                }
            ]
        },
        {
            "text":"5 one",
            "istitle":true,
            "subnodes":[
                {"text":"5-1 two","istitle":true},
                {
                    "text":"5-2 two",
                    "istitle":true,
                    "subnodes":[
                        {"text":"5-2-1 three","isoption":true},
                        {"text":"5-2-2 three","isoption":true}
                    ]
                }
            ]
        },
        {
            "text":"6 one",
            "istitle":true,
            "subnodes":[
                {"text":"6-1 two","istitle":true},
                {"text":"6-2 two","istitle":true}
            ]
        }
    ]')
    }

    function setTestDataB(){
        item_tree.model=JSON.parse('[
        {
            "text":"1 one",
            "istitle":true,
            "subnodes":[
                {
                    "text":"1-1 two",
                    "istitle":true,
                    "subnodes":[
                        {"text":"1-1-1 three","isoption":true},
                        {"text":"1-1-2 three","isoption":true}
                    ]
                },
                {
                    "text":"1-2 two",
                    "istitle":true,
                    "subnodes":[
                        {"text":"1-2-1 three","isoption":true},
                        {"text":"1-2-2 three","isoption":true}
                    ]
                }
            ]
        },
        {
            "text":"2 one",
            "istitle":true,
            "subnodes":[
                {"text":"2-1 two","istitle":true},
                {
                    "text":"2-2 two",
                    "istitle":true,
                    "subnodes":[
                        {"text":"2-2-1 three","isoption":true},
                        {"text":"2-2-2 three","isoption":true}
                    ]
                }
            ]
        },
        {"text":"3 one","istitle":true},
        {
            "text":"4 one",
            "istitle":true,
            "subnodes":[
                {"text":"4-1 two","istitle":true},
                {"text":"4-2 two","istitle":true}
            ]
        }
    ]')
    }
}
