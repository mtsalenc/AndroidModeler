package templates

import model.AndroidApplication

/**
 * <!-- begin-user-doc -->
 * <!-- end-user-doc -->
 * @model interface="true" abstract = "true"
 * @generated
 */
interface ApplicationTemplate {
	def String generate(AndroidApplication app);
}
