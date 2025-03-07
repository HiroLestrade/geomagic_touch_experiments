function animarRobot3DOF3D(t, q, robot) 
    L1 = str2double(robot.dhParameters(1,3)); 
    L2 = str2double(robot.dhParameters(2,3)); 
    L3 = str2double(robot.dhParameters(3,3));
    
    figure;
    grid on;
    hold on;
    xlabel('X (m)'); ylabel('Y (m)'); zlabel('Z (m)');
    title('Animación del Robot Manipulador 3DOF en 3D');
    axis equal;

    camproj('orthographic'); 
    view(30, 30);            
    
    max_range = L1 + L2 + L3 + 0.2;
    xlim([-max_range, max_range]);
    ylim([-max_range, max_range]);
    zlim([-max_range, max_range]);
    
    plot3(0, 0, 0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');

    h_link = plot3(0, 0, 0, 'b-o', 'LineWidth', 2, 'MarkerFaceColor', 'r');
    
    for k = 1:length(t)
        q1 = q(k,1);
        q2 = q(k,2);
        q3 = q(k,3);
        
        p_0 = subs(robot.H{1}(1:3,4), {robot.q(1), robot.q(2), robot.q(3),}, {q1, q2 q3});

        p_1 = subs(robot.H{2}(1:3,4), {robot.q(1), robot.q(2), robot.q(3),}, {q1, q2 q3});

        p_2 = subs(robot.H{3}(1:3,4), {robot.q(1), robot.q(2), robot.q(3),}, {q1, q2 q3});
        
        X = [0, p_0(1), p_1(1), p_2(1)];
        Y = [0, p_0(2), p_1(2), p_2(2)];
        Z = [0, p_0(3), p_1(3), p_2(3)];
        
        set(h_link, 'XData', X, 'YData', Y, 'ZData', Z);
        drawnow;
        pause(0.001);
    end
end
