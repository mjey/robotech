/****************************************************************************
 *
 * (c) 2009-2021 QGROUNDCONTROL PROJECT <http://www.qgroundcontrol.org>
 *
 * QGroundControl is licensed according to the terms in the file
 * COPYING.md in the root of the source code directory.
 *
 ****************************************************************************/

import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs

import QGroundControl.FactSystem
import QGroundControl.FactControls
import QGroundControl.Controllers
import QGroundControl.Palette
import QGroundControl.Controls
import QGroundControl.ScreenTools

Item {
    id: _root

    property var  _autotune:   globals.activeVehicle.autotune
    property real _margins:    ScreenTools.defaultFontPixelHeight

    readonly property string dialogTitle: qsTr("Autotune")

    QGCPalette {
        id:                palette
        colorGroupEnabled: enabled
    }

    Rectangle {
        width:   _root.width
        height:  statusColumn.height + (2 * _margins)
        color:   qgcPal.windowShade
        enabled: _autotune.autotuneEnabled

        QGCButton {
            id:        autotuneButton
            primary:   true
            text:      dialogTitle
            enabled:   !_autotune.autotuneInProgress
            anchors {
                left:             parent.left
                leftMargin:       _margins
                verticalCenter:   parent.verticalCenter
            }

            onClicked: mainWindow.showMessageDialog(dialogTitle,
                                                    qsTr("WARNING!\
            \n\nThe auto-tuning procedure should be executed with caution and requires the vehicle to fly stable enough before attempting the procedure! \
            \n\nBefore starting the auto-tuning process, make sure that: \
            \n1. You have read the auto-tuning guide and have followed the preliminary steps \
            \n2. The current control gains are good enough to stabilize the drone in presence of medium disturbances \
            \n3. You are ready to abort the auto-tuning sequence by moving the RC sticks, if anything unexpected happens. \
            \n\nClick Ok to start the auto-tuning process.\n"),
                                                    Dialog.Ok | Dialog.Cancel,
                                                    function() { _autotune.autotuneRequest() })
        }

        Column {
            id:      statusColumn
            spacing: _margins
            anchors  {
                left:             autotuneButton.right
                right:            parent.right
                leftMargin:       _margins
                rightMargin:      _margins
                verticalCenter:   parent.verticalCenter
            }

            QGCLabel {
                text:   _autotune.autotuneStatus

                anchors {
                    left: parent.left
                }
            }

            ProgressBar {
                value:   _autotune.autotuneProgress

                anchors {
                    left:             parent.left
                    right:            parent.right
                }
            }
        }
    }
}
