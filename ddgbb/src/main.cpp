// Default empty project template
#include <bb/cascades/Application>
#include <bb/cascades/QmlDocument>
#include <bb/cascades/AbstractPane>

#include <QLocale>
#include <QTranslator>

#include "App.hpp"

using namespace bb::cascades;

Q_DECL_EXPORT int main(int argc, char **argv) {

	Application app(argc, argv);

	// Create the Application UI object, this is where the main.qml file
	// is loaded and the application scene is set.
	//new ApplicationUI(&app);

	//App mainApp;

	// localization support
	QTranslator translator;
	QString locale_string = QLocale().name();
	QString filename = QString("ddgbb_%1").arg(locale_string);
	if (translator.load(filename, "app/native/qm")) {
		app.installTranslator(&translator);
	}

	new App(&app);

	// Enter the application main event loop.
	return Application::exec();
}
