package templates

import model.AndroidApplication
import model.Component
import org.eclipse.emf.common.util.EList

class PackageTemplate{
	def PackageTemplate() {}
	
	def String generate(AndroidApplication app, EList<Component> components) {'''
	
package «app.javaName»;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EOperation;
import org.eclipse.emf.ecore.EPackage;

/**
 * <!-- begin-user-doc -->
 * The <b>Package</b> for the model.
 * It contains accessors for the meta objects to represent
 * <ul>
 *   <li>each class,</li>
 *   <li>each feature of each class,</li>
 *   <li>each operation of each class,</li>
 *   <li>each enum,</li>
 *   <li>and each data type</li>
 * </ul>
 * <!-- end-user-doc -->
 * @model kind="package"
 * @generated
 */
public interface «app.name»Package extends EPackage {
	/**
	 * The package name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNAME = "«app.javaName»";

	/**
	 * The package namespace URI.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_URI = "http://www.example.org/«app.name»";

	/**
	 * The package namespace name.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	String eNS_PREFIX = "«app.javaName»";

	/**
	 * The singleton instance of the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	«app.name»Package eINSTANCE = «app.javaName».impl.«app.name»PackageImpl.init();
	«var metaObjectId=-1»
	«FOR Component c : components»
	 /**
	 * The meta object id for the '{@link «app.javaName».«c.name» <em>«c.name»</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see «app.javaName».«c.name»
	 * @see «app.javaName».impl.«app.name»PackageImpl#get«c.name»()
	 * @generated
	 */
	 int «c.name.toUpperCase» = «metaObjectId=metaObjectId+1»;	 
	 
	 /**
	 * The meta object id for the '{@link «app.javaName».«c.name» <em>«c.name»</em>}' class.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see «app.javaName».«c.name»
	 * @see «app.javaName».impl.«app.name»PackageImpl#get«c.name»()
	 * @generated
	 */
	 int «c.name.toUpperCase»BASE = «metaObjectId=metaObjectId+1»;
	 
	 /**
	 * Returns the meta object for class '{@link «app.javaName».«c.name» <em>«c.name»</em>}'.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the meta object for class '<em>«c.name»</em>'.
	 * @see «app.javaName».«c.name»
	 * @generated
	 */
	 
	 EClass get«c.name»();
	 
	 
	«ENDFOR»			

	/**
	 * Returns the factory that creates the instances of the model.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @return the factory that creates the instances of the model.
	 * @generated
	 */
	 «app.name»Factory get«app.name»Factory();

	/**
	 * <!-- begin-user-doc -->
	 * Defines literals for the meta objects that represent
	 * <ul>
	 *   <li>each class,</li>
	 *   <li>each feature of each class,</li>
	 *   <li>each operation of each class,</li>
	 *   <li>each enum,</li>
	 *   <li>and each data type</li>
	 * </ul>
	 * <!-- end-user-doc -->
	 * @generated
	 */
	interface Literals {
		«FOR Component c : components»
		 /**
		 * The meta object literal for the '{@link «app.name».«c.name» <em>«c.name»</em>}' class.
		 * <!-- begin-user-doc -->
		 * <!-- end-user-doc -->
		 * @generated
		 */
		 EClass «c.name.toUpperCase» = eINSTANCE.get«c.name»();
		«ENDFOR»
		}

	}


'''
}

	
}