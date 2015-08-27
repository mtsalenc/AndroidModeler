package templates

import model.AndroidApplication
import model.Component
import org.eclipse.emf.common.util.EList

class FactoryTemplate{
	def FactoryTemplate() {}
	
	def String generate(AndroidApplication app, EList<Component> components) {'''
	
package «app.javaName»;

import org.eclipse.emf.ecore.EFactory;

/**
 * <!-- begin-user-doc -->
 * The <b>Factory</b> for the model.
 * It provides a create method for each non-abstract class of the model.
 * <!-- end-user-doc --> * 
 * @generated
 */
public interface «app.name»Factory extends EFactory {
	/**
	 * The singleton instance of the factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	«app.name»Factory eINSTANCE = «app.javaName».impl.«app.name»FactoryImpl.init();

	/**
	 * Returns the package supported by this factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the package supported by this factory.
	 * @generated
	 */
	«app.name»Package get«app.name»Package();	
	
	«FOR Component c : components»
	/**
	 * Returns a new object of class '<em>Dog</em>'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return a new object of class '<em>Dog</em>'.
	 * @generated
	 */
	«c.name.toFirstUpper()» create«c.name.toFirstUpper()»();
	«ENDFOR»
}
'''
}

	
}