Arma 3 - IRE Mod: Feature documentation
=======================================

All of the addon PBOs implicitly depend on `ire_mod_main` and CBA.

---

`ire_mod_ai`: AI tweaks
-----------------------
(Depends on: `ace_cargo`)

### Cargo unload actions
**CBA settings**:
- `ire_mod_ai_cargoUnloadActionsEnabled` (Global, boolean)

Adds actions (that appear in the "action command" category at key 6) to all
commanded AI units to unload specific ACE cargo items from nearby vehicles.

---

`ire_mod_medical`: ACE medical tweaks
-------------------------------------
(Depends on: `ace_medical`, `ace_medical_engine`, `ace_medical_treatment`,
 `ace_medical_status`, `ace_medical_vitals`, `ace_medical_statemachine`)

### Treatment hints
**CBA settings**:
- `ire_mod_medical_treatmentHintsEnabled` (Global, boolean)

**Other variables**:
- `ire_mod_medical_allowTreatmentSelfHints` (boolean, default: `false`)

Whenever someone is treating you, show a text hint below the medical menu.
If your player unit is unconscious, the hint will not be detailed.  To include
self treatment actions in hints, set `allowTreatmentSelfHints` to true.

### Wound patching
**CBA settings**:
- `ire_mod_medical_woundPatchingEnabled` (Global, boolean)
- `ire_mod_medical_woundPatchingTimeMultiplier` (Global, number)

Enables wound patching, which works like a bandage, but slower by the factor of
`woundPatchingTimeMultiplier`.  Only available when no bandages are usable.

### Epinephrine bonus
**CBA settings**:
- `ire_mod_medical_epiBonusEnabled` (Global, boolean)
- `ire_mod_medical_epiBonusDuration` (Global, time in seconds)
- `ire_mod_medical_epiBonusCooldown` (Global, time in seconds)

Enables epinephrine bonus, which will force a unit treated with epinephrine to
temporarily wake up and stop limping.  The cooldown setting is counted between
epinephrine injections (not between epinephrine bonus ending and another
injection).

---

`ire_mod_ui`: GUI tweaks
------------------------
(Depends on: `ace_common`)

### Show terrain name in map
**CBA settings**:
- `ire_mod_ui_showTerrainNameInMap` (Client only, boolean)

Shows the human-readable world (terrain) name in the map display on the top
panel.

### Clean up diary records
**CBA settings**:
- `ire_mod_ui_cleanupDiaryRecords` (Client only, boolean)

Removes CBA and Task Force Radio diary entries from the map display.
