import QtQuick
import QtQuick.Controls

Button {

    property string primaryColor: "#4DB6AC"
    property string secondaryColor: "#232C3D"
    property string borderColor: "#53575E"
    property bool checkBTN: true
    property bool activeBTN: true


    onCheckBTNChanged: {
        if (checkBTN == true){
            bkg.border.color = "transparent"
            bkg.color = primaryColor
            root.palette.buttonText = secondaryColor
        } else{
            bkg.border.color = borderColor
            bkg.color = "transparent"
            root.palette.buttonText = "white"
        }
    }

    id: root
    implicitWidth: 282
    implicitHeight: 48
    palette.buttonText: checkBTN ? secondaryColor : primaryColor

    background: Rectangle{
        id: bkg
        anchors.fill: root
        color: checkBTN ? primaryColor : "transparent"
        radius: 10
        border.width: 2
        border.color: borderColor
    }
    onPressed: {
        bkg.color = checkBTN ? secondaryColor : primaryColor
        palette.buttonText = primaryColor
    }
    onReleased:{
        palette.buttonText = checkBTN ? secondaryColor : primaryColor
        bkg.color = checkBTN ? primaryColor : "transparent"
    }
}
