import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

SpinBox {
    id: spinBox
    value: 0
    implicitHeight: 54
    implicitWidth: 235
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
                id : minus
                anchors.centerIn: parent
                color: "white"
                text: qsTr("-")
                font.pointSize: 30
            }
            color: "transparent"
            MouseArea{
                anchors.fill: parent
                onClicked: spinBox.value = parseFloat(spinBox.value) - spinBox.stepSize
                onPressed: minus.color = "#4DB6AC"
                onReleased: minus.color = "white"
            }
        }

        TextField {
            id: editor
            text: spinBox.value
            horizontalAlignment: Text.AlignHCenter
            Layout.preferredHeight: spinBox.height
            Layout.preferredWidth: spinBox.width - 110
            background: Rectangle{
                id: holder
                width: editor .width
                height: editor.height
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
                id: plus
                anchors.centerIn: parent
                color: "white"
                text: qsTr("+")
                font.pointSize: 18
            }
            color: "transparent"
            MouseArea{
                anchors.fill: parent
                onClicked: spinBox.value = parseFloat(spinBox.value) + spinBox.stepSize
                onPressed: plus.color = "#4DB6AC"
                onReleased: plus.color = "white"
            }
        }
    }
    up.indicator: Item{}
    down.indicator: Item{}
}
