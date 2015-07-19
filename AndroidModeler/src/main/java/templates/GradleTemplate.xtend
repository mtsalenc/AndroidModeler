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
        classpath 'com.android.tools.build:gradle:1.1.0'
    }
}

apply plugin: 'com.android.application'

android {
    compileSdkVersion «app.targetSDK»
    buildToolsVersion "19.1.0"    
}

dependencies {
    compile 'com.android.support:support-v4:19.1.0'
    compile 'com.google.android.gms:play-services:4.0.30'
}
'''
}
