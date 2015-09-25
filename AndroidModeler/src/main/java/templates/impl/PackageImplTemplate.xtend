package templates.impl

import java.lang.reflect.Field
import java.lang.reflect.Method
import java.lang.reflect.Modifier
import java.util.List
import model.AndroidApplication
import model.Component
import org.eclipse.emf.common.util.EList

class PackageImplTemplate {
	def PackageImplTemplate() {}

	def String generate(AndroidApplication app, EList<Component> components, List<Class<?>> classList) {
		'''
	
package «app.javaName».impl;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EOperation;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.impl.EPackageImpl;

import «app.javaName».«app.name»Package;
import «app.javaName».«app.name»Factory;
«FOR Class<?> aClass : classList»
«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length)»
import «app.javaName».«classname»;
«ENDFOR»

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Package</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class «app.name»PackageImpl extends EPackageImpl implements «app.name»Package {	
	«FOR Class<?> aClass : classList»
	«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length)»
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass «classname.toFirstLower»EClass = null;	
	«ENDFOR»
	
	/**
	 * Creates an instance of the model <b>Package</b>, registered with
	 * {@link org.eclipse.emf.ecore.EPackage.Registry EPackage.Registry} by the package
	 * package URI value.
	 * <p>Note: the correct way to create the package is via the static
	 * factory method {@link #init init()}, which also performs
	 * initialization of the package, or returns the registered package,
	 * if one already exists.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see org.eclipse.emf.ecore.EPackage.Registry
	 * @see «app.name.toLowerCase».«app.name»Package#eNS_URI
	 * @see #init()
	 * @generated
	 */
	private «app.name»PackageImpl() {
		super(eNS_URI, «app.name»Factory.eINSTANCE);
	}
	
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private static boolean isInited = false;
	
	/**
	 * Creates, registers, and initializes the <b>Package</b> for this model, and for any others upon which it depends.
	 * 
	 * <p>This method is used to initialize {@link BarkerPackage#eINSTANCE} when that field is accessed.
	 * Clients should not invoke it directly. Instead, they should simply access that field to obtain the package.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @see #eNS_URI
	 * @see #createPackageContents()
	 * @see #initializePackageContents()
	 * @generated
	 */
	public static «app.name»Package init() {
		if (isInited) return («app.name»Package)EPackage.Registry.INSTANCE.getEPackage(«app.name»Package.eNS_URI);

		// Obtain or create and register package
		«app.name»PackageImpl the«app.name»Package = («app.name»PackageImpl)(EPackage.Registry.INSTANCE.get(eNS_URI) instanceof «app.name»PackageImpl ? EPackage.Registry.INSTANCE.get(eNS_URI) : new «app.name»PackageImpl());

		isInited = true;
		
		// Create package meta-data objects
		the«app.name»Package.createPackageContents();

		// Initialize created meta-data
		the«app.name»Package.initializePackageContents();

		// Mark meta-data to indicate it can't be changed
		the«app.name»Package.freeze();

  
		// Update the registry and return the package
		EPackage.Registry.INSTANCE.put(«app.name»Package.eNS_URI, the«app.name»Package);
		return the«app.name»Package;
	}
	
	«FOR Class<?> aClass : classList»	
	«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length)»
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass get«classname»() {
		return «classname.toFirstLower»EClass;
	}	
	
	 «FOR Field f: aClass.fields»
	 /**
	* <!-- begin-user-doc -->
	* <!-- end-user-doc -->
	* @generated
	*/
	public EAttribute get«aClass.name»_«f.name»() {
		return (EAttribute)«aClass.name»EClass.getEStructuralFeatures().get(0);
	}
	 
	 «ENDFOR»
	 
	 «FOR Method m: aClass.methods»	
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EOperation get«aClass.name»__«m.name»() {
		return «aClass.name»EClass.getEOperations().get(0);
	}
	 «ENDFOR»	
	«ENDFOR»
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public «app.name»Factory get«app.name»Factory() {
		return («app.name»Factory)getEFactoryInstance();
	}
	
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private boolean isCreated = false;
	
	/**
	 * Creates the meta-model objects for the package.  This method is
	 * guarded to have no affect on any invocation but its first.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void createPackageContents() {
		if (isCreated) return;
		isCreated = true;
		// Create classes and their features
	«FOR Class<?> aClass : classList»
	«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length)»
		«classname.toFirstLower»EClass = createEClass(«classname.toUpperCase»);
		«FOR Field f: aClass.fields»
		createEAttribute(«aClass.name»EClass, «classname.toUpperCase»__«f.name.toUpperCase»);
		«ENDFOR»
	 	«FOR Method m: aClass.methods»
		createEOperation(«aClass.name»EClass, «classname.toUpperCase»___«m.name.toUpperCase»);
	 	«ENDFOR»	
	«ENDFOR»
	}
	
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private boolean isInitialized = false;	
	
	/**
	 * Complete the initialization of the package and its meta-model.  This
	 * method is guarded to have no affect on any invocation but its first.
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public void initializePackageContents() {
		if (isInitialized) return;
		isInitialized = true;

		// Initialize package
		setName(eNAME);
		setNsPrefix(eNS_PREFIX);
		setNsURI(eNS_URI);

		// Create type parameters

		// Set bounds for type parameters

		// Add supertypes to classes
		«FOR Class<?> aClass : classList»
		«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length)»
		«classname.toFirstLower»EClass.getESuperTypes().add(this.get«classname»());	
	 	«ENDFOR»	
	 	
	 	// Initialize classes, features, and operations; add parameters
	 	«FOR Class<?> aClass : classList»
	 	«val classname = aClass.name.substring(aClass.name.lastIndexOf(".")+1,aClass.name.length)»
	 	«var isAbastract = ""»
	 	«var isInterface = ""»
	 	
	 	«IF Modifier.isAbstract(aClass.modifiers) == false»
	 		«isAbastract = "!"»
	 	«ENDIF»
	 	«IF Modifier.isInterface(aClass.modifiers) == false»
	 		«isInterface = "!"»
	 	«ENDIF»	 	
	 	initEClass(«classname.toFirstLower»EClass, «classname».class, "«classname»", «isAbastract»IS_ABSTRACT, «isInterface»IS_INTERFACE, IS_GENERATED_INSTANCE_CLASS);
	 	«FOR Field f: aClass.fields»
	 	«var isTransient = ""»
	 	«IF Modifier.isTransient(aClass.modifiers) == false»
	 		«isTransient = "!"»
	 	«ENDIF»	 
	 	
	 	«var isVolatile = ""»
	 	«IF Modifier.isVolatile(aClass.modifiers) == false»
	 		«isVolatile = "!"»
	 	«ENDIF»
	 	
	 	initEAttribute(get«aClass.name»_«f.name»(), ecorePackage.getE«f.type.name»(), "«f.name»", null, 0, 1, «aClass.name».class, «isTransient»IS_TRANSIENT, «isVolatile»IS_VOLATILE, IS_CHANGEABLE, !IS_UNSETTABLE, !IS_ID, IS_UNIQUE, !IS_DERIVED, IS_ORDERED);
	 	«ENDFOR»	 	
	 	«FOR Method m: aClass.methods»
	 	initEOperation(get«aClass.name»__«m.name»(), null, "«m.name.toLowerCase»", 0, 1, IS_UNIQUE, IS_ORDERED);
	 	«ENDFOR»	 		
	 	«ENDFOR»

		// Create resource
		createResource(eNS_URI);
	}
}

'''
	}

	def String capitalize(String str) {
		val words = str.split(" ");
		val ret = new StringBuilder();
		for (var i = 0; i < words.length; i++) {
			ret.append(Character.toUpperCase(words.get(i).charAt(0)));
			ret.append(words.get(i).substring(1))
			if (i < words.length - 1) {
				ret.append(' ');
			}
		}
		ret.toString
	}
}

