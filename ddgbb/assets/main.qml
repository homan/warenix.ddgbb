import bb.cascades 1.2

NavigationPane {
    id: navigationPane

    Menu.definition: MenuDefinition {
        actions: [
            ActionItem {
                title: "About"

                onTriggered: {
                    var myPage = aboutPageDefinition.createObject();
                    navigationPane.push(myPage);
                }
                imageSource: "asset:///action_icons/info.png"
            }
        ]
    }

    Page {
        id: root

        titleBar: TitleBar {
            // Localized text with the dynamic translation and locale updates support
            title: qsTr("Instant Answer BB") + Retranslate.onLocaleOrLanguageChanged
        }

        function startSearch() {
            var myPage = secondPageDefinition.createObject();
            myPage.setQuery(query.text.trim());
            navigationPane.push(myPage);
        }

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

                Container {

                    layout: DockLayout {
                    }

                    ImageView {
                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center

                        imageSource: "asset:///images/searcharea.png"
                    }

                    //! [1]
                    TextField {
                        id: query

                        horizontalAlignment: HorizontalAlignment.Center
                        verticalAlignment: VerticalAlignment.Center

                        preferredWidth: 485
                        preferredHeight: 65
                        translationX: -35
                        hintText: qsTr("Please enter query") + Retranslate.onLanguageChanged

                        input {
                            submitKey: SubmitKey.Search

                            onSubmitted: root.startSearch()
                        }
                    }

                    ImageButton {
                        horizontalAlignment: HorizontalAlignment.Right
                        verticalAlignment: VerticalAlignment.Center

                        translationX: -35

                        defaultImageSource: "asset:///images/find_button.png"
                        pressedImageSource: "asset:///images/find_button.png"

                        onClicked: root.startSearch()
                    }
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

            /*
             * Container {
             * 
             * Container {
             * layout: StackLayout {
             * orientation: LayoutOrientation.LeftToRight
             * }
             * 
             * TextField {
             * id: query
             * text: "nba"
             * hintText: qsTr("Enter a query please")
             * leftPadding: 20.0
             * rightPadding: 20.0
             * layoutProperties: StackLayoutProperties {
             * spaceQuota: 2
             * }
             * maximumLength: 20
             * }
             * Button {
             * text: "Search"
             * onClicked: {
             * var myPage = secondPageDefinition.createObject();
             * myPage.setApp(_app);
             * myPage.setQuery(query.text.trim());
             * navigationPane.push(myPage);
             * }
             * enabled: query.text != ""
             * layoutProperties: StackLayoutProperties {
             * spaceQuota: 1
             * }
             * }
             * }
             * 
             * Label {
             * topMargin: 40
             * horizontalAlignment: HorizontalAlignment.Fill
             * text: "Powered by DuckDuckGo Instanct Answer API"
             * textStyle.textAlign: TextAlign.Center
             * }
             * 
             * ImageView {
             * imageSource: "asset:///badges/i_love_ddg.png"
             * loadEffect: ImageViewLoadEffect.FadeZoom
             * horizontalAlignment: HorizontalAlignment.Center
             * }
             * 
             * verticalAlignment: VerticalAlignment.Center
             * }
             * 
             * 
             * }*/
            /*
             * actions: ActionItem {
             * title: qsTr("Second page") + Retranslate.onLocaleOrLanguageChanged
             * ActionBar.placement: ActionBarPlacement.OnBar
             * 
             * onTriggered: {
             * // A second Page is created and pushed when this action is triggered.
             * navigationPane.push(secondPageDefinition.createObject());
             * }
             * }
             */
        }
    }
    attachedObjects: [
        // Definition of the second Page, used to dynamically create the Page above.
        ComponentDefinition {
            id: secondPageDefinition
            source: "DetailsPage.qml"
        },
        ComponentDefinition {
            id: aboutPageDefinition
            source: "AboutPage.qml"
        },
        ImagePaintDefinition {
            id: tiledBackground
            repeatPattern: RepeatPattern.XY
            imageSource: "asset:///images/tiled_background.amd"
        }
    ]

    onPopTransitionEnded: {
        // Destroy the popped Page once the back transition has ended.
        page.destroy();
    }

}
