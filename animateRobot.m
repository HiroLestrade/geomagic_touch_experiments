function animateRobot(t, q, period, robot)
    link_lengths = zeros(1, robot.dof);
    for i = 1:robot.dof
        link_lengths(i) = str2double(robot.dhParameters(i, 3));
    end

    figure;
    grid on;
    hold on;
    xlabel('x[m]'); ylabel('y[m]'); zlabel('z[m]');
    title('Animación del Robot Manipulador');
    axis equal;

    camproj('orthographic');
    view(30, 30);

    max_range = 1.1 * sum(link_lengths);
    xlim([-max_range, max_range]);
    ylim([-max_range, max_range]);
    zlim([-max_range, max_range]);

    plot3(0, 0, 0, 'ko', 'MarkerSize', 10, 'MarkerFaceColor', 'k');

    h_link = plot3(0, 0, 0, 'b-o', 'LineWidth', 2, 'MarkerFaceColor', 'r');

    for k = 1:length(t)
        q_k = num2cell(q(k, 1:robot.dof));

        X = zeros(1, robot.dof + 1);
        Y = zeros(1, robot.dof + 1);
        Z = zeros(1, robot.dof + 1);

        for i = 1:robot.dof
            p = subs(robot.H{i}(1:3,4), robot.q, q_k);
            X(i+1) = double(p(1));
            Y(i+1) = double(p(2));
            Z(i+1) = double(p(3));
        end

        set(h_link, 'XData', X, 'YData', Y, 'ZData', Z);
        drawnow;
        pause(period);
    end
end
