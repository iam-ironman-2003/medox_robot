# medox_robot
this package is mainly used for the simulation of the robot in the 3D simulator and is mainly focused on autonomous behavior in differential drive robots in a predefined environment

before going into the simulation you need to install the ros2 humble and setup an workspace

open a terminal in linux os and install the following package for simulation

1)sudo apt install ros-humble-xacro ros-humble-joint-state-publisher-gui
2)sudo apt install ros-humble-ros2-controller
3)sudo apt install ros-humble-controller-manager
4)sudo apt install ros-humble-ros2-control
5)sudo apt install ros-humble-gazebo-ros2-control
6)sudo apt install -f ros-humble-gazebo-ros-pkgs
7)sudo apt install ros-humble-slam-toolbox
8)sudo apt install ros-humble-navigation2 ros-humble-nav2-bringup
9)sudo apt install ros-humble-twist-mux


after all the installation of these packages

we can start the simulation by running the following command in every new terminal
1)  ros2 launch medox_robot simulation_launch.launch.py world:=robot_ws/src/iron_mobot/worlds/model_home.world
2)  rviz2

after 2nd step we need to add the robot model and set the fixed frame to base_link
 we need to add the laser_sacn and set the topic to /scan
3) ros2 launch slam_toolbox online_async_launch.py params_file:=robot_ws/src/medox_robot/config/mapper_params_online_async.yaml use_sim_time:=true
4) ros2 run teleop_twist_keyboard teleop_twist_keyboard --ros-args -r /cmd_vel:=/diff_cont/cmd_vel_unstamped
5) ros2 run nav2_map_server map_server --ros-args -p yaml_filename:=robot_ws/src/medox_robot/map/save_map.yaml -p use_sim_time:=true
6) ros2 run nav2_util lifecycle_bringup map_server

add the map and set the topic to /map and in the topic set the durability policy to transient local

7)  ros2 run nav2_amcl amcl --ros-args -p use_sim_time:=true

set the fixed  frame as map and run the next command

8)  ros2 run nav2_util lifecycle_bringup amcl

then click the 2D pose estimate button click and drag where robot is facing and located and then finally run the next command line

9) ros2 launch medox_robot navigation_launch.py
10) ros2 run twist_mux twist_mux --ros-args --params-file ./robot_ws/src/medox_robot/config/twist_mux.yaml -r cmd_vel_out:=diff_cont/cmd_vel_unstamped

then add another map for navigation and set the topic to /global_costmap/costmap and set color scheme to costmap
then click 2D goal pose and click the goal location

for real robot

1) ros2 launch medox_robot robot.launch.py
2) ros2 launch medox_robot rplidar.launch.py
3) rviz2 -d robot_ws/src/medox_robot/config/diff_bot.rviz
4) ros2 launch slam_toolbox online_async_launch.py params_file:=robot_ws/src/medox_robot/config/mapper_params_online_async.yaml use_sim_time:=false
5) ros2 run teleop_twist_keyboard teleop_twist_keyboard --ros-args -r /cmd_vel:=/diff_cont/cmd_vel_unstamped
6) ros2 launch medox_robot navigation_launch.py
7) ros2 run twist_mux twist_mux --ros-args --params-file ./robot_ws/src/iron_mobot/config/twist_mux.yaml -r cmd_vel_out:=diff_cont/cmd_vel_unstamped



