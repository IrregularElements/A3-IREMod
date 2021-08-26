// Shim "Unconscious" and "CardiacArrest" transitions with an isForcedConscious check
class ACE_Medical_StateMachine {
    class Default;
    class Default {
        class CriticalInjuryOrVitals;
        class CriticalInjuryOrVitals {
			condition = QUOTE(!([_this] call FUNC(isForcedConscious)));
        };
		class FatalVitals;
		class FatalVitals {
            condition = QUOTE(!([_this] call FUNC(isForcedConscious)));
		};
    };

    class Injured;
    class Injured {
        class CriticalInjuryOrVitals;
        class CriticalInjuryOrVitals {
			condition = QUOTE(!([_this] call FUNC(isForcedConscious)));
        };
		class FatalVitals;
		class FatalVitals {
			condition = QUOTE(!([_this] call FUNC(isForcedConscious)));
		};
    };

	class Unconscious;
	class Unconscious {
		class FatalTransitions;
		class FatalTransitions {
			condition = QUOTE(!([_this] call FUNC(isForcedConscious)));
		};
	};
};
