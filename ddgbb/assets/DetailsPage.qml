import bb.cascades 1.0
import bb.data 1.0
import org.labsquare 1.0

Page {
    id: myPage

    titleBar: TitleBar {
        title: qsTr("Result") + Retranslate.onLanguageChanged
    }
    content: Container {
        layout: DockLayout {

        }

        background: tiledBackground.imagePaint

        Container {
            id: emptyView

            horizontalAlignment: HorizontalAlignment.Fill
            verticalAlignment: VerticalAlignment.Fill

            layout: DockLayout {

            }
            background: tiledEmptyBackground.imagePaint

            Label {
                text: qsTr("No result for your query. Please try a new one.") + Retranslate.onLanguageChanged
                horizontalAlignment: HorizontalAlignment.Center
                verticalAlignment: VerticalAlignment.Center
                textStyle {
                    base: SystemDefaults.TextStyles.TitleText
                    textAlign: TextAlign.Center
                    color: Color.Black
                }
                multiline: true
            }
        }

        ListView {
            id: myListView

            // Associate the list view with the data model that's defined in the
            // attachedObjects list
            dataModel: dataModel

            listItemComponents: [
                ListItemComponent {
                    type: "info"
                    Label {
                        leftPadding: 20
                        horizontalAlignment: HorizontalAlignment.Fill
                        text: ListItemData.data
                        textStyle {
                            base: SystemDefaults.TextStyles.TitleText
                            color: Color.Black
                        }
                        multiline: true
                    }
                },
                ListItemComponent {
                    type: "quote"
                    Container {
                        layout: StackLayout {

                        }
                        Label {
                            horizontalAlignment: HorizontalAlignment.Fill
                            text: ListItemData.data[0]
                            textStyle {
                                base: SystemDefaults.TextStyles.BodyText
                                color: Color.Black
                            }
                            multiline: true
                        }
                        Label {
                            horizontalAlignment: HorizontalAlignment.Right
                            text: " ~ " + ListItemData.data[1]

                            textStyle {
                                base: SystemDefaults.TextStyles.SubtitleText
                                color: Color.Black
                                textAlign: TextAlign.Right
                            }
                            multiline: true
                        }

                        contextActions: [
                            ActionSet {
                                title: qsTr("Know more about it") + Retranslate.onLanguageChanged
                                subtitle: ListItemData.data[2]
                                actions: [
                                    InvokeActionItem {
                                        title: qsTr("Open in Browser") + Retranslate.onLanguageChanged
                                        id: browserQuery
                                        ActionBar.placement: ActionBarPlacement.InOverflow
                                        // query
                                        query.invokeActionId: "bb.action.OPEN"
                                        query.uri: ListItemData.data[2]
                                        query.invokeTargetId: "sys.browser"
                                        query.onQueryChanged: {
                                            browserQuery.query.updateQuery();
                                        }
                                    },
                                    ActionItem {
                                        title: qsTr("Copy Content")
                                        onTriggered: {

                                            Qt.myApp.copyText(ListItemData.data[0], qsTr("Content is copied to clipboard.") + Retranslate.onLanguageChanged)
                                        }
                                        imageSource: "asset:///action_icons/copy.png"
                                    }
                                ]
                            }
                        ]
                    }
                },
                ListItemComponent {
                    type: "coverImage"
                    Container {
                        layout: DockLayout {

                        }
                        ProgressIndicator {
                            value: coverImage.loading
                            verticalAlignment: VerticalAlignment.Center
                            horizontalAlignment: HorizontalAlignment.Center
                            visible: (coverImage.loading < 1.0)
                        }

                        WebImageView {

                            id: coverImage
                            topPadding: 20
                            bottomPadding: 20
                            leftPadding: 20
                            rightPadding: 20

                            horizontalAlignment: HorizontalAlignment.Fill
                            verticalAlignment: VerticalAlignment.Center

                            onCreationCompleted: {
                                if (ListItemData.data) {
                                    coverImage.url = ListItemData.data;
                                } else {
                                    coverImage.resetImage();
                                }
                            }
                        }

                    }

                },

                ListItemComponent {
                    type: "type2"

                    Container {
                        // horizontalAlignment: HorizontalAlignment.Center
                        topPadding: 20
                        bottomPadding: 20
                        leftPadding: 20
                        rightPadding: 20

                        layout: StackLayout {
                            orientation: LayoutOrientation.LeftToRight
                        }

                        Container {
                            layoutProperties: StackLayoutProperties {
                                spaceQuota: 1
                            }
                            layout: DockLayout {

                            }
                            ProgressIndicator {
                                id: myProgressIndicator
                                value: myImage.loading
                                verticalAlignment: VerticalAlignment.Center
                                horizontalAlignment: HorizontalAlignment.Center
                                visible: (myImage.loading < 1.0)
                            }
                            WebImageView {

                                id: myImage
                                horizontalAlignment: HorizontalAlignment.Center
                                verticalAlignment: VerticalAlignment.Center
                                //imageSource: itemRoot.ListItem.selected ? "asset:///images/item_background_selected.png" : "asset:///images/item_background.png"
                                //url: ListItemData.data.Image

                                onCreationCompleted: {
                                    if (ListItemData.data['image']) {
                                        myImage.url = ListItemData.data['image'];
                                    } else {
                                        myImage.resetImageSource();
                                        myProgressIndicator.visible = false;
                                    }
                                }
                            }
                        }

                        Container {

                            layoutProperties: StackLayoutProperties {
                                spaceQuota: 4
                            }

                            topPadding: 20
                            bottomPadding: 20
                            leftPadding: 20
                            rightPadding: 20

                            Label {
                                id: myText
                                text: ListItemData.data['num'] + ".) " + ListItemData.data['Text']
                                textStyle {
                                    base: SystemDefaults.TextStyles.TitleText
                                    color: Color.Black
                                }

                                multiline: true
                            }
                            Label {
                                //horizontalAlignment: HorizontalAlignment.Center
                                //verticalAlignment: VerticalAlignment.Center
                                id: myUrl
                                text: ListItemData.data['FirstURL']
                                textStyle {
                                    base: SystemDefaults.TextStyles.BodyText
                                    color: Color.DarkGray
                                }
                                multiline: true
                            }

                            contextActions: [
                                ActionSet {
                                    title: qsTr("Know more about it") + Retranslate.onLanguageChanged
                                    subtitle: ListItemData.data['FirstURL']
                                    actions: [
                                        InvokeActionItem {
                                            title: qsTr("Open in Browser") + Retranslate.onLanguageChanged
                                            id: browserQuery2
                                            ActionBar.placement: ActionBarPlacement.InOverflow
                                            // query
                                            query.invokeActionId: "bb.action.OPEN"
                                            query.uri: myUrl.text
                                            query.invokeTargetId: "sys.browser"
                                            query.onQueryChanged: {
                                                browserQuery2.query.updateQuery();
                                            }

                                        },
                                        ActionItem {
                                            title: qsTr("Copy Content")
                                            onTriggered: {

                                                Qt.myApp.copyText(ListItemData.data['Text'], qsTr("Content is copied to clipboard.") + Retranslate.onLanguageChanged)
                                            }
                                            imageSource: "asset:///action_icons/copy.png"
                                        }

                                    ]
                                }
                            ]

                        }
                    }
                }
            /*
             * ListItemComponent {
             * type: "topics"
             * 
             * Container {
             * layout: StackLayout {
             * }
             * 
             * ExpandableItem {
             * headerText: ListItemData.data.Name + "(" + ListItemData.data.Topics.length + ")"
             * bodyText: "click to expand 1"
             * expandImage: "asset:///images/expand.png"
             * collapseImage: "asset:///images/collapse.png"
             * bodyVisible: false
             * }
             * 
             * }
             * }
             */
            ]

            function itemType(data, indexPath) {
                return data.type;
            }

        } // end listview
    }

    attachedObjects: [
        GroupDataModel {
            id: dataModel

            // Sort the data in the data model by the "pubDate" field, in
            // descending order, without any automatic grouping
            //sortingKeys: [ "pubDate" ]
            sortedAscending: false
            grouping: ItemGrouping.None
        },
        DataSource {
            id: dataSource

            // Load the XML data from a remote data source, specifying that the
            // "item" data items should be loaded
            //source: "http://news.google.com/news?topic=h&output=rss"
            //query: "/rss/channel/item"
            //type: DataSourceType.Xml
            //source: "http://api.duckduckgo.com/?q=" + query.toString() + "&format=json&no_redirect=1"
            type: DataSourceType.Json

            onDataLoaded: {
                // After the data is loaded, clear any existing items in the data
                // model and populate it with the new data
                var elem;
                var tempdata;

                var resultType = data.Type;
                /*
                 * if (resultType == "D") {
                 * tempdata = createDisambiguation(data)
                 * } else if (resultType == "A") {
                 * tempdata = createArticle(data);
                 * } else if (resultType == "C") {
                 * tempdata = createCategory(data);
                 * } else if (resultType == "N") {
                 * tempdata = createName(data);
                 * } else if (resultType == "E") {
                 * tempdata = createExclusive(data);
                 * } else {
                 * 
                 * }
                 */
                tempdata = createDisambiguation(data)
                console.log("tempdata.length " + tempdata.length)
                if (tempdata && tempdata.length > 2) {
                    dataModel.clear();
                    dataModel.insertList(tempdata.reverse())
                    emptyView.visible = false;
                } else {
                    emptyView.visible = true;
                }
            }
        },
        ImagePaintDefinition {
            id: tiledEmptyBackground
            repeatPattern: RepeatPattern.XY
            imageSource: "asset:///images/tiled_empty_background.amd"
        },
        ImagePaintDefinition {
            id: tiledBackground
            repeatPattern: RepeatPattern.XY
            imageSource: "asset:///images/tiled_background.amd"
        }

    ]

    onCreationCompleted: {
        // When the top-level Page is created, direct the data source to start
        // loading data
        Qt.myApp = _app;
    }

    function setQuery(query) {
        if (query) {
            var url = "http://api.duckduckgo.com/?q=" + query.toString() + "&format=json&no_redirect=1";
            dataSource.source = url;
            dataSource.load();
        }
    }

    function createElement(type, value) {
        if (value) {
            var elem = new Object();
            elem.data = value
            elem.type = type
            return elem;
        }
        return null;
    }

    function fillResultList(resultList, resultDataList, type) {
        var elem;
        var data;
        for (var j = 0; j < resultDataList.length; ++ j) {
            data = resultDataList[j]

            if (data.Topics && data.Name) {
                if (elem = createElement("header", data.Name + " (" + data.Topics.length + ")")) {
                    resultList.push(elem)
                }
                fillResultList(resultList, data.Topics, type);
            } else {
                elem = new Object();
                elem.data = {
                    "num": j + 1,
                    "Text": data.Text,
                    "FirstURL": data.FirstURL
                }
                if (data.Icon.URL) {
                    elem.data['image'] = data.Icon.URL;
                }
                elem.type = type;
                resultList.push(elem);
                console.log("added " + data.Text)
            }
        }

    }

    function createDisambiguation(data) {
        var tempdata = new Array();
        var elem;

        if (elem = createElement("coverImage", data.Image)) {
            tempdata.push(elem)
        }

        if (elem = createElement("info", data.Heading)) {
            tempdata.push(elem)
        }

        if (elem = createElement("header", qsTr("Basic Info") + Retranslate.onLanguageChanged)) {
            tempdata.push(elem)
        }
        /*
         * if (elem = createElement("info", data.Definition)) {
         * tempdata.push(elem)
         * if (elem = createElement("info", data.DefinitionSource)) {
         * tempdata.push(elem)
         * }
         * }
         */
        if (data.Definition && data.DefinitionSource && data.DefinitionURL && (elem = createElement("quote", Array(data.Definition, data.DefinitionSource, data.DefinitionURL)))) {
            tempdata.push(elem)
        }

        if (data.Abstract && data.AbstractSource && data.AbstractURL && (elem = createElement("quote", Array(data.Abstract, data.AbstractSource, data.AbstractURL)))) {
            tempdata.push(elem)
        }

        if (elem = createElement("header", qsTr("Related Topics") + Retranslate.onLanguageChanged)) {
            tempdata.push(elem)
        }
        fillResultList(tempdata, data.RelatedTopics, "type2");

        return tempdata;
    }

}
