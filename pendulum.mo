model pendulum
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute1(phi(fixed = true), useAxisFlange = true, w(fixed = true)) annotation(
    Placement(visible = true, transformation(extent = {{-60, -10}, {-40, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox boxBody2(r = {0.5, 0, 0}, width = 0.06) annotation(
    Placement(visible = true, transformation(extent = {{104, -10}, {124, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Damper damper(d = 0.1) annotation(
    Placement(visible = true, transformation(extent = {{-60, 30}, {-40, 50}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Joints.Revolute revolute2(phi(fixed = true), w(fixed = true)) annotation(
    Placement(visible = true, transformation(extent = {{20, -10}, {40, 10}}, rotation = 0)));
  Modelica.Mechanics.MultiBody.Parts.BodyBox boxBody1(r = {0.5, 0, 0}, width = 0.06) annotation(
    Placement(visible = true, transformation(extent = {{-20, -10}, {0, 10}}, rotation = 0)));
  inner Modelica.Mechanics.MultiBody.World world annotation(
    Placement(visible = true, transformation(extent = {{-160, -10}, {-140, 10}}, rotation = 0)));
equation
  connect(revolute1.support, damper.flange_a) annotation(
    Line(points = {{-56, 10}, {-56, 20}, {-60, 20}, {-60, 40}}));
  connect(damper.flange_b, revolute1.axis) annotation(
    Line(points = {{-40, 40}, {-40, 20}, {-50, 20}, {-50, 10}}));
  connect(world.frame_b, revolute1.frame_a) annotation(
    Line(points = {{-140, 0}, {-60, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(revolute2.frame_b, boxBody2.frame_a) annotation(
    Line(points = {{40, 0}, {104, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(boxBody1.frame_b, revolute2.frame_a) annotation(
    Line(points = {{0, 0}, {20, 0}}, color = {95, 95, 95}, thickness = 0.5));
  connect(revolute1.frame_b, boxBody1.frame_a) annotation(
    Line(points = {{-40, 0}, {-20, 0}}, color = {95, 95, 95}, thickness = 0.5));
  annotation(
    uses(Modelica(version = "3.2.3")));
end pendulum;
