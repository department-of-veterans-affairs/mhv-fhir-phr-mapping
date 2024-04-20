
REM Validator documentation https://confluence.hl7.org/display/FHIR/Using+the+FHIR+Validator

REM download the validator, only needed once.
REM POWERSHELL -command Invoke-WebRequest -Uri https://github.com/hapifhir/org.hl7.fhir.core/releases/latest/download/validator_cli.jar -Outfile validator_cli.jar

REM validate the file given as parameter 1 sending output to validation.html
java -jar validator_cli.jar %1 -version 4.0 -ig https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/package.r4.tgz -html-output validation.html

