import QtQuick
import QtQuick.Controls

Button {

    property bool checkBTN: true
    property bool activeBTN: true
    property string colorBTN: "#4DB6AC"
    property string borderColorBTN: "#53575E"
    property string pressColorBTN: "#21A191"


    onCheckBTNChanged: {
        if (checkBTN == true){
            bkg.color = colorBTN
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
        color: checkBTN ? colorBTN : "transparent"
        radius: 10
        border.width: 2
        border.color: borderColorBTN
    }
    onPressed: bkg.color = pressColorBTN
    onReleased: bkg.color = checkBTN ? colorBTN : "transparent"
}
