import QtQuick
import QtQuick.Window
import QtQuick.Layouts
import QtQuick.Controls
import "Components"
import "Pages"


Window {
    id: window
    width: 1280
    height: 800
    visible: true
    title: qsTr("MoonLight")
    color: "#232C3D"

    // property var calib

    CalibrationPage{
        id: calibrate
        // calibIns: window.calib
        y : -1200
    }
    PropertyAnimation{
        id: calibrAnimation
        target: calibrate
        properties: "y"
    }

    MoonButton{
        y : 800 - height - 40
        x : 40
        text: "calibrate"
        onClicked: {
            if(calibrate.y == 0){
                calibrAnimation.to = -1200
                calibrAnimation.running = true
            }else{
                calibrAnimation.to = 0
                calibrAnimation.running = true
            }
        }
    }

    // MoonKeypad{
    //     anchors.bottom: parent.bottom
    //     anchors.horizontalCenter: parent.horizontalCenter
    // }
}
