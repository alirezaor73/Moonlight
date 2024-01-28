import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

SpinBox {
    id: spinBox
    value: 0
    Layout.preferredHeight: 54
    Layout.preferredWidth: 235
    editable: false
    background:Rectangle{
        color: "transparent"
    }
    contentItem: RowLayout {
        id: contentRow
        spacing: 0

        Rectangle {
            id: downIndicator
            width: 55
            height: 54
            Text {
                anchors.centerIn: parent
                color: "white"
                text: qsTr("-")
            }
            color: "transparent"
            MouseArea{
                anchors.fill: parent
                onClicked: spinBox.value = parseFloat(spinBox.value) - spinBox.stepSize
            }
        }

        TextField {
            id: editor
            text: spinBox.value
            Layout.preferredHeight: 56
            Layout.preferredWidth: 125
            background: Rectangle{
                id: holder
                width: 125
                height: 56
                radius: 10
                color: "#4D586C"
            }
            enabled: false
            color: "white"
        }

        Rectangle {
            id: upIndicator
            width: 55
            height: 54
            Text {
                anchors.centerIn: parent
                color: "white"
                text: qsTr("+")
            }
            color: "transparent"
            MouseArea{
                anchors.fill: parent
                onClicked: spinBox.value = parseFloat(spinBox.value) + spinBox.stepSize
            }
        }
    }
    up.indicator: Item{}
    down.indicator: Item{}
}
