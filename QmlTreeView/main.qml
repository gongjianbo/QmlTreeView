import QtQuick 2.9
import QtQuick.Window 2.2

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Rectangle{
        anchors.fill: parent
        color: Qt.rgba(3/255,26/255,35/255,1)
    }

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
}
