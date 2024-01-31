import QtQuick
import QtQuick.Layouts
import "../Components"
import CalIns 1.0


Item {

    Calibrator{
        objectName: "calibIns"
        id: calib
    }

    RowLayout{
        x: 40
        y: 40
        width: parent.width - 80
        height: 48
        spacing: 24
        MoonButton{
            id: btn450
            checkBTN: true
            text: "450"
            Component.onCompleted: calib.channel = 450
            onClicked: {
                checkBTN = true
                btn635.checkBTN = false
                btn8081.checkBTN = false
                btn8082.checkBTN = false
                calib.channel = 450
            }
        }
        MoonButton{
            id: btn635
            checkBTN: false
            text: "635"
            onClicked: {
                checkBTN = true
                btn450.checkBTN = false
                btn8081.checkBTN = false
                btn8082.checkBTN = false
                calib.channel = 635
            }
        }
        MoonButton{
            id: btn8081
            checkBTN: false
            text: "808(1)"
            onClicked: {
                checkBTN = true
                btn635.checkBTN = false
                btn450.checkBTN = false
                btn8082.checkBTN = false
                calib.channel = 8081
            }
        }
        MoonButton{
            id: btn8082
            checkBTN: false
            text: "808(2)"
            onClicked: {
                checkBTN = true
                btn635.checkBTN = false
                btn8081.checkBTN = false
                btn450.checkBTN = false
                calib.channel = 8082
            }
        }
    }
    Item{
        width: 1200
        height: 170
        y:150
        x:40
        RowLayout{
            spacing: 80
            width: parent.width
            height: 31
            MoonSwitch{

            }
            Text {
                text: qsTr("V-DAC:")
                color: "white"
                font.pointSize: 16
            }
            Text {
                text: qsTr("V-Shant:")
                color: "white"
                font.pointSize: 16
            }
            Text {
                text: qsTr("V-A:")
                color: "white"
                font.pointSize: 16
            }
            Text {
                text: qsTr("V-K:")
                color: "white"
                font.pointSize: 16
            }
            Text {
                text: qsTr("V-D-SUP:")
                color: "white"
                font.pointSize: 16
            }
        }
        Item{
            width: 1200
            height: 91
            x:40
            y:100
            RowLayout{
                anchors.fill: parent
                spacing: 48
                ColumnLayout{
                    spacing: 12
                    Text {
                        text: qsTr("Power")
                        color: "white"
                        font.pointSize: 18
                    }
                    MoonComboBox{
                        model: [1000, 2000, 3000, 4000]
                        onCurrentIndexChanged: calib.power = model[currentIndex]
                    }
                }
                ColumnLayout{
                    spacing: 12
                    Text {
                        text: qsTr("V-SUP")
                        color: "white"
                        font.pointSize: 18
                    }
                    MoonSpinBox{
                        onValueChanged: calib.vSUP = value
                    }
                }
                ColumnLayout{
                    spacing: 12
                    Text {
                        text: qsTr("I-D")
                        color: "white"
                        font.pointSize: 18
                    }
                    MoonSpinBox{
                        onValueChanged: calib.iD = value
                    }
                }
            }
        }
    }
    RowLayout{
        Layout.preferredHeight: 56
        Layout.preferredWidth: 463
        spacing: 35
        x: 600
        y: 700
        MoonButton{
            text: "Discard Changes"
            width: 224
            height: 56
            checkBTN: false
        }
        MoonButton{
            text: "Save and Continue"
            width: 224
            height: 56
            checkBTN: true
            onClicked: calib.sendCalibrationData()

        }
    }
}
