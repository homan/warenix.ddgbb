/*
 * App.cpp
 *
 *  Created on: Oct 3, 2013
 *      Author: warenix
 */

#include "App.hpp"

#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>
#include "WebImageView.h"
#include <QString>

#include <bb/system/Clipboard>
#include <bb/system/SystemToast>

using namespace bb::cascades;
using namespace bb::system;
App::App(bb::cascades::Application *app) :
		QObject(app) {

	qmlRegisterType<WebImageView>("org.labsquare", 1, 0, "WebImageView");

	QmlDocument *qml = QmlDocument::create("asset:///main.qml").parent(this);
	// create root object for the UI
	qml->setContextProperty("_app", this);

	AbstractPane *root = qml->createRootObject<AbstractPane>();
	// set created root object as a scene
	app->setScene(root);
}

App::~App() {
}

void App::copyText(QByteArray text, QString toastMessage) {
	bb::system::Clipboard clipboard;
	clipboard.clear();
	clipboard.insert("text/plain", text);
	bb::system::SystemToast *toast = new SystemToast(this);
	// feel free to change the message below to whatever you need.
	toast->setBody(toastMessage);
	toast->show();
}
