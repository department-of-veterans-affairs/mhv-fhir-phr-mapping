
Overall test plan should leverage the Profiles, and Examples shown on the [Artifacts Summary](artifacts.html). The [Profiles](artifacts.html#structures-resource-profiles) listed are describing the constraints that MHV uses when publishing from the PHR. Thus any Resources that are known to have been published by MHV MUST be conformant to these profiles. The [published package](package.r4.tgz) can be loaded into a test [HAPI server to automatically check conformance](https://hapifhir.io/hapi-fhir/docs/validation/instance_validator.html) on all create/update requests.

All FHIR Resources created/updated should include the profile intended in the `.meta.profile`.

The Examples listed in [Example Instances](artifacts.html#example-example-instances) are example instances that are conformant to the MHV profiles.

One might use a tool like [Synthea](https://synthea.mitre.org/) to generate data. There is a [Flexporter](https://github.com/synthetichealth/synthea/wiki/Flexporter) available to customize the generated FHIR resources. Unclear how helpful these would be.

See the Test Plan for each Profile to understand the specific expectations for each good, odd, and bad example.

#### Cucumber Actions

The following Actions are defined for use in the Cucumber scripts

SUT - System Under Test -- this is the MyHealtheVet application -- aka MHV

PHR - this is the FHIR Server that MyHealtheVet uses 

Test-Patient - a FHIR Patient resource within the PHR that is used for testing purposes and is tied to a test login to MHV

Test-Bench - a FHIR application (likely built with HAPI) that is used with PHR for testing of the MHV

##### Initialized

**Preconditions**

PHR is operational and has no known defects that would affect the test.

Test-Patient is created or known to have no data that would affect the test.

##### Load X into PHR

This action is used to initialize a test, it is not expected to fail. So a failure is a fundamental failure, not an indication of the system-under-test.

GIVEN FHIR Resource X from this Implementation Guide

ACTION:

1. load X into Test-Bench
1. update the patient to the Test-Patient id under test
1. update the effectiveDateTime to **now**
1. POST the resource into PHR
1. continue if successful, if error then break out of test plan

