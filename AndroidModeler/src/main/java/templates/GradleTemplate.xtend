package templates

import model.AndroidApplication

class GradleTemplate implements ApplicationTemplate {
	private static var GradleTemplate INSTANCE = null;
	
	def GradleTemplate() {}
	
	def static public GradleTemplate getInstance() {
		if (INSTANCE == null)
			INSTANCE = new GradleTemplate
		return INSTANCE
	}

	override generate(AndroidApplication app) '''
buildscript {
    repositories {
        mavenCentral()
    }

    dependencies {
        classpath 'com.android.tools.build:gradle:0.9.0'
    }
}

apply plugin: 'android'

android {
    compileSdkVersion «app.targetSDK»
    buildToolsVersion "19.0.0"
}
'''
}
