package templates.impl

import model.AndroidApplication;
import model.Component;
import org.eclipse.emf.common.util.EList;


class PackageImplTemplate{
	def PackageImplTemplate() {}
	
	def String generate(AndroidApplication app, EList<Component> components) {'''
	
package «app.javaName»;

import org.eclipse.emf.ecore.EAttribute;
import org.eclipse.emf.ecore.EClass;
import org.eclipse.emf.ecore.EOperation;
import org.eclipse.emf.ecore.EPackage;
import org.eclipse.emf.ecore.impl.EPackageImpl;

/**
 * <!-- begin-user-doc -->
 * An implementation of the model <b>Package</b>.
 * <!-- end-user-doc -->
 * @generated
 */
public class «app.name»PackageImpl extends EPackageImpl implements «app.name»Package {
	
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public «app.name»Factory get«app.name»Factory() {
		return («app.name»Factory)getEFactoryInstance();
	}
	
	«FOR Component c:components»
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private EClass «c.name»EClass = null;
	
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	public EClass get«c.name»() {
		return «c.name»EClass;
	}
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
	 * @see barker.BarkerPackage#eNS_URI
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
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private boolean isCreated = false;
	
	/**
	 * <!-- begin-user-doc -->
	 * <!-- end-user-doc -->
	 * @generated
	 */
	private boolean isInitialized = false;
	
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

		// Mark meta-data to indicate it can't be changed
		the«app.name»Package.freeze();

  
		// Update the registry and return the package
		EPackage.Registry.INSTANCE.put(«app.name»Package.eNS_URI, the«app.name»Package);
		return the«app.name»Package;
	}
}

'''
}

	
}