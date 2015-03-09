/**
 */
package model;

import org.eclipse.emf.ecore.EClass;

import templates.ActivityTemplate;
import templates.ComponentTemplate;

/**
 * <!-- begin-user-doc --> A representation of the model object '
 * <em><b>Activity</b></em>'. <!-- end-user-doc -->
 *
 *
 * @generated
 */
public class Activity extends Component {
	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	protected Activity() {
		super();
	}

	/**
	 * <!-- begin-user-doc --> <!-- end-user-doc -->
	 * 
	 * @generated
	 */
	@Override
	protected EClass eStaticClass() {
		return AndroidAppPackage.eINSTANCE.getActivity();
	}

	@Override
	public String getXMLTag() {
		return "activity";
	}

	@Override
	public ComponentTemplate getTemplate() {
		return ActivityTemplate.getInstance();
	}

} // Activity
