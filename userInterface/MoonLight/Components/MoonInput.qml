import QtQuick
import QtQuick.Controls
import QtQuick.Effects

TextField{
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
}

