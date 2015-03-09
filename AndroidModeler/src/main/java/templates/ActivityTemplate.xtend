package templates

import model.AndroidApplication
import model.Component

class ActivityTemplate implements ComponentTemplate {
	private static var ActivityTemplate INSTANCE = null;
	
	def ActivityTemplate() {}
	
	def static public ActivityTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new ActivityTemplate
		return INSTANCE
	}
	
	override generate(AndroidApplication app, Component c) '''
/*
	Generated with DroidModeler
 */
package «app.javaName»;
 
import android.app.Activity;
 
public class «c.name» extends Activity {
	// TODO
}
'''
}
