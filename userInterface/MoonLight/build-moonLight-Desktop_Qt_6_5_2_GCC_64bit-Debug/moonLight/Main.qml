import QtQuick
import QtQuick.Layouts
import QtQuick.Controls


Window {
    id: window
    width: 1280
    height: 800
    visible: true
    title: qsTr("Hello World")
    color: "#232C3D"
    ColumnLayout{
        x: 40
        y: 40
        width: 1200
        height: 727
        //---------------450-----------------------------------------------------------------------------
        Item{
            id: l450
            height: 91
            RowLayout{
                spacing: 40
                Text {
                    text: qsTr("450 :")
                    color: "white"
                }
                MoonSwitch{

                }
                ColumnLayout{
                    Text {
                        text: qsTr("V")
                        color: "white"
                    }
                    MoonInput{
                    }
                }
                ColumnLayout{
                    Text {
                        text: qsTr("C")
                        color: "white"
                    }
                    MoonInput{
                    }
                }
                ColumnLayout{
                    Text {
                        text: qsTr("Step")
                        color: "white"
                    }
                    MoonComboBox{

                    }
                }

                ColumnLayout{
                    Text {
                        text: qsTr("Value")
                        color: "white"
                    }
                    spacing: 0
                    MoonSpinBox{
                    }
                }

                MoonButton{
                    text: "Save"
                }
            }
        }
    }
}
