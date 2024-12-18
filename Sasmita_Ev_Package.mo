package Sasmita_Ev_Package
  model Sortev_Cycle
    Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 1.5) annotation(
      Placement(visible = true, transformation(extent = {{-122, 12}, {-102, 32}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.IdealRollingWheel wheel(radius = 0.31) annotation(
      Placement(visible = true, transformation(extent = {{0, 12}, {20, 32}}, rotation = 0)));
    Modelica.Mechanics.Rotational.Components.IdealGear gear(ratio = 4) annotation(
      Placement(visible = true, transformation(origin = {-40, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    wbEHPTlib.SupportModels.Miscellaneous.DragForce dragF(Cx = 0.26, S = 2.2, fc = 0.014, m = mass.m, rho(displayUnit = "kg/m3") = 1.226) annotation(
      Placement(visible = true, transformation(origin = {170, -46}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
    Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
      Placement(visible = true, transformation(extent = {{-164, 10}, {-144, 30}}, rotation = 0)));
    Modelica.Mechanics.Translational.Sensors.SpeedSensor velSens annotation(
      Placement(visible = true, transformation(origin = {118, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
    wbEHPTlib.SupportModels.Miscellaneous.PropDriver driver(CycleFileName = "NEDC.txt", extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, k = 1000, yMax = 100000.0) annotation(
      Placement(visible = true, transformation(extent = {{-264, 12}, {-244, 32}}, rotation = 0)));
    Modelica.Mechanics.Translational.Components.Mass mass(m = 1300) annotation(
      Placement(visible = true, transformation(extent = {{90, 18}, {110, 38}}, rotation = 0)));
  equation
  connect(mass.flange_a, wheel.flangeT) annotation(
      Line(points = {{90, 28}, {31, 28}, {31, 22}, {20, 22}}, color = {0, 127, 0}));
  connect(mass.flange_b, dragF.flange) annotation(
      Line(points = {{110, 28}, {170, 28}, {170, -36}}, color = {0, 127, 0}));
  connect(inertia.flange_a, torque.flange) annotation(
      Line(points = {{-122, 22}, {-141, 22}, {-141, 20}, {-144, 20}}));
  connect(driver.V, velSens.v) annotation(
      Line(points = {{-254, 11}, {-254, -36}, {118, -36}, {118, -51}}, color = {0, 0, 127}));
  connect(velSens.flange, mass.flange_b) annotation(
      Line(points = {{118, -30}, {118, 28}, {110, 28}}, color = {0, 127, 0}));
  connect(gear.flange_b, wheel.flangeR) annotation(
      Line(points = {{-30, 22}, {0, 22}}));
  connect(torque.tau, driver.tauRef) annotation(
      Line(points = {{-166, 20}, {-163.5, 20}, {-163.5, 22}, {-243, 22}}, color = {0, 0, 127}));
  connect(inertia.flange_b, gear.flange_a) annotation(
      Line(points = {{-102, 22}, {-50, 22}}));
    annotation(
      Diagram(graphics = {Text(origin = {-6, 0}, lineColor = {28, 108, 200}, extent = {{-82, 2}, {-26, -4}}, textString = "electric drive"), Rectangle(origin = {-26, -29}, lineColor = {28, 108, 200}, pattern = LinePattern.Dash, extent = {{-163, 76}, {-47, 8}})}));
  end Sortev_Cycle;

  model SortPower_Cycle
  Modelica.Mechanics.Rotational.Components.IdealGear gear(ratio = 4) annotation(
      Placement(visible = true, transformation(origin = {-36, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  wbEHPTlib.SupportModels.Miscellaneous.DragForce dragF(Cx = 0.26, S = 2.2, fc = 0.014, m = mass.m, rho(displayUnit = "kg/m3") = 1.226) annotation(
      Placement(visible = true, transformation(origin = {172, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor velSens annotation(
      Placement(visible = true, transformation(origin = {78, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel wheel(radius = 0.31) annotation(
      Placement(visible = true, transformation(extent = {{-4, 12}, {16, 32}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PowerSensor pP2 annotation(
      Placement(visible = true, transformation(origin = {172, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
      Placement(visible = true, transformation(extent = {{-168, 8}, {-148, 28}}, rotation = 0)));
  wbEHPTlib.SupportModels.Miscellaneous.PropDriver driver(CycleFileName = "C:\Users\HP\Downloads\Sort1.txt", extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, k = 1000, yMax = 100000.0) annotation(
      Placement(visible = true, transformation(extent = {{-258, 10}, {-238, 30}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.PowerSensor pP1 annotation(
      Placement(visible = true, transformation(extent = {{36, 12}, {52, 28}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 1.5) annotation(
      Placement(visible = true, transformation(extent = {{-112, 6}, {-92, 26}}, rotation = 0)));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 1300) annotation(
      Placement(visible = true, transformation(extent = {{54, 10}, {74, 30}}, rotation = 0)));
  equation
    connect(velSens.flange, mass.flange_b) annotation(
      Line(points = {{78, 4.44089e-16}, {78, 20}, {74, 20}}, color = {0, 127, 0}));
  connect(wheel.flangeT, pP1.flange_a) annotation(
      Line(points = {{16, 22}, {21, 22}, {21, 20}, {36, 20}}, color = {0, 127, 0}));
  connect(torque.tau, driver.tauRef) annotation(
      Line(points = {{-170, 18}, {-203.5, 18}, {-203.5, 20}, {-237, 20}}, color = {0, 0, 127}));
  connect(pP2.flange_b, dragF.flange) annotation(
      Line(points = {{172, 0}, {172, -22}}, color = {0, 127, 0}));
  connect(pP2.flange_a, mass.flange_b) annotation(
      Line(points = {{172, 20}, {74, 20}}, color = {0, 127, 0}));
  connect(inertia.flange_b, gear.flange_a) annotation(
      Line(points = {{-92, 16}, {-55, 16}, {-55, 20}, {-46, 20}}));
    connect(mass.flange_a, pP1.flange_b) annotation(
      Line(points = {{54, 20}, {54, 20}, {52, 20}}, color = {0, 127, 0}));
  connect(inertia.flange_a, torque.flange) annotation(
      Line(points = {{-112, 16}, {-130, 16}, {-130, 18}, {-148, 18}}));
  connect(gear.flange_b, wheel.flangeR) annotation(
      Line(points = {{-26, 20}, {-20, 20}, {-20, 22}, {-4, 22}}));
  connect(driver.V, velSens.v) annotation(
      Line(points = {{-248, 9}, {-248, -36}, {78, -36}, {78, -21}}, color = {0, 0, 127}));
    annotation(
      Diagram(graphics = {Text(lineColor = {28, 108, 200}, extent = {{-82, 2}, {-26, -4}}, textString = "electric drive"), Rectangle(origin = {-40, -27},lineColor = {28, 108, 200}, pattern = LinePattern.Dash, extent = {{-138, 65}, {-39, 7}})}));end SortPower_Cycle;

  model Test_Angle
  wbEHPTlib.SupportModels.Miscellaneous.DragForceAngle dragF1(Cx = 0.65, DataFileName = "C:\Users\HP\Downloads\Angle1.txt", S = 6.0, fc = 0.013, m = mass.m, rho = 1.226) annotation(
      Placement(visible = true, transformation(origin = {82, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Mechanics.Rotational.Sources.Torque torque annotation(
      Placement(visible = true, transformation(extent = {{-218, 10}, {-198, 30}}, rotation = 0)));
  wbEHPTlib.SupportModels.Miscellaneous.PropDriver driver(CycleFileName = "C:\Users\HP\Downloads\TestAngle.txt", extrapolation = Modelica.Blocks.Types.Extrapolation.Periodic, k = 1000, yMax = 100000.0) annotation(
      Placement(visible = true, transformation(extent = {{-344, 10}, {-324, 30}}, rotation = 0)));
  Modelica.Mechanics.Translational.Sensors.SpeedSensor velSens annotation(
      Placement(visible = true, transformation(origin = {60, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 270)));
  Modelica.Mechanics.Translational.Components.Mass mass(m = 1300) annotation(
      Placement(visible = true, transformation(extent = {{34, 10}, {54, 30}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealRollingWheel wheel(radius = 0.5715) annotation(
      Placement(visible = true, transformation(extent = {{-12, 10}, {8, 30}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia(J = 5) annotation(
      Placement(visible = true, transformation(extent = {{-166, 12}, {-146, 32}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear gear(ratio = 6) annotation(
      Placement(visible = true, transformation(origin = {-56, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
  connect(driver.V, velSens.v) annotation(
      Line(points = {{-334, 9}, {-334, -36}, {60, -36}, {60, -21}}, color = {0, 0, 127}));
  connect(mass.flange_a, wheel.flangeT) annotation(
      Line(points = {{34, 20}, {8, 20}}, color = {0, 127, 0}));
    connect(velSens.flange, mass.flange_b) annotation(
      Line(points = {{60, 0}, {60, 20}, {54, 20}}, color = {0, 127, 0}));
  connect(inertia.flange_a, torque.flange) annotation(
      Line(points = {{-166, 22}, {-182, 22}, {-182, 20}, {-198, 20}}));
  connect(torque.tau, driver.tauRef) annotation(
      Line(points = {{-220, 20}, {-323, 20}}, color = {0, 0, 127}));
  connect(inertia.flange_b, gear.flange_a) annotation(
      Line(points = {{-146, 22}, {-66, 22}}));
    connect(dragF1.flange, mass.flange_b) annotation(
      Line(points = {{82, -14}, {82, 20}, {54, 20}}, color = {0, 127, 0}));
  connect(gear.flange_b, wheel.flangeR) annotation(
      Line(points = {{-46, 22}, {-12, 22}, {-12, 20}}));
    annotation(
      Diagram(graphics = {Text(origin = {-132, 2}, lineColor = {28, 108, 200}, extent = {{-82, 2}, {-26, -4}}, textString = "electric drive"), Rectangle(origin = {-87, -20}, lineColor = {28, 108, 200}, pattern = LinePattern.Dash, extent = {{-150, 66}, {-43, 7}})}));end Test_Angle;
  annotation(
    uses(Modelica(version = "3.2.3")));
end Sasmita_Ev_Package;
