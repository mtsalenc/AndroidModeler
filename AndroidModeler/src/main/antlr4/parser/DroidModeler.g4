grammar DroidModeler;

appDefinition
:
	'app' name = ID
	(
		'minSDK=' minSDK = NUMBER
	)?
	(
		'targetSDK=' targetSDK = NUMBER
	)? LBRACE packageDefinition
	(
		componentDefinition
		| featureDefinition
	)+ RBRACE
;

packageDefinition
:
	'pkg' name = ID
;

componentDefinition
:
	(
		activityDefinition
		| serviceDefinition
		| broadcastReceiverDefinition
	)+
;

activityDefinition
:
	'activity' name = ID
;

serviceDefinition
:
	'service' name = ID
;

broadcastReceiverDefinition
:
	'bcreceiver' name = ID
;

featureDefinition
:
	gcmFeatureDefinition
;

gcmFeatureDefinition
:
	'gcm' LBRACE
	(
		activityDefinition
		| serviceDefinition
		| broadcastReceiverDefinition
	)+ RBRACE
;

ID
:
	[.a-zA-Z]+
;

NUMBER
:
	[1-9] [0-9]*
;

LBRACE
:
	'{'
;

RBRACE
:
	'}'
;

WS
:
	[ \t\r\n]+ -> skip
;  