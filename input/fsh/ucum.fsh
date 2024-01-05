

Instance:   DrugUcumCodes
InstanceOf: ConceptMap
Title:      "Mapping from Vista used drug units string to formal UCUM codes"
Description: """
Vista units are close but often not exactly correct. This map gives the proper formal UCUM code.

- DrugUcum.csv - 11/08/2021, vhaislstewar, VHAT 325
"""
Usage: #definition
* url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/ConceptMap/DrugUcumCodes"
* name =  "DrugTOucumCodes"
* title = "Mapping from Vista used drug units string to formal UCUM codes"
* experimental = false
* status = #active
* date = 2023-12-15
* publisher = "VA KBS"
* description = """
Vista units are close but often not exactly correct. This map gives the proper formal UCUM code.

- DrugUcum.csv - 11/08/2021, vhaislstewar, VHAT 325
"""
* purpose = "To be able to use proper UCUM code in FHIR"
* group.source = VUID
* group.target = UCUM

* group.element[+].code = #5335551
* group.element[=].display = "%"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #%
* group.element[=].target.display =  "percent"

* group.element[+].code = #5335489
* group.element[=].display = "GM"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #g
* group.element[=].target.display =  "gram"

* group.element[+].code = #5335633
* group.element[=].display = "MCG"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug
* group.element[=].target.display =  "microgram"

* group.element[+].code = #5336101
* group.element[=].display = "MCG/24HR"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/(24.h)
* group.element[=].target.display =  "microgram per 24 hour"

* group.element[+].code = #5336003
* group.element[=].display =  "MCG/HR"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/h
* group.element[=].target.display =  "microgram per hour"

* group.element[+].code = #5335497
* group.element[=].display =  "MCG/ML"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/mL
* group.element[=].target.display =  "microgram per milliliter"

* group.element[+].code = #5335647
* group.element[=].display = "MEQ"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #meq
* group.element[=].target.display =  "milliequivalent"

* group.element[+].code = #5335503
* group.element[=].display =  "MG"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg
* group.element[=].target.display =  "milligram"

* group.element[+].code = #5335869
* group.element[=].display =  "MG/24HRS"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/(24.h)
* group.element[=].target.display =  "milligram per 24 hour"

* group.element[+].code = #5335895
* group.element[=].display =  "MG/DAY"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/d
* group.element[=].target.display =  "milligram per day"

* group.element[+].code = #5335677
* group.element[=].display =  "MG/GM"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/g
* group.element[=].target.display =  "milligram per gram"

* group.element[+].code = #5336057
* group.element[=].display =  "MG/HR"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/h
* group.element[=].target.display =  "milligram per hour"

* group.element[+].code = #5335505
* group.element[=].display =  "MG/ML"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/mL
* group.element[=].target.display =  "milligram per milliliter"


Instance:   LabUcumCodes
InstanceOf: ConceptMap
Title:      "Mapping from Vista used lab units string to formal UCUM codes"
Description: "Vista units are close but often not exactly correct."
Usage: #definition
* url = "https://department-of-veterans-affairs.github.io/mhv-fhir-phr-mapping/ConceptMap/LabUcumCodes"
* name =  "LabTOucumCodes"
* title = "Mapping from Vista used lab units string to formal UCUM codes"
* experimental = false
* status = #active
* date = 2023-12-15
* publisher = "VA KBS"
* description = """
Vista units are close but often not exactly correct. This map gives the proper formal UCUM code.

- LabUcum.csv - 11/08/2021, vhaislstewar, VHAT 325
"""
* purpose = "To be able to use proper UCUM code in the FHIR Observation"
* group.source = VUID
* group.target = UCUM

* group.element[+].code = #5337552
* group.element[=].display  = "\"%\""
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #%
* group.element[=].target.display  = "percent"
* group.element[+].code = #5337698
* group.element[=].display  = "\"/HPF\""
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/[HPF]
* group.element[=].target.display  = "per high power field"
* group.element[+].code = #5337478
* group.element[=].display  = "#"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{#}
* group.element[=].target.display  = "number"
* group.element[+].code = #5337794
* group.element[=].display  = "# K/ul"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337536
* group.element[=].display  = "#/cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{#}/uL
* group.element[=].target.display  = "number per microliter"
* group.element[+].code = #5337546
* group.element[=].display  = "#/HPF"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{#}/[HPF]
* group.element[=].target.display  = "number per high power field"
* group.element[+].code = #5337662
* group.element[=].display  = "#/LPF"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{#}/[LPF]
* group.element[=].target.display  = "number per low power field"
* group.element[+].code = #5337504
* group.element[=].display  = "#x1000/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337400
* group.element[=].display  = "%"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #%
* group.element[=].target.display  = "percent"
* group.element[+].code = #5337712
* group.element[=].display  = "%  AUTO"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #%
* group.element[=].target.display  = "percent"
* group.element[+].code = #5337566
* group.element[=].display  = "%/WBC"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/100{WBCs}
* group.element[=].target.display  = "per 100 white blood cells"
* group.element[+].code = #5337706
* group.element[=].display  = "%VOLUME"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #%{vol}
* group.element[=].target.display  = "percent by volume"
* group.element[+].code = #5337606
* group.element[=].display  = "/100 WBC"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/100{WBCs}
* group.element[=].target.display  = "per 100 white blood cells"
* group.element[+].code = #5337572
* group.element[=].display  = "/100WBC"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/100{WBCs}
* group.element[=].target.display  = "per 100 white blood cells"
* group.element[+].code = #5337608
* group.element[=].display  = "/cumm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/uL
* group.element[=].target.display  = "per microliter"
* group.element[+].code = #5337614
* group.element[=].display  = "/dL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/dL
* group.element[=].target.display  = "per deciliter"
* group.element[+].code = #5337422
* group.element[=].display  = "/HPF"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/[HPF]
* group.element[=].target.display  = "per high power field"
* group.element[+].code = #5337686
* group.element[=].display  = "/HPF."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/[HPF]
* group.element[=].target.display  = "per high power field"
* group.element[+].code = #5337438
* group.element[=].display  = "/LPF"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/[LPF]
* group.element[=].target.display  = "per low power field"
* group.element[+].code = #5337474
* group.element[=].display  = "/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/uL
* group.element[=].target.display  = "per microliter"
* group.element[+].code = #5337726
* group.element[=].display  = "10 3/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337664
* group.element[=].display  = "10(3)/ mcL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337492
* group.element[=].display  = "10(3)/mcL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337666
* group.element[=].display  = "10(6)/mcL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337518
* group.element[=].display  = "10000"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3
* group.element[=].target.display  = "thousand"
* group.element[+].code = #5337738
* group.element[=].display  = "10000000"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6
* group.element[=].target.display  = "million"
* group.element[+].code = #5337444
* group.element[=].display  = "10*3/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337554
* group.element[=].display  = "10*6/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337452
* group.element[=].display  = "10.e3/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337576
* group.element[=].display  = "10.e6/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337544
* group.element[=].display  = "1000/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337632
* group.element[=].display  = "10E12/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*12/L
* group.element[=].target.display  = "trillion per liter"
* group.element[+].code = #5337780
* group.element[=].display  = "10E3/mcL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337482
* group.element[=].display  = "10e3/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337782
* group.element[=].display  = "10E6/mcL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337584
* group.element[=].display  = "10e6/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337476
* group.element[=].display  = "10E9/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*9/L
* group.element[=].target.display  = "billion per liter"
* group.element[+].code = #5337564
* group.element[=].display  = "10x3/cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337640
* group.element[=].display  = "10x3cumm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337800
* group.element[=].display  = "10x6/cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337484
* group.element[=].display  = "BILL/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*9/L
* group.element[=].target.display  = "billion per liter"
* group.element[+].code = #5337736
* group.element[=].display  = "CELLS/HPF"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{cells}/[HPF]
* group.element[=].target.display  = "cells per high power field"
* group.element[+].code = #5337718
* group.element[=].display  = "CELLS/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{cells}/uL
* group.element[=].target.display  = "cells per microliter"
* group.element[+].code = #5337470
* group.element[=].display  = "cmu"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #fL
* group.element[=].target.display  = "femtoliter"
* group.element[+].code = #5337688
* group.element[=].display  = "copies/mL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{copies}/mL
* group.element[=].target.display  = "copies per milliliter"
* group.element[+].code = #5337756
* group.element[=].display  = "cum"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #fL
* group.element[=].target.display  = "femtoliter"
* group.element[+].code = #5337734
* group.element[=].display  = "cumm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #uL
* group.element[=].target.display  = "microliter"
* group.element[+].code = #5337658
* group.element[=].display  = "cuu"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #fL
* group.element[=].target.display  = "femtoliter"
* group.element[+].code = #5337730
* group.element[=].display  = "deg C"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #Cel
* group.element[=].target.display  = "degree Celsius"
* group.element[+].code = #5337788
* group.element[=].display  = "E.U."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{Ehrlich'U}
* group.element[=].target.display  = "Ehrlich unit"
* group.element[+].code = #5337516
* group.element[=].display  = "E.U./dl"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{Ehrlich'U}/dL
* group.element[=].target.display  = "Ehrlich unit per deciliter"
* group.element[+].code = #5337722
* group.element[=].display  = "ERY/MCL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{RBC}/uL
* group.element[=].target.display  = "red blood cell per microliter"
* group.element[+].code = #5337650
* group.element[=].display  = "Ery/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{RBC}/uL
* group.element[=].target.display  = "red blood cell per microliter"
* group.element[+].code = #5337672
* group.element[=].display  = "EU"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{Ehrlich'U}
* group.element[=].target.display  = "Ehrlich unit"
* group.element[+].code = #5337458
* group.element[=].display  = "EU/dl"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{Ehrlich'U}/dL
* group.element[=].target.display  = "Ehrlich unit per deciliter"
* group.element[+].code = #5337720
* group.element[=].display  = "femtoliter"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #fL
* group.element[=].target.display  = "femtoliter"
* group.element[+].code = #5337410
* group.element[=].display  = "fL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #fL
* group.element[=].target.display  = "femtoliter"
* group.element[+].code = #5337404
* group.element[=].display  = "g/dL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #g/dL
* group.element[=].target.display  = "gram per deciliter"
* group.element[+].code = #5337804
* group.element[=].display  = "g/dl."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #g/dL
* group.element[=].target.display  = "gram per deciliter"
* group.element[+].code = #5337480
* group.element[=].display  = "G/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #g/L
* group.element[=].target.display  = "gram per liter"
* group.element[+].code = #5337424
* group.element[=].display  = "gm/dL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #g/dL
* group.element[=].target.display  = "gram per deciliter"
* group.element[+].code = #5337532
* group.element[=].display  = "HPF"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #[HPF]
* group.element[=].target.display  = "high power field"
* group.element[+].code = #5337604
* group.element[=].display  = "Index"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{index}
* group.element[=].target.display  = "index value"
* group.element[+].code = #5337548
* group.element[=].display  = "INR"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{INR}
* group.element[=].target.display  = "international normalized ratio"
* group.element[+].code = #5337622
* group.element[=].display  = "IntUnit/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #[IU]/L
* group.element[=].target.display  = "international unit per liter"
* group.element[+].code = #5337562
* group.element[=].display  = "IntUnits/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #[IU]/L
* group.element[=].target.display  = "international unit per liter"
* group.element[+].code = #5337418
* group.element[=].display  = "IU/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #[IU]/L
* group.element[=].target.display  = "international unit per liter"
* group.element[+].code = #5337498
* group.element[=].display  = "IU/mL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #[IU]/mL
* group.element[=].target.display  = "international unit per milliliter"
* group.element[+].code = #5337750
* group.element[=].display  = "K"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3
* group.element[=].target.display  = "thousand"
* group.element[+].code = #5337740
* group.element[=].display  = "K/ccm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/mL
* group.element[=].target.display  = "thousand per milliliter"
* group.element[+].code = #5337406
* group.element[=].display  = "K/cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337714
* group.element[=].display  = "K/cmm AUTO"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337462
* group.element[=].display  = "K/cu mm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337446
* group.element[=].display  = "K/cumm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337468
* group.element[=].display  = "K/mcL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337682
* group.element[=].display  = "K/mm-3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337434
* group.element[=].display  = "K/mm3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337414
* group.element[=].display  = "K/ul"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337600
* group.element[=].display  = "kU/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #kU/L
* group.element[=].target.display  = "kilo enzyme unit per liter"
* group.element[+].code = #5337696
* group.element[=].display  = "LPF"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #[LPF]
* group.element[=].target.display  = "low power field"
* group.element[+].code = #5337426
* group.element[=].display  = "M/cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337616
* group.element[=].display  = "M/cu mm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337586
* group.element[=].display  = "M/cumm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337644
* group.element[=].display  = "M/mcL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337502
* group.element[=].display  = "M/mm3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337436
* group.element[=].display  = "M/ul"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337710
* group.element[=].display  = "mcg"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug
* group.element[=].target.display  = "microgram"
* group.element[+].code = #5337524
* group.element[=].display  = "mcg/dL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/dL
* group.element[=].target.display  = "microgram per deciliter"
* group.element[+].code = #5337754
* group.element[=].display  = "mcg/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/L
* group.element[=].target.display  = "microgram per liter"
* group.element[+].code = #5337778
* group.element[=].display  = "mcg/mg"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/mg
* group.element[=].target.display  = "microgram per milligram"
* group.element[+].code = #5337764
* group.element[=].display  = "mcg/mg CR"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/mg{creat}
* group.element[=].target.display  = "microgram per milligram of creatinine"
* group.element[+].code = #5337582
* group.element[=].display  = "mcg/ml"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/mL
* group.element[=].target.display  = "microgram per milliliter"
* group.element[+].code = #5337598
* group.element[=].display  = "mcIU/mL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #u[IU]/mL
* group.element[=].target.display  = "micro international unit per milliliter"
* group.element[+].code = #5337786
* group.element[=].display  = "mcmol/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #umol/L
* group.element[=].target.display  = "micromole per liter"
* group.element[+].code = #5337638
* group.element[=].display  = "mcU/mL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #uU/mL
* group.element[=].target.display  = "micro enzyme unit per milliliter"
* group.element[+].code = #5337540
* group.element[=].display  = "mEq./L."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #meq/L
* group.element[=].target.display  = "milliequivalent per liter"
* group.element[+].code = #5337412
* group.element[=].display  = "mEq/l"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #meq/L
* group.element[=].target.display  = "milliequivalent per liter"
* group.element[+].code = #5337790
* group.element[=].display  = "mg/24hr"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/(24.h)
* group.element[=].target.display  = "milligram per 24 hour"
* group.element[+].code = #5337398
* group.element[=].display  = "MG/DL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/dL
* group.element[=].target.display  = "milligram per deciliter"
* group.element[+].code = #5337642
* group.element[=].display  = "mg/dL."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/dL
* group.element[=].target.display  = "milligram per deciliter"
* group.element[+].code = #5337528
* group.element[=].display  = "mg/G"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/g
* group.element[=].target.display  = "milligram per gram"
* group.element[+].code = #5337746
* group.element[=].display  = "mg/g cr"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/g{creat}
* group.element[=].target.display  = "milligram per gram of creatinine"
* group.element[+].code = #5337602
* group.element[=].display  = "mg/g creat"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/g{creat}
* group.element[=].target.display  = "milligram per gram of creatinine"
* group.element[+].code = #5337766
* group.element[=].display  = "mg/gm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/g
* group.element[=].target.display  = "milligram per gram"
* group.element[+].code = #5337488
* group.element[=].display  = "mg/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/L
* group.element[=].target.display  = "milligram per liter"
* group.element[+].code = #5337752
* group.element[=].display  = "mg/ml"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mg/mL
* group.element[=].target.display  = "milligram per milliliter"
* group.element[+].code = #5337526
* group.element[=].display  = "Mil/cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337684
* group.element[=].display  = "MIL/CUMM"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337596
* group.element[=].display  = "Mil/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337700
* group.element[=].display  = "Milion/cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337660
* group.element[=].display  = "mill'n/cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337728
* group.element[=].display  = "mill./mm3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337762
* group.element[=].display  = "mill/cumm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337626
* group.element[=].display  = "million/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337538
* group.element[=].display  = "mIU/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #m[IU]/L
* group.element[=].target.display  = "milli international unit per liter"
* group.element[+].code = #5337508
* group.element[=].display  = "mIU/ml"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #m[IU]/mL
* group.element[=].target.display  = "milli  international unit per milliliter"
* group.element[+].code = #5337648
* group.element[=].display  = "mL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL
* group.element[=].target.display  = "milliliter"
* group.element[+].code = #5337758
* group.element[=].display  = "mL/dL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/dL
* group.element[=].target.display  = "milliliter per deciliter"
* group.element[+].code = #5337428
* group.element[=].display  = "mL/min"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/min
* group.element[=].target.display  = "milliliter per minute"
* group.element[+].code = #5337732
* group.element[=].display  = "mL/min."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/min
* group.element[=].target.display  = "milliliter per minute"
* group.element[+].code = #5337704
* group.element[=].display  = "mL/min/1.7"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/min/{1.73_m2}
* group.element[=].target.display  = "milliliter per minute per 1.73 square meter"
* group.element[+].code = #5337708
* group.element[=].display  = "mL/min/1.73/m2"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/min/{1.73_m2}
* group.element[=].target.display  = "milliliter per minute per 1.73 square meter"
* group.element[+].code = #5337570
* group.element[=].display  = "mL/min/1.73m2"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/min/{1.73_m2}
* group.element[=].target.display  = "milliliter per minute per 1.73 square meter"
* group.element[+].code = #5337808
* group.element[=].display  = "mL/min/BSA"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/min/{1.73_m2}
* group.element[=].target.display  = "milliliter per minute per 1.73 square meter"
* group.element[+].code = #5337612
* group.element[=].display  = "mL/min/m2*"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/min/m2
* group.element[=].target.display  = "milliliter per minute per square meter"
* group.element[+].code = #5337674
* group.element[=].display  = "mL/min/SA"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/min/{1.73_m2}
* group.element[=].target.display  = "milliliter per minute per 1.73 square meter"
* group.element[+].code = #5337568
* group.element[=].display  = "mL/mn/1.73"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/min/{1.73_m2}
* group.element[=].target.display  = "milliliter per minute per 1.73 square meter"
* group.element[+].code = #5337742
* group.element[=].display  = "ml/mn/1.7m"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mL/min/{1.73_m2}
* group.element[=].target.display  = "milliliter per minute per 1.73 square meter"
* group.element[+].code = #5337542
* group.element[=].display  = "mm Hg"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mm[Hg]
* group.element[=].target.display  = "millimeter Mercury column"
* group.element[+].code = #5337680
* group.element[=].display  = "mm/Hg"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mm[Hg]
* group.element[=].target.display  = "millimeter Mercury column"
* group.element[+].code = #5337510
* group.element[=].display  = "MM/HR"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mm/h
* group.element[=].target.display  = "millimeter per hour"
* group.element[+].code = #5337774
* group.element[=].display  = "mm/Hr."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mm/h
* group.element[=].target.display  = "millimeter per hour"
* group.element[+].code = #5337590
* group.element[=].display  = "mM/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mmol/L
* group.element[=].target.display  = "millimole per liter"
* group.element[+].code = #5337466
* group.element[=].display  = "mmHg"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mm[Hg]
* group.element[=].target.display  = "millimeter Mercury column"
* group.element[+].code = #5337402
* group.element[=].display  = "mmol/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mmol/L
* group.element[=].target.display  = "millimole per liter"
* group.element[+].code = #5337592
* group.element[=].display  = "mmole/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mmol/L
* group.element[=].target.display  = "millimole per liter"
* group.element[+].code = #5337496
* group.element[=].display  = "mosm/kg"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mosm/kg
* group.element[=].target.display  = "milliosmole per kilogram"
* group.element[+].code = #5337558
* group.element[=].display  = "mOsm/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #mosm/L
* group.element[=].target.display  = "milliosmole per liter"
* group.element[+].code = #5337744
* group.element[=].display  = "mu/3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #fL
* group.element[=].target.display  = "femtoliter"
* group.element[+].code = #5337490
* group.element[=].display  = "mu3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #fL
* group.element[=].target.display  = "femtoliter"
* group.element[+].code = #5337460
* group.element[=].display  = "ng/dL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ng/dL
* group.element[=].target.display  = "nanogram per deciliter"
* group.element[+].code = #5337416
* group.element[=].display  = "ng/mL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ng/mL
* group.element[=].target.display  = "nanogram per milliliter"
* group.element[+].code = #5337748
* group.element[=].display  = "ng/mL."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ng/mL
* group.element[=].target.display  = "nanogram per milliliter"
* group.element[+].code = #5337694
* group.element[=].display  = "nmol/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #nmol/L
* group.element[=].target.display  = "nanomole per liter"
* group.element[+].code = #5337618
* group.element[=].display  = "per hpf"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/[HPF]
* group.element[=].target.display  = "per high power field"
* group.element[+].code = #5337760
* group.element[=].display  = "per lpf"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #/[LPF]
* group.element[=].target.display  = "per low power field"
* group.element[+].code = #5337520
* group.element[=].display  = "PERCENT"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #%
* group.element[=].target.display  = "percent"
* group.element[+].code = #5337420
* group.element[=].display  = "pg"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #pg
* group.element[=].target.display  = "picogram"
* group.element[+].code = #5337784
* group.element[=].display  = "pg/cell"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #pg/{cell}
* group.element[=].target.display  = "picogram per cell"
* group.element[+].code = #5337442
* group.element[=].display  = "pg/mL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #pg/mL
* group.element[=].target.display  = "picogram per milliliter"
* group.element[+].code = #5337796
* group.element[=].display  = "pg/mL."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #pg/mL
* group.element[=].target.display  = "picogram per milliliter"
* group.element[+].code = #5337610
* group.element[=].display  = "pH"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #[pH]
* group.element[=].target.display  = "pH"
* group.element[+].code = #5337668
* group.element[=].display  = "pH UNIT"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #[pH]
* group.element[=].target.display  = "pH"
* group.element[+].code = #5337578
* group.element[=].display  = "PH units"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #[pH]
* group.element[=].target.display  = "pH"
* group.element[+].code = #5337772
* group.element[=].display  = "pHunits"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #[pH]
* group.element[=].target.display  = "pH"
* group.element[+].code = #5337440
* group.element[=].display  = "Ratio"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{ratio}
* group.element[=].target.display  = "ratio"
* group.element[+].code = #5337430
* group.element[=].display  = "sec"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #s
* group.element[=].target.display  = "second"
* group.element[+].code = #5337486
* group.element[=].display  = "sec."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #s
* group.element[=].target.display  = "second"
* group.element[+].code = #5337454
* group.element[=].display  = "seconds"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #s
* group.element[=].target.display  = "second"
* group.element[+].code = #5337514
* group.element[=].display  = "secs"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #s
* group.element[=].target.display  = "second"
* group.element[+].code = #5337620
* group.element[=].display  = "Secs."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #s
* group.element[=].target.display  = "second"
* group.element[+].code = #5337506
* group.element[=].display  = "t/cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337792
* group.element[=].display  = "T/CUMM"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337634
* group.element[=].display  = "T/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/L
* group.element[=].target.display  = "thousand per liter"
* group.element[+].code = #5337678
* group.element[=].display  = "thou"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3
* group.element[=].target.display  = "thousand"
* group.element[+].code = #5337534
* group.element[=].display  = "THOU/CUMM"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337550
* group.element[=].display  = "thou/ul"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337580
* group.element[=].display  = "Thous./cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337522
* group.element[=].display  = "thous./mm3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337574
* group.element[=].display  = "Thous./ul"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337776
* group.element[=].display  = "THOUS/CMM"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337500
* group.element[=].display  = "thousand"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3
* group.element[=].target.display  = "thousand"
* group.element[+].code = #5337670
* group.element[=].display  = "TITER"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #{titer}
* group.element[=].target.display  = "titer"
* group.element[+].code = #5337802
* group.element[=].display  = "TORR"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #Torr
* group.element[=].target.display  = "Torr"
* group.element[+].code = #5337624
* group.element[=].display  = "TRIL/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*12/L
* group.element[=].target.display  = "trillion per liter"
* group.element[+].code = #5337408
* group.element[=].display  = "U/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #U/L
* group.element[=].target.display  = "enzyme unit per liter"
* group.element[+].code = #5337588
* group.element[=].display  = "u3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #fL
* group.element[=].target.display  = "femtoliter"
* group.element[+].code = #5337464
* group.element[=].display  = "ug/dL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/dL
* group.element[=].target.display  = "microgram per deciliter"
* group.element[+].code = #5337702
* group.element[=].display  = "ug/mg"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/mg
* group.element[=].target.display  = "microgram per milligram"
* group.element[+].code = #5337716
* group.element[=].display  = "ug/mg crea"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/mg{creat}
* group.element[=].target.display  = "microgram per milligram of creatinine"
* group.element[+].code = #5337512
* group.element[=].display  = "ug/mL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #ug/mL
* group.element[=].target.display  = "microgram per milliliter"
* group.element[+].code = #5337432
* group.element[=].display  = "UIU/ML"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #u[IU]/mL
* group.element[=].target.display  = "micro international unit per milliliter"
* group.element[+].code = #5337690
* group.element[=].display  = "uIUnits/mL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #u[IU]/mL
* group.element[=].target.display  = "micro international unit per milliliter"
* group.element[+].code = #5337770
* group.element[=].display  = "uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #uL
* group.element[=].target.display  = "microliter"
* group.element[+].code = #5337798
* group.element[=].display  = "ulU/ml"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #u[IU]/mL
* group.element[=].target.display  = "micro international unit per milliliter"
* group.element[+].code = #5337472
* group.element[=].display  = "um3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #fL
* group.element[=].target.display  = "femtoliter"
* group.element[+].code = #5337646
* group.element[=].display  = "UMOL/L"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #umol/L
* group.element[=].target.display  = "micromole per liter"
* group.element[+].code = #5337594
* group.element[=].display  = "Unit/L."
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #U/L
* group.element[=].target.display  = "enzyme unit per liter"
* group.element[+].code = #5337656
* group.element[=].display  = "uU/ml"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #uU/mL
* group.element[=].target.display  = "micro enzyme unit per milliliter"
* group.element[+].code = #5337450
* group.element[=].display  = "uug"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #pg
* group.element[=].target.display  = "picogram"
* group.element[+].code = #5337560
* group.element[=].display  = "vol%"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #%{vol}
* group.element[=].target.display  = "percent by volume"
* group.element[+].code = #5337494
* group.element[=].display  = "X 10-3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3
* group.element[=].target.display  = "thousand"
* group.element[+].code = #5337724
* group.element[=].display  = "X 10-3/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337628
* group.element[=].display  = "x 1000"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3
* group.element[=].target.display  = "thousand"
* group.element[+].code = #5337806
* group.element[=].display  = "X(10)3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3
* group.element[=].target.display  = "thousand"
* group.element[+].code = #5337692
* group.element[=].display  = "x10 3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3
* group.element[=].target.display  = "thousand"
* group.element[+].code = #5337652
* group.element[=].display  = "X10 3/UL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337768
* group.element[=].display  = "x10 6"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6
* group.element[=].target.display  = "million"
* group.element[+].code = #5337630
* group.element[=].display  = "x10*3/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337530
* group.element[=].display  = "X10-3"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3
* group.element[=].target.display  = "thousand"
* group.element[+].code = #5337448
* group.element[=].display  = "x10-3/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337636
* group.element[=].display  = "X10-6"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6
* group.element[=].target.display  = "million"
* group.element[+].code = #5337556
* group.element[=].display  = "x10-6/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*6/uL
* group.element[=].target.display  = "million per microliter"
* group.element[+].code = #5337676
* group.element[=].display  = "X1000/cmm"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337456
* group.element[=].display  = "x1000/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
* group.element[+].code = #5337654
* group.element[=].display  = "x10E3/uL"
* group.element[=].target.equivalence = #equal
* group.element[=].target.code = #10*3/uL
* group.element[=].target.display  = "thousand per microliter"
