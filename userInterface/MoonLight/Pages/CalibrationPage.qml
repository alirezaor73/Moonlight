import QtQuick
import QtQuick.Layouts
import "../Components"


Item {


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
            onClicked: {
                checkBTN = true
                btn635.checkBTN = false
                btn8081.checkBTN = false
                btn8082.checkBTN = false
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
        }
    }
}
