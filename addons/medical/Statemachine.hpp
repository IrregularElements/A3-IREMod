// Shim "Unconscious" and "CardiacArrest" transitions with an isForcedConscious check
class ACE_Medical_StateMachine {
	class Default {
		class CriticalInjuryOrVitals {
			condition = QUOTE(!([_this] call FUNC(isForcedConscious)));
		};
		class FatalVitals {
			condition = QUOTE(!([_this] call FUNC(isForcedConscious)));
		};
	};

	class Injured {
		class CriticalInjuryOrVitals {
			condition = QUOTE(!([_this] call FUNC(isForcedConscious)));
		};
		class FatalVitals {
			condition = QUOTE(!([_this] call FUNC(isForcedConscious)));
		};
	};

	class Unconscious {
		class FatalTransitions {
			condition = QUOTE(!([_this] call FUNC(isForcedConscious)));
		};
	};
};
