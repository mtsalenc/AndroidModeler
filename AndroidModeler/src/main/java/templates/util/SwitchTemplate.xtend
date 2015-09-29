package templates.util

import model.AndroidApplication
import model.Component
import org.eclipse.emf.common.util.EList
import org.eclipse.emf.ecore.EObject
import org.eclipse.emf.ecore.util.Switch
import org.eclipse.emf.ecore.EPackage

import java.util.List

class SwitchTemplate{
	def SwitchTemplate() {}
	
	def String generate(AndroidApplication app, EList<Component> components, List<Class<?>> classList) {'''	

package «app.javaName».util;

import «app.javaName».«app.name»Package;
import «app.javaName».*;

import org.eclipse.emf.ecore.EObject;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.util.Switch;

/**
 * <!-- begin-user-doc -->
 * The <b>Switch</b> for the model's inheritance hierarchy.
 * It supports the call {@link #doSwitch(EObject) doSwitch(object)}
 * to invoke the <code>caseXXX</code> method for each class of the model,
 * starting with the actual class of the object
 * and proceeding up the inheritance hierarchy
 * until a non-null result is returned,
 * which is the result of the switch.
 * <!-- end-user-doc -->
 * @see barker.BarkerPackage
 * @generated
 */
public class «app.name.toFirstUpper»Switch<T> extends Switch<T> {
	/**
	 * The cached model package
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static «app.name.toFirstUpper»Package modelPackage;

	/**
	 * Creates an instance of the switch.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public «app.name.toFirstUpper»Switch() {
		if (modelPackage == null) {
			modelPackage = «app.name.toFirstUpper»Package.eINSTANCE;
		}
	}

	/**
	 * Checks whether this is a switch for the given package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param ePackage the package in question.
	 * @return whether this is a switch for the given package.
	 * @generated
	 */
	@Override
	protected boolean isSwitchFor(EPackage ePackage) {
		return ePackage == modelPackage;
	}
	
	/**
	 * Calls <code>caseXXX</code> for each class of the model until one returns a non null result; it yields that result.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the first non-null result returned by a <code>caseXXX</code> call.
	 * @generated
	 */
	@Override
	protected T doSwitch(int classifierID, EObject theEObject) {
		switch (classifierID) {
			«FOR Class<?> aClass : classList»
			«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length).toFirstUpper »
			case «app.name.toFirstUpper»Package.«classname.toUpperCase»: {
				«classname.toFirstUpper» «classname» = («classname.toFirstUpper»)theEObject;
				T result = case«classname.toFirstUpper»(«classname»);
				if (result == null) result = defaultCase(theEObject);
				return result;
			}	
			«ENDFOR»				
			default: return defaultCase(theEObject);
		}
	}
	
	«FOR Class<?> aClass : classList»
	«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length).toFirstUpper »
	/**
	 * Returns the result of interpreting the object as an instance of '<em>«classname.toFirstUpper»</em>'.
	 * <!-- begin-user-doc -->
	 * This implementation returns null;
	 * returning a non-null result will terminate the switch.
	 * <!-- end-user-doc -->
	 * @param object the target of the switch.
	 * @return the result of interpreting the object as an instance of '<em>«classname.toFirstUpper»</em>'.
	 * @see #doSwitch(org.eclipse.emf.ecore.EObject) doSwitch(EObject)
	 * @generated
	 */
	public T case«classname.toFirstUpper»(«classname» object) {
		return null;
	}
	«ENDFOR»
}

'''
	}	
}