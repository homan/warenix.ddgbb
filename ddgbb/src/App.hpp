/*
 * App.hpp
 *
 *  Created on: Oct 3, 2013
 *      Author: warenix
 */

#ifndef MYAPP_HPP_
#define MYAPP_HPP_

#include <QObject>
#include <QMetaType>
#include <QString>

namespace bb {
namespace cascades {
class Application;
}
}

class App: public QObject {
Q_OBJECT
public:
	App(bb::cascades::Application *app);
	virtual ~App();

	Q_INVOKABLE
	void copyText(QByteArray text, QString toastMessage);
};

#endif /* APP_HPP_ */
