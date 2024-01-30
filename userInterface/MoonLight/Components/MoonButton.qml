import QtQuick
import QtQuick.Controls

Button {

    property bool checkBTN: true
    property bool activeBTN: true

    onCheckBTNChanged: {
        if (checkBTN == true){
            bkg.color = "#4DB6AC"
            root.palette.buttonText = "#232C3D"
        } else{
            bkg.color = "transparent"
            root.palette.buttonText = "white"
        }
    }

    id: root
    implicitWidth: 282
    implicitHeight: 48
    palette.buttonText: checkBTN ? "#232C3D" :"white"

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
