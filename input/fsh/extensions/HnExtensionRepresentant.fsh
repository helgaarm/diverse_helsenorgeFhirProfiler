Extension: HnExtensionRepresentant
Id: hn-extension-representant
Title: "Representant"
Description: "Person som representerer en annen etter avtale, vedtakk mm."
* ^version = "1.3.2"
* ^date = "2025-10-20T21:59:35+00:00"
* ^jurisdiction = urn:iso:std:iso:3166#NO "Norway"
* . ^short = "Representant"
* . ^definition = "Person som representerer en annen etter avtale, vedtakk mm."
* extension contains
    name 0..1 MS and
    ident 1..1 MS
* extension[name].value[x] only NoBasisHumanName
* extension[ident].value[x] 1..
* extension[ident].value[x] only Identifier
* extension[ident].value[x].type.coding 1..1
* extension[ident].value[x].type.coding from CS8116DnrFnrVS (required)
* extension[ident].value[x].type.coding.system 1..
* extension[ident].value[x].type.coding.code 1..
* extension[ident].value[x].value 1..