/**
 */
package model;

import org.eclipse.emf.ecore.EClass;

import templates.ComponentTemplate;
import templates.ServiceTemplate;
import templates.impl.GCMIntentServiceBaseImplTemplate;
import templates.impl.ServiceImplTemplate;

/**
 * <!-- begin-user-doc --> A representation of the model object '
 * <em><b>Service</b></em>'. <!-- end-user-doc -->
 *
 *
 * @generated
 */
public class Service extends Component {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	protected Service() {
		super();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return AndroidAppPackage.eINSTANCE.getService();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public String getXMLTag() {
		return "service";
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public ComponentTemplate getTemplate() {
		return ServiceTemplate.getInstance();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public ComponentTemplate getBaseTemplate() {		
		return null;
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public ComponentTemplate getImplTemplate() {		
		return ServiceImplTemplate.getInstance() ;
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	public ComponentTemplate getBaseImplTemplate() {		
		return GCMIntentServiceBaseImplTemplate.getInstance();
	}

} // Service
