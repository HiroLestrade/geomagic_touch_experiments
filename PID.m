classdef PID
    properties
        Kp
        Ki
        Kd
        T
        integral
        prevError
    end

    methods
        function obj = PID(Kp, Ki, Kd, T)
            obj.Kp = Kp;
            obj.Ki = Ki;
            obj.Kd = Kd;
            obj.T = T;
            obj.integral = zeros(3,1);
            obj.prevError = zeros(3,1);
        end

        function [u, obj] = compute(obj, x, xf)
            e = xf(1:3) - x(1:3);
            de = (e - obj.prevError) / obj.T;
            obj.integral = obj.integral + e * obj.T;
            u = obj.Kp .* e + obj.Ki .* obj.integral + obj.Kd .* de;
            obj.prevError = e;
        end
    end
end