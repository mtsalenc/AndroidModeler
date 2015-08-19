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
        classpath 'com.android.tools.build:gradle:1.2.3'
    }
}

apply plugin: 'com.android.application'

android {
    compileSdkVersion 22
    buildToolsVersion "19.1.0"
    compileOptions {
        sourceCompatibility JavaVersion.VERSION_1_7
        targetCompatibility JavaVersion.VERSION_1_7
    }
    defaultConfig {
        minSdkVersion 22
        targetSdkVersion 22
    }
    productFlavors {
    }
}

dependencies {
    compile 'com.android.support:support-v4:22.2.1'
    compile 'com.google.android.gms:play-services:7.5.0'
}
'''
}
