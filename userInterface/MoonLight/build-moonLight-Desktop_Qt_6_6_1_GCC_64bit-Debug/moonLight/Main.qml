import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Window {
    id: window
    width: 1280
    height: 800
    visible: true
    title: qsTr("MoonLight")
    color: "#232C3D"
    RowLayout{
        x: 40
        y: 40
        width: 1200
        height: 48
        spacing: 24
        MoonButton{
            checkBTN: true
            text: "450"
        }
        MoonButton{
            checkBTN: false
            text: "450"
        }
        MoonButton{
            checkBTN: false
            text: "450"
        }
        MoonButton{
            checkBTN: false
            text: "450"
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
}
