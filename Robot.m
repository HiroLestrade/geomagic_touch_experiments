classdef Robot
    properties
        dof           %Degrees of freedom
        q             %Simbolic vector of articulation variables
        dhParameters  %Denavit-Hartenberg parameters [q d a alpha]
        H             %Transformation matrices for each joint referred to the 0 axis
    end

    methods
        function obj = Robot(dof, dhParameters)
            if nargin > 0
                obj.dof = dof;
                obj.q = sym('q', [1, dof], 'real');
                obj.dhParameters = dhParameters;
                
                obj.H = cell(1, obj.dof);
                for i = 1:obj.dof
                    if i == 1
                        obj.H{i} = vpa(simplify(Transform.rotZ(obj.q(i))*Transform.transX(dhParameters(i,2))*Transform.transX(dhParameters(i,3))*Transform.rotX(dhParameters(i,4))),2);
                    
                    else
                        obj.H{i} = vpa( ...
                                    simplify( ...
                                        obj.H{i - 1} * ...
                                        Transform.rotZ(obj.q(i))*Transform.transX(dhParameters(i,2))*Transform.transX(dhParameters(i,3))*Transform.rotX(dhParameters(i,4)) ...
                                    ) ...
                                   ,2);
                    end
                end
            end
        end



    end
end