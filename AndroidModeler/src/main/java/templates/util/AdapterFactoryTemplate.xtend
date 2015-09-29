package templates.util

import model.AndroidApplication
import model.Component
import org.eclipse.emf.common.util.EList
import java.util.List
import org.eclipse.emf.common.notify.Adapter
import org.eclipse.emf.ecore.EObject

class AdapterFactoryTemplate{
	
	
	
	def AdapterFactoryTemplate() {}
	
	def String generate(AndroidApplication app, EList<Component> components, List<Class<?>> classList) {'''	
package «app.javaName».util;

import «app.javaName».«app.name»Package;
«FOR Class<?> aClass : classList»
«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length).toFirstUpper »
import «app.javaName».«classname»;
«ENDFOR»

import org.eclipse.emf.common.notify.Adapter;
import org.eclipse.emf.common.notify.Notifier;
import org.eclipse.emf.common.notify.impl.AdapterFactoryImpl;
import org.eclipse.emf.ecore.EObject;

/**
 * <!-- begin-user-doc -->
 * The <b>Adapter Factory</b> for the model.
 * It provides an adapter <code>createXXX</code> method for each class of the model.
 * <!-- end-user-doc -->
 * @see «app.name».«app.javaName»Package
 * @generated
 */
public class «app.name»AdapterFactory extends AdapterFactoryImpl {
	/**
	 * The cached model package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected static «app.name»Package modelPackage;

	/**
	 * Creates an instance of the adapter factory.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public «app.name»AdapterFactory() {
		if (modelPackage == null) {
			modelPackage = «app.name»Package.eINSTANCE;
		}
	}

	/**
	 * Returns whether this factory is applicable for the type of the object.
	 * <!-- begin-user-doc -->
	 * This implementation returns <code>true</code> if the object is either the model's package or is an instance object of the model.
	 * <!-- end-user-doc -->
	 * @return whether this factory is applicable for the type of the object.
	 * @generated
	 */
	@Override
	public boolean isFactoryForType(Object object) {
		if (object == modelPackage) {
			return true;
		}
		if (object instanceof EObject) {
			return ((EObject)object).eClass().getEPackage() == modelPackage;
		}
		return false;
	}

	/**
	 * The switch that delegates to the <code>createXXX</code> methods.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	protected «app.name»Switch<Adapter> modelSwitch =
		new «app.name»Switch<Adapter>() {
			«FOR Class<?> aClass : classList»
			«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length).toFirstUpper »
			@Override
			public Adapter case«classname»(«classname» object) {
				return create«classname»Adapter();
			}
			«ENDFOR»
			@Override
			public Adapter defaultCase(EObject object) {
				return createEObjectAdapter();
			}
		};

	/**
	 * Creates an adapter for the <code>target</code>.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @param target the object to adapt.
	 * @return the adapter for the <code>target</code>.
	 * @generated
	 */
	@Override
	public Adapter createAdapter(Notifier target) {
		return modelSwitch.doSwitch((EObject)target);
	}
	
	«FOR Class<?> aClass : classList»
	«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length).toFirstUpper »
	/**
	 * Creates a new adapter for an object of class '{@link «app.name».«classname» <em>«classname»</em>}'.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null so that we can easily ignore cases;
	 * it's useful to ignore a case when inheritance will catch all the cases anyway.
	 * <!-- end-user-doc -->
	 * @return the new adapter. 
	 * @generated
	 */	
	 public Adapter create«classname»Adapter() {
		return null;
	}
	 
	
	«ENDFOR»
	
	/**
	 * Creates a new adapter for the default case.
	 * <!-- begin-user-doc -->
	 * This default implementation returns null.
	 * <!-- end-user-doc -->
	 * @return the new adapter.
	 * @generated
	 */
	public Adapter createEObjectAdapter() {
		return null;
	}	

}


'''
	}

	
}