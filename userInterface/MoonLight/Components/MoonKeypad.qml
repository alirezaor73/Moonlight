import QtQuick
import QtQuick.Controls

Item {
    id: root

// public

    signal moonAccepted(string keyPadData);
    signal moonRejected();

// private
    width: 500;  height: 500

    property double rowSpacing:     0.03 * width
    property double columnSpacing:  0.03 * height
    property double columns:        3
    property double rows:           4

    MouseArea {anchors.fill: parent}

    Rectangle { // input
        color: "transparent"
        width: root.width;  height: 0.2 * root.height

        // Button { // close v
        //     id: closeButton

        //     text: '\u2193' // BLACK DOWN-POINTING TRIANGLE
        //     width: height;  height: 0.8 * parent.height
        //     anchors.verticalCenter: parent.verticalCenter
        //     x: columnSpacing

        //     onClicked: moonRejected() // emit
        // }

        TextInput {
            id: textInput
            cursorVisible: true
            anchors {left: parent.left;  right: clearButton.left;  verticalCenter: parent.verticalCenter;  margins: 0.03 * root.width}
            font.pixelSize: 0.5 * parent.height
            clip: true
            echoMode: TextInput.Normal
            color: "white"
            onAccepted: if(acceptableInput) root.moonAccepted(text)
        }
        MoonButton { // clear x
            id: clearButton
            colorBTN:  "#2A3139"
            palette.buttonText: "white"
            text: '\u232B'
            width: height *1.5;  height: 0.8 * parent.height
            anchors {verticalCenter: parent.verticalCenter;  right: parent.right;  rightMargin: columnSpacing}
            enabled: text === '\u232B'? textInput.text: true
            onClicked: root.moonClicked(text)
        }
    }
    Rectangle {
        width: parent.width;  height: 0.8 * parent.height
        anchors.bottom: parent.bottom
        color: "transparent"
        Item { // keys
            id: keyboard
            anchors {fill: parent; leftMargin: columnSpacing}
            Column {
                spacing: columnSpacing
                Row {
                    spacing: rowSpacing
                    Repeater {
                        model: [
                             {text: '1', width: 1},
                             {text: '2', width: 1},
                             {text: '3', width: 1},
                        ]
                        delegate: MoonButton {
                            colorBTN:  "#2A3139"
                            palette.buttonText: "white"
                            text: modelData.text
                            width: modelData.width * keyboard.width / columns - rowSpacing
                            height: keyboard.height / rows - columnSpacing
                            onClicked: root.moonClicked(text)
                        }
                    }
                }
                Row {
                    spacing: rowSpacing
                    Repeater {
                        model: [
                             {text: '4', width: 1},
                             {text: '5', width: 1}, // MULTIPLICATION SIGN
                             {text: '6', width: 1},
                        ]
                        delegate: MoonButton {
                            colorBTN:  "#2A3139"
                            palette.buttonText: "white"
                            text:  modelData.text
                            width: modelData.width * keyboard.width / columns - rowSpacing
                            height: keyboard.height / rows - columnSpacing
                            onClicked: root.moonClicked(text)
                        }
                    }
                }
                Row {
                    spacing: rowSpacing
                    Repeater {
                        model: [
                             {text:  '7', width: 1},
                             {text: '8', width: 1},
                             {text: '9', width: 1},
                        ]
                        delegate: MoonButton {
                            colorBTN:  "#2A3139"
                            palette.buttonText: "white"
                            text:  modelData.text
                            width: modelData.width * keyboard.width / columns - rowSpacing
                            height: keyboard.height / rows - columnSpacing
                            onClicked: root.moonClicked(text)
                        }
                    }
                }
                Row {
                    spacing: rowSpacing
                    Repeater {
                        model: [
                             {text: '.', width: 1},
                             {text: '0',      width: 1},
                             {text: '\u21B5', width: 1},
                        ]
                        delegate: MoonButton {
                            colorBTN: text === "\u21B5" ? "#3A4B5D" : "#2A3139"
                            palette.buttonText: "white"
                            text:  modelData.text
                            width: modelData.width * keyboard.width / columns - rowSpacing
                            height: keyboard.height / rows - columnSpacing
                            enabled: text === '\u21B5'? textInput.text: true
                            onClicked: root.moonClicked(text)
                        }
                    }
                }
            }
        }
    }

    signal moonClicked(string text)
    onMoonClicked: function(text){
        var position
        if( text === '\u232B') {
            position = textInput.cursorPosition
            textInput.text = textInput.text.substring(0, textInput.cursorPosition - 1) +
                             textInput.text.substring(textInput.cursorPosition, textInput.text.length)
            textInput.cursorPosition = position - 1
        }
        else if(text === '\u21B5')  moonAccepted(textInput.text)
        else { // insert text
            position = textInput.cursorPosition
            textInput.text = textInput.text.substring(0, textInput.cursorPosition) + text +
                             textInput.text.substring(textInput.cursorPosition, textInput.text.length)
            textInput.cursorPosition = position + 1
        }
    }
}
