import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    TreeView{
        id:tree
        width: 300
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        //model: []

        Component.onCompleted: {
            //console.log(model)
            model=JSON.parse('[
            {
                "text":"1",
                "istitle":true,
                "subnodes":[
                    {"text":"1-1","istitle":true},
                    {
                        "text":"1-2",
                        "istitle":true,
                        "subnodes":[
                            {"text":"1-2-1","isoption":true},
                            {"text":"1-2-2","isoption":true}
                        ]
                    }
                ]
            },
            {
                "text":"2",
                "istitle":true,
                "subnodes":[
                    {"text":"2-1","istitle":true},
                    {
                        "text":"2-2",
                        "istitle":true,
                        "subnodes":[
                            {"text":"2-2-1","isoption":true},
                            {"text":"2-2-2","isoption":true}
                        ]
                    }
                ]
            },
            {"text":"3","istitle":true},
            {
                "text":"4",
                "istitle":true,
                "subnodes":[
                    {"text":"4-1","istitle":true},
                    {"text":"4-2","istitle":true}
                ]
            }
        ]')
        }
    }
}
