classdef Transform
    methods (Static)
        function T = rotX(theta)
            if ~isa(theta, 'sym')
                theta = double(theta);
            end

            T = [1 0 0 0;
                0 cos(theta) -sin(theta) 0;
                0 sin(theta) cos(theta) 0;
                0 0 0 1];
        end

        function T = rotY(theta)
            if ~isa(theta, 'sym')
                theta = double(theta);
            end

            T = [cos(theta) 0 sin(theta) 0;
                0 1 0 0;
                -sin(theta) 0 cos(theta) 0;
                0 0 0 1];
        end

        function T = rotZ(theta)
            if ~isa(theta, 'sym')
                theta = double(theta);
            end

            T = [cos(theta) -sin(theta) 0 0;
                sin(theta) cos(theta) 0 0;
                0 0 1 0;
                0 0 0 1];
        end

        function T = transX(d)
            if ~isa(d, 'sym')
                d = double(d);
            end

            T = [1 0 0 d;
                0 1 0 0;
                0 0 1 0;
                0 0 0 1];
        end

        function T = transY(d)
            if ~isa(d, 'sym')
                d = double(d);
            end

            T = [1 0 0 0;
                0 1 0 d;
                0 0 1 0;
                0 0 0 1];
        end

        function T = transZ(d)
            if ~isa(d, 'sym')
                d = double(d);
            end
            
            T = [1 0 0 0;
                0 1 0 0;
                0 0 1 d;
                0 0 0 1];
        end
    end
end
