Profile:      SOREndpoint
Parent:       MCSDEndpoint
Id:           medcom.sor.Endpoint
Title:        "MedCom SOR Endpoint"
Description:  """
A profile on the mCSD Endpoint.

An Organization may be reachable through electronic Endpoint(s).
An Endpoint may be a FHIR server, an IHE web services actor, or some other
mechanism. If an Organization does not have an Endpoint, it may still be
reachable via an Endpoint at its parent Organization or an affiliated Organization.

Given that in FHIR R4 the .connnectionType is 1..1, each type of endpoint will be indicated with an independent Endpoint resource.
"""