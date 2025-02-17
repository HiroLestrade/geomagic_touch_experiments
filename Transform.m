classdef Transform
    methods (Static)
        function T = rotX(theta)
            T = [1 0 0 0;
                0 cos(theta) -sin(theta) 0;
                0 sin(theta) cos(theta) 0;
                0 0 0 1];
        end

        function T = rotY(theta)
            T = [cos(theta) 0 sin(theta) 0;
                0 1 0 0;
                -sin(theta) 0 cos(theta) 0;
                0 0 0 1];
        end

        function T = rotZ(theta)
            T = [cos(theta) -sin(theta) 0 0;
                sin(theta) cos(theta) 0 0;
                0 0 1 0;
                0 0 0 1];
        end

        function T = transX(d)
            T = [1 0 0 d;
                0 1 0 0;
                0 0 1 0;
                0 0 0 1];
        end

        function T = transY(d)
            T = [1 0 0 0;
                0 1 0 d;
                0 0 1 0;
                0 0 0 1];
        end

        function T = transZ(d)
            T = [1 0 0 0;
                0 1 0 0;
                0 0 1 d;
                0 0 0 1];
        end
    end
end
