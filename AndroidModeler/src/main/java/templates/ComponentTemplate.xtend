package templates

import model.AndroidApplication
import model.Component

interface ComponentTemplate {
	def String generate(AndroidApplication app, Component c);
}
