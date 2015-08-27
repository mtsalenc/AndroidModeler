package templates.impl

import model.AndroidApplication
import model.Component
import org.eclipse.emf.common.util.EList


class FactoryImplTemplate{
	def FactoryImplTemplate() {}
	
	def String generate(AndroidApplication app, EList<Component> components) {'''
	
package «app.javaName».impl;

import org.eclipse.emf.ecore.EFactory;
import org.eclipse.emf.common.util.EList;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.impl.EFactoryImpl;
import org.eclipse.emf.ecore.plugin.EcorePlugin;

import «app.javaName».«app.name»Factory;
import «app.javaName».«app.name»Package;

«FOR Component c : components»
import «app.javaName.toLowerCase».«c.name»;
«ENDFOR»


/**
 * <!-- begin-user-doc --> 
 * An implementation of the model <b>Factory</b>.
 * <!-- end-user-doc --> * 
 * @generated
 */
public class «app.name»FactoryImpl extends EFactoryImpl implements «app.name»Factory {
	/**
	 * Creates the default factory implementation.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	 public static «app.name»Factory init() {
		try {
			«app.name»Factory the«app.name»Factory = («app.name»Factory)EPackage.Registry.INSTANCE.getEFactory(«app.name»Package.eNS_URI);
			if (the«app.name»Factory != null) {
				return the«app.name»Factory;
			}
		}
		catch (Exception exception) {
			EcorePlugin.INSTANCE.log(exception);
		}
		return new «app.name»FactoryImpl();
	}
	
	/**
	 * Creates an instance of the factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public «app.name»FactoryImpl() {
		super();
	}
	
	«FOR Component c : components»
		/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public «c.name» create«c.name»() {
		«c.name»Impl «c.name.toLowerCase» = new «c.name»Impl();
		return «c.name.toLowerCase»;
	}
	«ENDFOR»
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public «app.name»Package get«app.name»Package() {
		return («app.name»Package)getEPackage();
	}

}
'''
}

	
}