import QtQuick
import QtQuick.Controls
import QtQuick.Effects

TextField{

    property string unit: ""

    id: root
    implicitWidth: 197
    implicitHeight: 56
    background: Rectangle{
        id: holder
        width: root.width
        height: root.height
        radius: 10
        color: "#4D586C"
        border.width: 3
        border.color: "#4DB6AC"
    }
    padding: 8
    color: "white"

    Text{
        id:unitText
        text: unit
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: parent.height / 3
        color: "white"

    }
}


