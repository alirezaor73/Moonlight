import QtQuick
import QtQuick.Controls

Button {

    property bool checkBTN: true
    property bool activeBTN: true

    id: root
    implicitWidth: 282
    implicitHeight: 48

    background: Rectangle{
        id: bkg
        anchors.fill: root
        color: checkBTN ? "#4DB6AC" : "transparent"
        radius: 10
        border.width: 2
        border.color: "#53575E"
    }
    onPressed: bkg.color = "#21A191"
    onReleased: bkg.color = checkBTN ? "#4DB6AC" : "transparent"
}
