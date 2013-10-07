import bb.cascades 1.2

Page {

    Container {
        verticalAlignment: VerticalAlignment.Fill
        horizontalAlignment: HorizontalAlignment.Fill
        layout: DockLayout {

        }
        background: tiledBackground.imagePaint

        Container {

            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center

            id: searchArea

            ImageView {
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center

                imageSource: "asset:///images/icon_94.png"
            }
            Label {
                horizontalAlignment: HorizontalAlignment.Fill
                text: qsTr("Instant Answer BB") + Retranslate.onLanguageChanged
                textStyle.textAlign: TextAlign.Center
                textStyle.color: Color.DarkGray
                textStyle.base: SystemDefaults.TextStyles.BigText
            }

            Label {
                horizontalAlignment: HorizontalAlignment.Fill
                text: qsTr("Version") + Retranslate.onLanguageChanged + "1.0"
                textStyle.textAlign: TextAlign.Center
                textStyle.color: Color.DarkGray
            }

            Label {
                topMargin: 40
                horizontalAlignment: HorizontalAlignment.Fill
                text: qsTr("Powered by DuckDuckGo Instanct Answer API") + Retranslate.onLanguageChanged
                textStyle.textAlign: TextAlign.Center
                textStyle.color: Color.DarkGray
            }

            ImageView {
                imageSource: "asset:///badges/i_love_ddg.png"
                loadEffect: ImageViewLoadEffect.FadeZoom
                horizontalAlignment: HorizontalAlignment.Center
            }

        }
    }
}
