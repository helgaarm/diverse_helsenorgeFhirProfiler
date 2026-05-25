Extension: HnExtensionFreeSlotPlanningHorizon
Id: hn-extension-free-slot-planningHorizon
Title: "Periode for første og siste ledige slot i timebok"
Description: "Periode for første og siste ledige slot i timebok. Tid og referanse"
Context: Schedule
* ^version = "1.3.2"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* . ^short = "Periode for første og siste ledige slot i timebok"
* . ^definition = "Periode for første og siste ledige slot i timebok. Tid og referanse"
* extension contains
    freePlanningHorizon 0..1 MS and
    firstFreeSlot 0..1 MS and
    lastFreeSlot 0..1 MS
* extension[freePlanningHorizon].value[x] only Period
* extension[freePlanningHorizon].value[x] ^short = "Start tidspunkt for første ledige slot og slutt tidspunkt for siste ledige slot i timebok."
* extension[firstFreeSlot].value[x] only Reference(Slot or HnBasisSlot)
* extension[firstFreeSlot].value[x] ^short = "Referanse til første ledige slot i timebok."
* extension[lastFreeSlot].value[x] only Reference(Slot or HnBasisSlot)
* extension[lastFreeSlot].value[x] ^short = "Referanse til siste ledige slot i timebok."