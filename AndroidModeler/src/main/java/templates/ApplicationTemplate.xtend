package templates

import model.AndroidApplication

interface ApplicationTemplate {
	def String generate(AndroidApplication app);
}
