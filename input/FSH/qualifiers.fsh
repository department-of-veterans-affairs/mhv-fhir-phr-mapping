Instance: VF-VitalsDevice
InstanceOf: ConceptMap
Title:      "Vitals Device used to SNOMED code"
Description: "Map between VitalSignTO.qualifier VUID/string and SNOMED code for Observation.extension[observation-deviceCode].valueCodeableConcept"
Usage: #definition
* url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/ConceptMap/VF-VitalsDevice"
* name =  "VF_VitalsDevice"
* title = "Vitals Device used to SNOMED code"
* experimental = false
* status = #active
* date = 2023-12-15
* publisher = "VA KBS"
* description = "Map between VitalSignTO.qualifier VUID/string and SNOMED code for Observation.extension[observation-deviceCode].valueCodeableConcept"
* group.source = VUID
* group.target  = SCT
* purpose = "VF_VitalsDevice"
* group.element[+].code = #4711289
* group.element[=].display = "ADULT CUFF"
* group.element[=].target.code  =  #133936004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Adult"		
* group.element[+].code = #4711308
* group.element[=].display = "AEROSOL/HUMIDIFIED MASK"
* group.element[=].target.code  =  #426851007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Aerosol oxygen mask"		
* group.element[+].code = #4711310
* group.element[=].display = "AMBU BAG (BAG VALVE MASK)"
* group.element[=].target.code  =  #371785003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Ambu bag"		
* group.element[+].code = #4711311
* group.element[=].display = "ARTERIAL LINE"
* group.element[=].target.code  =  #261241001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Arterial line"		
* group.element[+].code = #4711312
* group.element[=].display = "ASSISTED VENTILATOR"
* group.element[=].target.code  =  #243141005
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Mechanically assisted spontaneous ventilation"		
* group.element[+].code = #4711315
* group.element[=].display = "BED"
* group.element[=].target.code  =  #466289007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Bed scale"		
* group.element[+].code = #4711316
* group.element[=].display = "BIPAP (BI-LEVEL POSITIVE AIRWAY PRESSURE)"
* group.element[=].target.code  =  #243142003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Dual pressure spontaneous ventilation support"		
* group.element[+].code = #4711317
* group.element[=].display = "BIPAP-CPAP (BI-LEVEL POSITIVE AIRWAY PRESSURE-CONTINUOUS POSITIVE AIRWAY PRESSURE)"
* group.element[=].target.code  =  #229306004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Positive pressure therapy"		
* group.element[+].code = #4711318
* group.element[=].display = "CHAIR"
* group.element[=].target.code  =  #467496001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Chair scale, mechanical"		
* group.element[+].code = #4711319
* group.element[=].display = "CONTROLLED VENTILATOR"
* group.element[=].target.code  =  #243147009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Controlled ventilation"		
* group.element[+].code = #4711320
* group.element[=].display = "CPAP (CONTINUOUS POSITIVE AIRWAY PRESSURE)"
* group.element[=].target.code  =  #47545007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Continuous positive airway pressure ventilation treatment"		
* group.element[+].code = #4711321
* group.element[=].display = "CUFF-AUTOMATED (AUTOMATED CUFF)"
* group.element[=].target.code  =  #445949006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Electronic sphygmomanometer"		
* group.element[+].code = #4711322
* group.element[=].display = "CUFF-MANUAL (MANUAL CUFF)"
* group.element[=].target.code  =  #464069000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Mercury manual sphygmomanometer"		
* group.element[+].code = #4711323
* group.element[=].display = "DOPPLER"
* group.element[=].target.code  =  #268447006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Doppler studies"		
* group.element[+].code = #4711324
* group.element[=].display = "FACE TENT"
* group.element[=].target.code  =  #426294006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Face tent oxygen delivery device"		
* group.element[+].code = #4711326
* group.element[=].display = "LARYNGEAL MASK AIRWAY"
* group.element[=].target.code  =  #257268009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Laryngeal mask"		
* group.element[+].code = #4711327
* group.element[=].display = "LEAD"
* group.element[=].target.code  =  #257467001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Electrocardiogram lead"		
* group.element[+].code = #4711290
* group.element[=].display = "LG ADULT CUFF"
* group.element[=].target.code  =  #255509001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Large"		
* group.element[+].code = #4711328
* group.element[=].display = "LIFT SCALE"
* group.element[=].target.code  =  #462242008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Patient sling scale"		
* group.element[+].code = #4711329
* group.element[=].display = "MASK"
* group.element[=].target.code  =  #336602003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Oxygen mask"		
* group.element[+].code = #4711330
* group.element[=].display = "MONITOR"
* group.element[=].target.code  =  #706767009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Patient data recorder"		
* group.element[+].code = #4711331
* group.element[=].display = "MUSTACHE CANNULA"
* group.element[=].target.code  =  #336623009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Oxygen nasal cannula"		
* group.element[+].code = #4711332
* group.element[=].display = "NASAL CANNULA"
* group.element[=].target.code  =  #336623009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Oxygen nasal cannula"		
* group.element[+].code = #4711334
* group.element[=].display = "NON RE-BREATHER"
* group.element[=].target.code  =  #427591007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Nonrebreather oxygen mask"		
* group.element[+].code = #4711338
* group.element[=].display = "PARTIAL RE-BREATHER"
* group.element[=].target.code  =  #425926003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Partial rebreather oxygen mask"		
* group.element[+].code = #4711339
* group.element[=].display = "PEDIATRIC CUFF"
* group.element[=].target.code  =  #67822003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Child"		
* group.element[+].code = #4711340
* group.element[=].display = "PENDANT CANNULA"
* group.element[=].target.code  =  #336623009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Oxygen nasal cannula"		
* group.element[+].code = #4710823
* group.element[=].display = "RESERVOIR CANNULA"
* group.element[=].target.code  =  #336623009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Oxygen nasal cannula"		
* group.element[+].code = #4711359
* group.element[=].display = "SM ADULT CUFF"
* group.element[=].target.code  =  #255507004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Small"		
* group.element[+].code = #4711366
* group.element[=].display = "THIGH CUFF"
* group.element[=].target.code  =  #118712001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Procedure on thigh"		
* group.element[+].code = #4711364
* group.element[=].display = "T-PIECE"
* group.element[=].target.code  =  #6097006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "T-tube, device"		
* group.element[+].code = #4711367
* group.element[=].display = "TRACHEOSTOMY COLLAR"
* group.element[=].target.code  =  #465839001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Tracheostomy mask, oxygen"		
* group.element[+].code = #4710797
* group.element[=].display = "VENTILATOR"
* group.element[=].target.code  =  #40617009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Artificial respiration"		
* group.element[+].code = #4710798
* group.element[=].display = "VENTURI MASK"
* group.element[=].target.code  =  #465433006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Venturi oxygen face mask"		
* group.element[+].code = #4710816
* group.element[=].display = "WHEELCHAIR SCALE"
* group.element[=].target.code  =  #466532009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Wheelchair scale"




Instance: VF-VitalsLaterality
InstanceOf: ConceptMap
Title:      "Vitals Laterality used to SNOMED code"
Description: "Map between VitalSignTO.qualifier VUID/string and SNOMED code for Laterality Observation"
Usage: #definition
* url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/ConceptMap/VF-VitalsLaterality"
* name =  "VF_VitalsLaterality"
* title = "Vitals Laterality used to SNOMED code"
* experimental = false
* status = #active
* date = 2023-12-15
* publisher = "VA KBS"
* description = "Map between VitalSignTO.qualifier VUID/string and SNOMED code for Laterality Observation"
* group.source = VUID
* group.target  = SCT
* purpose = "VF_VitalsLaterality"
* group.element[+].code = #4711355
* group.element[=].display = "LEFT"
* group.element[=].target.code  =  #31156008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left half of body"		
* group.element[+].code = #4711356
* group.element[=].display = "RIGHT"
* group.element[=].target.code  =  #85421007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right half of body"		




Instance: VF-VitalsMethod
InstanceOf: ConceptMap
Title:      "Vitals Method used to SNOMED code"
Description: "Map between VitalSignTO.qualifier VUID/string and SNOMED code for Observation.method"
Usage: #definition
* url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/ConceptMap/VF-VitalsMethod"
* name =  "VF_VitalsMethod"
* title = "Vitals Method used to SNOMED code"
* experimental = false
* status = #active
* date = 2023-12-15
* publisher = "VA KBS"
* description = "Map between VitalSignTO.qualifier VUID/string and SNOMED code for Observation.method"
* group.source = VUID
* group.target  = 	SCT
* purpose = "VF_VitalsMethod"
* group.element[+].code = #4711345
* group.element[=].display = "ACTUAL"
* group.element[=].target.code  =  #258104002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Measured"		
* group.element[+].code = #4711309
* group.element[=].display = "AFTER EXERCISE"
* group.element[=].target.code  =  #255214003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "After exercise"		
* group.element[+].code = #4711313
* group.element[=].display = "AT REST"
* group.element[=].target.code  =  #263678003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "At rest"		
* group.element[+].code = #4711314
* group.element[=].display = "AUSCULTATE"
* group.element[=].target.code  =  #37931006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Auscultation"		
* group.element[+].code = #4712397
* group.element[=].display = "CALCULATED"
* group.element[=].target.code  =  #258090004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Calculated"		
* group.element[+].code = #4711346
* group.element[=].display = "DRY"
* group.element[=].target.code  =  #445541000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Dry body weight"
* group.element[=].target.comment = "OE, not method"
* group.element[+].code = #4711347
* group.element[=].display = "ESTIMATED"
* group.element[=].target.code  =  #414135002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Estimated"		
* group.element[+].code = #4711348
* group.element[=].display = "ESTIMATED BY ARM SPAN"
* group.element[=].target.code  =  #414135002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Estimated"		
* group.element[+].code = #4711325
* group.element[=].display = "INVASIVE"
* group.element[=].target.code  =  #386341005
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Invasive hemodynamic monitoring"		
* group.element[+].code = #4711335
* group.element[=].display = "NON-INVASIVE"
* group.element[=].target.code  =  #704042003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Non-invasive cardiac output monitoring"		
* group.element[+].code = #4711337
* group.element[=].display = "PALPATED"
* group.element[=].target.code  =  #113011001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Palpation"		
* group.element[+].code = #4711353
* group.element[=].display = "ROOM AIR"
* group.element[=].target.code  =  #15158005
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Air"		
* group.element[+].code = #4711360
* group.element[=].display = "SPONTANEOUS"
* group.element[=].target.code  =  #241700002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Spontaneous respiration"		
* group.element[+].code = #4711363
* group.element[=].display = "STATED"
* group.element[=].target.code  =  #418799008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Finding reported by subject or history provider"		
* group.element[+].code = #4711368
* group.element[=].display = "TRANSTRACHEAL"
* group.element[=].target.code  =  #426129001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Transtracheal oxygen catheter"		
* group.element[+].code = #4710817
* group.element[=].display = "WITH ACTIVITY"
* group.element[=].target.code  =  #309604004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "During exercise"		
* group.element[+].code = #4710818
* group.element[=].display = "WITH AMBULATION"
* group.element[=].target.code  =  #129006008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Walking"
* group.element[=].target.display = "OE, not method"
* group.element[+].code = #4710819
* group.element[=].display = "WITH CAST OR BRACE"
* group.element[=].target.code  =  #303474004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Does not remove prosthesis"		
* group.element[+].code = #4710820
* group.element[=].display = "WITH PROSTHESIS"
* group.element[=].target.code  =  #303474004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Does not remove prosthesis"		
* group.element[+].code = #4710821
* group.element[=].display = "WITHOUT PROSTHESIS"
* group.element[=].target.code  =  #303473005
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Does remove prosthesis"			




Instance: VF-VitalsPosition
InstanceOf: ConceptMap
Title:      "Vitals Position used to SNOMED code"
Description: "Map between VitalSignTO.qualifier VUID/string and SNOMED code for Observation.extension[bodyPosition].valueCodeableConcept"
Usage: #definition
* url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/ConceptMap/VF-VitalsPosition"
* name =  "VF_VitalsPosition"
* title = "Vitals Position used to SNOMED code"
* experimental = false
* status = #active
* date = 2023-12-15
* publisher = "VA KBS"
* description = "Map between VitalSignTO.qualifier VUID/string and SNOMED code for Observation.extension[bodyPosition].valueCodeableConcept"
* group.source = VUID
* group.target  = SCT
* purpose = "VF_VitalsPosition"
* group.element[+].code = #5335366
* group.element[=].display = "LEFT LATERAL RECUMBENT"
* group.element[=].target.code  =  #102536004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Left lateral decubitus position"		
* group.element[+].code = #4711343
* group.element[=].display = "LYING"
* group.element[=].target.code  =  #102538003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Recumbent body position"		
* group.element[+].code = #5335362
* group.element[=].display = "PRONE"
* group.element[=].target.code  =  #1240000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Prone body position"		
* group.element[+].code = #5335364
* group.element[=].display = "RIGHT LATERAL RECUMBENT"
* group.element[=].target.code  =  #102535000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Right lateral decubitus position"		
* group.element[+].code = #4711354
* group.element[=].display = "SEMIFOWLERS"
* group.element[=].target.code  =  #426408003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Semi-Fowler's position"		
* group.element[+].code = #4711357
* group.element[=].display = "SITTING"
* group.element[=].target.code  =  #33586001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Sitting position"		
* group.element[+].code = #4711361
* group.element[=].display = "STANDING"
* group.element[=].target.code  =  #10904000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Orthostatic body position"		
* group.element[+].code = #4711362
* group.element[=].display = "STANDING WEIGHT"
* group.element[=].target.code  =  #10904000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Orthostatic body position"		
* group.element[+].code = #4711369
* group.element[=].display = "TRENDELENBURG"
* group.element[=].target.code  =  #34106002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Trendelenburg position"		




Instance: VF-VitalsSite
InstanceOf: ConceptMap
Title:      "Vitals Site used to SNOMED code"
Description: "Map between VitalSignTO.qualifier VUID/string and SNOMED code for Observation.bodySite"
Usage: #definition
* url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/ConceptMap/VF-VitalsSite"
* name =  "VF_VitalsSite"
* title = "Vitals Site used to SNOMED code"
* experimental = false
* status = #active
* date = 2023-12-15
* publisher = "VA KBS"
* description = "Map between VitalSignTO.qualifier VUID/string and SNOMED code for Observation.bodySite"
* group.source = VUID
* group.target  = SCT
* purpose = "VF_VitalsSite"
* group.element[+].code = #4711291
* group.element[=].display = "ABDOMINAL"
* group.element[=].target.code  =  #818983003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Abdomen"		
* group.element[+].code = #4711292
* group.element[=].display = "ANKLE"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #344001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Ankle region structure"		
* group.element[+].code = #4711292
* group.element[=].display = "ANKLE"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #51636004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left ankle"		
* group.element[+].code = #4711292
* group.element[=].display = "ANKLE"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #6685009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right ankle"		
* group.element[+].code = #4711293
* group.element[=].display = "APICAL"
* group.element[=].target.code  =  #46707002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of precordium"		
* group.element[+].code = #4711294
* group.element[=].display = "AV FISTULA (ARTERIOVENOUS FISTULA)"
* group.element[=].target.code  =  #128617001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Arteriovenous fistula"		
* group.element[+].code = #4711295
* group.element[=].display = "AXILLARY"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #422543003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of axillary fossa"		
* group.element[+].code = #4711295
* group.element[=].display = "AXILLARY"
* group.element[=].target[+].display = "Skin structure of left axilla"
* group.element[=].target[=].code  =  #764473004
* group.element[=].target[=].equivalence = #equal
* group.element[=].target[+].display = "Structure of left axillary region"
* group.element[=].target[=].code  =  #20437008
* group.element[=].target[=].equivalence = #equal
* group.element[+].code = #4711295
* group.element[=].display = "AXILLARY"
* group.element[=].target[+].display = "Skin structure of right axilla"
* group.element[=].target[=].code  =  #764474005
* group.element[=].target[=].equivalence = #equal
* group.element[=].target[+].display = "Structure of right axillary region"
* group.element[=].target[=].code  =  #19654004
* group.element[=].target[=].equivalence = #equal
* group.element[+].code = #4711296
* group.element[=].display = "BILATERAL PERIPHERALS"
* group.element[=].target[+].code  =  #54718008
* group.element[=].target[=].equivalence = #equal
* group.element[=].target[=].display = "Peripheral pulse, function"
* group.element[=].target[+].code  =  #14414005
* group.element[=].target[=].equivalence = #equal
* group.element[=].target[=].display = "Peripheral"
* group.element[=].target[+].code  =  #840581000
* group.element[=].target[=].equivalence = #equal
* group.element[=].target[=].display = "Structure of peripheral artery"
* group.element[+].code = #4711297
* group.element[=].display = "BRACHIAL"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #17137000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of brachial artery"		
* group.element[+].code = #4711297
* group.element[=].display = "BRACHIAL"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #723961002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left brachial artery"		
* group.element[+].code = #4711297
* group.element[=].display = "BRACHIAL"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #723962009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right brachial artery"		
* group.element[+].code = #4711298
* group.element[=].display = "CALF"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #53840002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of calf of leg"		
* group.element[+].code = #4711298
* group.element[=].display = "CALF"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #722115008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of calf of left lower leg"		
* group.element[+].code = #4711298
* group.element[=].display = "CALF"
* group.element[=].target.display = "Laterality Right"	
* group.element[=].target.code  =  #722116009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of calf of right lower leg"		
* group.element[+].code = #4711299
* group.element[=].display = "CAROTID"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #69105007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Carotid artery structure"		
* group.element[+].code = #4711299
* group.element[=].display = "CAROTID"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #721028001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left carotid artery"		
* group.element[+].code = #4711299
* group.element[=].display = "CAROTID"
* group.element[=].target.display = "Laterality Right"	
* group.element[=].target.code  =  #721033002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right carotid artery"		
* group.element[+].code = #4711300
* group.element[=].display = "CORE"
* group.element[=].target.code  =  #276885007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Core body temperature"
* group.element[=].target.display  =  "OE, not site"		
* group.element[+].code = #4711301
* group.element[=].display = "DORSALIS PEDIS"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #86547008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of dorsalis pedis artery"		
* group.element[+].code = #4711301
* group.element[=].display = "DORSALIS PEDIS"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #792817008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left dorsalis pedis artery"		
* group.element[+].code = #4711301
* group.element[=].display = "DORSALIS PEDIS"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #792816004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right dorsalis pedis artery"		
* group.element[+].code = #4711302
* group.element[=].display = "FEMORAL"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #7657000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of femoral artery"		
* group.element[+].code = #4711302
* group.element[=].display = "FEMORAL"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #113270003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left femoral artery"		
* group.element[+].code = #4711302
* group.element[=].display = "FEMORAL"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #69833005
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right femoral artery"		
* group.element[+].code = #4711303
* group.element[=].display = "HEAD"
* group.element[=].target.code  =  #69536005
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Head structure"		
* group.element[+].code = #4708118
* group.element[=].display = "HIP"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #29836001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Hip region structure"		
* group.element[+].code = #4708118
* group.element[=].display = "HIP"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #287679003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Left hip region structure"		
* group.element[+].code = #4708118
* group.element[=].display = "HIP"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #287579007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Right hip region structure"		
* group.element[+].code = #4711304
* group.element[=].display = "KNEE"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #72696002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Knee region structure"		
* group.element[+].code = #4711304
* group.element[=].display = "KNEE"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #82169009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left knee region"		
* group.element[+].code = #4711304
* group.element[=].display = "KNEE"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #6757004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right knee region"		
* group.element[+].code = #4711305
* group.element[=].display = "L ARM (LEFT ARM)"
* group.element[=].target.code  =  #80768000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left upper limb"		
* group.element[+].code = #4711306
* group.element[=].display = "L LEG (LEFT LEG)"
* group.element[=].target.code  =  #32153003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left lower limb"		
* group.element[+].code = #4711307
* group.element[=].display = "LOWER ARM"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #14975008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Forearm structure"		
* group.element[+].code = #4711307
* group.element[=].display = "LOWER ARM"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #66480008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left forearm"		
* group.element[+].code = #4711307
* group.element[=].display = "LOWER ARM"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #64262003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right forearm"		
* group.element[+].code = #4711333
* group.element[=].display = "NECK"
* group.element[=].target.code  =  #45048000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Neck structure"		
* group.element[+].code = #4711336
* group.element[=].display = "ORAL"
* group.element[=].target.code  =  #123851003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Mouth region structure"		
* group.element[+].code = #4711341
* group.element[=].display = "PERIPHERAL"
* group.element[=].target.code  =  #54718008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Peripheral pulse, function"
* group.element[=].target.display  =  "OE, not body structure"		
* group.element[+].code = #4711342
* group.element[=].display = "POPLITEAL"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #43899006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of popliteal artery"		
* group.element[+].code = #4711342
* group.element[=].display = "POPLITEAL"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #25885001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Left popliteal artery structure"		
* group.element[+].code = #4711342
* group.element[=].display = "POPLITEAL"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #57832007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right popliteal artery"		
* group.element[+].code = #4711344
* group.element[=].display = "POSTERIOR TIBIAL"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #13363002
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of posterior tibial artery"		
* group.element[+].code = #4711344
* group.element[=].display = "POSTERIOR TIBIAL"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #214912001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left posterior tibial artery"		
* group.element[+].code = #4711344
* group.element[=].display = "POSTERIOR TIBIAL"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #214811007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right posterior tibial artery"		
* group.element[+].code = #4711349
* group.element[=].display = "R ARM (RIGHT ARM)"
* group.element[=].target.code  =  #6921000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right upper limb"		
* group.element[+].code = #4711350
* group.element[=].display = "R LEG (RIGHT LEG)"
* group.element[=].target.code  =  #62175007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right lower limb"		
* group.element[+].code = #4711351
* group.element[=].display = "RADIAL"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #45631007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of radial artery"		
* group.element[+].code = #4711351
* group.element[=].display = "RADIAL"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #368504007
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left radial artery"		
* group.element[+].code = #4711351
* group.element[=].display = "RADIAL"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #368503001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right radial artery"		
* group.element[+].code = #4711352
* group.element[=].display = "RECTAL"
* group.element[=].target.code  =  #34402009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Rectum structure"		
* group.element[+].code = #4711358
* group.element[=].display = "SKIN"
* group.element[=].target.code  =  #39937001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Skin structure"		
* group.element[+].code = #4710824
* group.element[=].display = "TEMPORAL"
* group.element[=].target.code  =  #450721000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of temporal region"
* group.element[=].target.comment  = "Laterality not modeled in SNOMED CT"		
* group.element[+].code = #4711365
* group.element[=].display = "THIGH"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #68367000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Thigh structure"		
* group.element[+].code = #4711365
* group.element[=].display = "THIGH"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #61396006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left thigh"		
* group.element[+].code = #4711365
* group.element[=].display = "THIGH"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #11207009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right thigh"		
* group.element[+].code = #4710794
* group.element[=].display = "TYMPANIC"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #42859004
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Tympanic membrane structure"		
* group.element[+].code = #4710794
* group.element[=].display = "TYMPANIC"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #726562006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left tympanic membrane"		
* group.element[+].code = #4710794
* group.element[=].display = "TYMPANIC"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #726563001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right tympanic membrane"		
* group.element[+].code = #4710795
* group.element[=].display = "ULNAR"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #44984001
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of ulnar artery"		
* group.element[+].code = #4710795
* group.element[=].display = "ULNAR"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #368506009
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left ulnar artery"		
* group.element[+].code = #4710795
* group.element[=].display = "ULNAR"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #368505008
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right ulnar artery"		
* group.element[+].code = #4710796
* group.element[=].display = "UPPER ARM"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #40983000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of upper extremity between shoulder and elbow"		
* group.element[+].code = #4710796
* group.element[=].display = "UPPER ARM"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #368208006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Left upper arm structure"		
* group.element[+].code = #4710796
* group.element[=].display = "UPPER ARM"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #368209003
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Right upper arm structure"		
* group.element[+].code = #4710822
* group.element[=].display = "WRIST"
* group.element[=].target.display = "No laterality"
* group.element[=].target.code  =  #8205005
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Wrist region structure"		
* group.element[+].code = #4710822
* group.element[=].display = "WRIST"
* group.element[=].target.display = "Laterality Left"
* group.element[=].target.code  =  #5951000
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of left wrist region"		
* group.element[+].code = #4710822
* group.element[=].display = "WRIST"
* group.element[=].target.display = "Laterality Right"
* group.element[=].target.code  =  #9736006
* group.element[=].target.equivalence = #equal
* group.element[=].target.display = "Structure of right wrist region"




Instance: VF-VitalsUnits	
InstanceOf: ConceptMap
Title:      "Vitals qualifier Units used"
Description: "Map between VitalSignTO.qualifier VUID/string when a units of measure should be dropped"
Usage: #definition
* url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/ConceptMap/VF-VitalsUnits"
* name =  "VF_VitalsUnits"
* title = "Vitals qualifier Units used"
* experimental = false
* status = #active
* date = 2023-12-15
* publisher = "VA KBS"
* description = "Map between VitalSignTO.qualifier VUID/string when a units of measure should be dropped"
* group.source = VUID
* group.target = UCUM
* purpose = "VF_VitalsUnits"
* group.element[+].code = #4688718
* group.element[=].display = "AUDIOMETRY"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4500634
* group.element[=].display = "BLOOD PRESSURE"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #unknown
* group.element[=].display = "BODY MASS INDEX"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4688719
* group.element[=].display = "CENTRAL VENOUS PRESSURE"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4688720
* group.element[=].display = "CIRCUMFERENCE/GIRTH"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4688721
* group.element[=].display = "FETAL HEART TONES"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4688722
* group.element[=].display = "FUNDAL HEIGHT"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4688723
* group.element[=].display = "HEARING"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4688724
* group.element[=].display = "HEIGHT"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4500635
* group.element[=].display = "PAIN"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4500636
* group.element[=].display = "PULSE"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4500637
* group.element[=].display = "PULSE OXIMETRY"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4688725
* group.element[=].display = "RESPIRATION"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4500638
* group.element[=].display = "TEMPERATURE"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4688726
* group.element[=].display = "TONOMETRY"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4688727
* group.element[=].display = "VISION CORRECTED"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4688728
* group.element[=].display = "VISION UNCORRECTED"
* group.element[=].target.equivalence = #unmatched 
* group.element[+].code = #4500639
* group.element[=].display = "WEIGHT"
* group.element[=].target.equivalence = #unmatched 								
																
																
