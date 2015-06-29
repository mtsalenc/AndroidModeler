/**
 */
package model;

import org.eclipse.emf.ecore.EClass;

import templates.ComponentTemplate;
import templates.ServiceTemplate;

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

	@Override
	public String getXMLTag() {
		return "service";
	}

	@Override
	public ComponentTemplate getTemplate() {
		return ServiceTemplate.getInstance();
	}

	@Override
	public ComponentTemplate getBaseTemplate() {		
		return null;
	}

} // Service
