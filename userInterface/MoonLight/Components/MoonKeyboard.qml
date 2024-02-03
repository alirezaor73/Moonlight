import QtQuick
import QtQuick.Controls

Item {
    id: root

    // public
    signal moonAccepted(string keyboardData);
    signal moonRejected();

    // private
    width: 1280;  height: 344

    property bool   shift:          false
    property double rowSpacing:     0.007 * width
    property double columnSpacing:  0.02 * height
    property double columns:        10
    property double rows:           5

    MouseArea {anchors.fill: parent}

    Rectangle {
        width: root.width;  height: 0.2 * root.height
        color: "#191C22"

        MoonButton {
            primaryColor:  "#2A3139"
            palette.buttonText: "white"
            borderColor: "transparent"
            secondaryColor:  "white"
            id: closeButton
            text: '\u2193'
            width: height;  height: 0.8 * parent.height
            anchors.verticalCenter: parent.verticalCenter
            x: columnSpacing
            onClicked: moonRejected()
        }

        TextInput {
            id: textInput
            cursorVisible: true
            anchors {left: closeButton.right;  right: clearButton.left;  verticalCenter: parent.verticalCenter;  margins: 0.03 * root.width}
            font.pixelSize: 0.5 * parent.height
            clip: true
            echoMode: TextInput.Normal
            onAccepted: if(acceptableInput) root.moonAccepted(text)
            color: "white"
        }

        MoonButton {
            primaryColor:  "#2A3139"
            palette.buttonText: "white"
            borderColor: "transparent"
            secondaryColor:  "white"
            id: clearButton
            text: '\u2715'
            width: height;  height: 0.8 * parent.height
            anchors {verticalCenter: parent.verticalCenter;  right: parent.right;  rightMargin: columnSpacing}
            enabled:   textInput.text
            onClicked: textInput.text = ''
        }
    }

    Rectangle {
        width: parent.width;  height: 0.8 * parent.height
        anchors.bottom: parent.bottom
        color:"#191C22"

        Item {
            id: keyboard
            anchors {fill: parent; leftMargin: columnSpacing}
            Column {
                spacing: columnSpacing
                Row { // 1234567890
                    spacing: rowSpacing
                    Repeater {
                        model: [
                            {text: '1', width: 1},
                            {text: '2', width: 1},
                            {text: '3', width: 1},
                            {text: '4', width: 1},
                            {text: '5', width: 1},
                            {text: '6', width: 1},
                            {text: '7', width: 1},
                            {text: '8', width: 1},
                            {text: '9', width: 1},
                            {text: '0', width: 1},
                        ]
                        delegate: MoonButton {
                            primaryColor:  "#343C45"
                            palette.buttonText: "white"
                            borderColor: "transparent"
                            secondaryColor:  "white"
                            text: modelData.text
                            width: modelData.width * keyboard.width / columns - rowSpacing
                            height: keyboard.height / rows - columnSpacing
                            onClicked: root.moonClicked(text)
                        }
                    }
                }

                Row { // qwertyuiop
                    spacing: rowSpacing
                    Repeater {
                        model: [
                            {text: 'q',  width: 1},
                            {text: 'w',  width: 1},
                            {text: 'e',  width: 1},
                            {text: 'r',  width: 1},
                            {text: 't',  width: 1},
                            {text: 'y',  width: 1},
                            {text: 'u',  width: 1},
                            {text: 'i',  width: 1},
                            {text: 'o',  width: 1},
                            {text: 'p',  width: 1},
                        ]
                        delegate: MoonButton {
                            primaryColor:  "#2A3139"
                            palette.buttonText: "white"
                            borderColor: "transparent"
                            secondaryColor:  "white"
                            text: shift? modelData.text.toUpperCase():  modelData.text
                            width: modelData.width * keyboard.width / columns - rowSpacing
                            height: keyboard.height / rows - columnSpacing
                            onClicked: root.moonClicked(text)
                        }
                    }
                }

                Row { // asdfghjkl
                    spacing: rowSpacing
                    Repeater {
                        model: [
                            {text: 'a',  width: 1},
                            {text: 's',  width: 1},
                            {text: 'd',  width: 1},
                            {text: 'f',  width: 1},
                            {text: 'g',  width: 1},
                            {text: 'h',  width: 1},
                            {text: 'j',  width: 1},
                            {text: 'k',  width: 1},
                            {text: 'l',  width: 1},
                            {text: '@',  width: 1},
                        ]
                        delegate: MoonButton {
                            primaryColor:  "#2A3139"
                            palette.buttonText: "white"
                            borderColor: "transparent"
                            secondaryColor:  "white"
                            text:  shift? modelData.text.toUpperCase():  modelData.text
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
                            {text: '\u21E7', width: 1}, //shift
                            {text: 'z',      width: 1},
                            {text: 'x',      width: 1},
                            {text: 'c',      width: 1},
                            {text: 'v',      width: 1},
                            {text: 'b',      width: 1},
                            {text: 'n',      width: 1},
                            {text: 'm',      width: 1},
                            {text: '.',      width: 1},
                            {text: '\u232B', width: 1}, //backspace
                        ]

                        delegate: MoonButton {
                            primaryColor:  text === "\u21E7" ?  "#333C45" : "#2A3139"
                            palette.buttonText: "white"
                            borderColor: "transparent"
                            secondaryColor:  "white"
                            text:  shift? modelData.text.toUpperCase():  modelData.text
                            width: modelData.width * keyboard.width / columns - rowSpacing
                            height: keyboard.height / rows - columnSpacing
                            enabled: text === '\u232B'? textInput.text: true  //backspace
                            onClicked: root.moonClicked(text)
                        }
                    }
                }
                Row { // space
                    spacing: rowSpacing
                    Repeater {
                        model: [
                            {text:  "\u25C0",     width: 0.5},
                            {text:  '\u25B6',     width: 0.5},
                            {text:  ' ',     width: 6}, // space
                            {text:  '-',     width: 0.5},
                            {text:  '_',     width: 0.5},
                            {text: '\u21B5', width: 2}, // enter
                        ]

                        delegate: MoonButton {
                            primaryColor:  text === "\u21B5" ? "#3A4B5D" : "#2A3139"
                            palette.buttonText: "white"
                            borderColor: "transparent"
                            secondaryColor:  "white"
                            text:    modelData.text
                            width: modelData.width * keyboard.width / columns - rowSpacing
                            height: keyboard.height / rows - columnSpacing
                            enabled: text === '\u21B5'? textInput.text: true // (enter)

                            onClicked: root.moonClicked(text)
                        }
                    }
                }
            }
        }
    }

    signal moonClicked(string text)
    onMoonClicked: function(text){
        var position = textInput.cursorPosition
        if(text === '\u232B') { //(backspace)
            position = textInput.cursorPosition
            textInput.text = textInput.text.substring(0, textInput.cursorPosition - 1) +
                    textInput.text.substring(textInput.cursorPosition, textInput.text.length)
            textInput.cursorPosition = position - 1
        }
        else if(text === '\u21E7')  shift   = !shift //(shift)
        else if(text === '\u21B5')  moonAccepted(textInput.text) //(enter)
        else if(text === "\u25C0") textInput.cursorPosition = position -1
        else if(text === "\u25B6" ){(textInput.cursorPosition >= textInput.text.length) ? (textInput.cursorPosition = position) : (textInput.cursorPosition = position +1)}
        else { // insert text
            position = textInput.cursorPosition
            textInput.text = textInput.text.substring(0, textInput.cursorPosition) + text +
                    textInput.text.substring(textInput.cursorPosition, textInput.text.length)
            textInput.cursorPosition = position + 1
            shift = false
        }
    }
}
