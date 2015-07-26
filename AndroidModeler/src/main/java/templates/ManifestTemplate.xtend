package templates

import model.Component
import model.AndroidApplication

class ManifestTemplate implements ApplicationTemplate {
	private static var ManifestTemplate INSTANCE = null;
	
	def ManifestTemplate() {}
	
	def static public ManifestTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new ManifestTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app) '''
<?xml version="1.0" encoding="utf-8"?>

<!--
  Generated with DroidModeler
-->

<manifest xmlns:android="http://schemas.android.com/apk/res/android"
    package="«app.javaName»" android:versionCode="1" android:versionName="1.0">

    <uses-sdk android:minSdkVersion="«app.minSDK»" android:targetSdkVersion="«app.targetSDK»"/>

	«FOR p : app.defines»
		<permission android:name="«p.name»" android:protectionLevel="«p.protectionLevel»" />
	«ENDFOR»

	«FOR p : app.uses»
		<uses-permission android:name="«p.name»" />
	«ENDFOR»

    <application
        android:label="«app.name»" android:allowBackup="true">

		«FOR m : app.metadatas»
			<meta-data android:name="«m.name»" android:value="«m.value»"/>
		«ENDFOR»

		«FOR c : app.components»
			<«c.XMLTag» android:name=".«c.name»">
				«generateIntentFilters(c)»
			</«c.XMLTag»>

		«ENDFOR»
    </application>

</manifest>
'''

	def generateIntentFilters(Component c) '''
		«FOR filter : c.intentFilters»
			<intent-filter>
				«FOR a : filter.actions»
					<action android:name="«a.name»"/>
				«ENDFOR»
				«FOR cat : filter.categories»
					<category android:name="«cat.name»"/>
				«ENDFOR»
				«FOR d : filter.datas»
					<data android:mimeType="«d.name»"/>
				«ENDFOR»
			</intent-filter>
		«ENDFOR»
	'''
}
