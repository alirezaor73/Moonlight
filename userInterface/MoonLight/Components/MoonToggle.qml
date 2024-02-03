import QtQuick
import QtQuick.Shapes

Item {

    property string primaryColor: "#4DB6AC"
    property string secondaryKey: "transparent"

    property bool   activeKey: false
    property string rightText: "rightKey"
    property string rightIcon: ""
    property string leftText:  "leftKey"
    property string leftIcon:  ""

    width: 152
    height: 56
    anchors.centerIn: parent

    Item{
        id: keys
        width: parent.width
        height: parent.height
        Shape{
            id:leftShape
            anchors.left: parent.left
            height: parent.height
            width: parent.width/2
            ShapePath {
                id:leftKey
                fillColor: activeKey ? primaryColor : secondaryKey
                strokeWidth: 2
                strokeColor: "#616161"
                startX: keys.width/2 ; startY: 0
                PathLine {x:keys.width/2 ; y:0 }
                PathLine {x:0; y:0 }
                PathArc  {x:0; y:keys.height; radiusX:8; radiusY:10; direction: PathArc.Counterclockwise}
                PathLine {x:0; y:keys.height }
                PathLine {x:keys.width/2 ; y:keys.height;}
                PathLine {x:keys.width/2 ; y:0;}
            }
            Text {
                id: leftTitle
                text: leftText
                x: parent.width / 3 - rightText.length
                y: leftIcon ? parent.height + 5 : parent.height / 3
                color: "white"
            }
            Image{
                id: lefIconItem
                source: leftIcon
                visible: leftIcon ? true : false
                anchors.centerIn: parent
            }

            MouseArea{
                anchors.fill: parent
                onClicked: activeKey = true
            }
        }
        Shape {
            id:rightShape
            anchors.left: leftShape.right
            height: parent.height
            width: parent.width/2
            ShapePath {
                id: rightKey
                fillColor: activeKey ? secondaryKey : primaryColor
                strokeWidth: 2
                strokeColor: "#616161"
                startX: 0; startY: 0
                PathLine {x:0; y:0 }
                PathLine {x:keys.width/2  ; y:0 }
                PathArc  {x:keys.width/2  ; y:keys.height; radiusX:8; radiusY:10}
                PathLine {x:keys.width/2  ; y:keys.height }
                PathLine {x:0; y:keys.height }
                PathLine {x:0; y:0;}
            }
            Text {
                id: rightTitle
                text: rightText
                x: parent.width / 3 - rightText.length
                y: rightIcon ? parent.height + 5 : parent.height / 3
                color: "white"
            }
            Image{
                id: rightIconItem
                source: rightIcon
                visible: rightIcon ? true : false
                anchors.centerIn: parent
            }
            MouseArea{
                anchors.fill: parent
                onClicked: activeKey = false
            }
        }

    }
}
