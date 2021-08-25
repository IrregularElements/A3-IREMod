class ace_medical_treatment_actions {
	class BasicBandage;
	class WoundPatching: BasicBandage {
		displayName = CSTRING(actionWoundPatching);
		displayNameProgress = CSTRING(actionWoundPatchingProgress);

        consumeItem = 0;
        items[] = {};

        condition = QFUNC(canPatchWounds);
        treatmentTime = QFUNC(getWoundPatchingTime);
        callbackSuccess = QFUNC(patchWound);

        litter[] = {};
    };
};
