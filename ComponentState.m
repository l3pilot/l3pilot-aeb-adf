classdef ComponentState < Simulink.IntEnumType
    enumeration
        Undefined(0),
		Disabled(1),
		Armed(2),
		Acting(3)
    end
end
