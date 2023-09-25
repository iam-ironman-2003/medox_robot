# iron_mobot
this package is mainly used for the simulation of the robot in the 3D simulator and is mainly focused on autonomous behavior in differential drive robots in a predefined environment

before going into the simulation you need to install the ros2 humble and setup an workspace

open a terminal in linux os and install the following package for simulation

1)sudo apt install ros-humble-xacro ros-humble-joint-state-publisher-gui
2)sudo apt install -f ros-humble-gazebo-ros-pkgs
3)sudo apt install ros-humble-slam-toolbox
4)sudo apt install ros-humble-navigation2 ros-humble-nav2-bringup

after all the installation of these packages

we can start the simulation by running the following command in every new terminal
1)  ros2 launch iron_mobot simulation_launch.launch.py world:=mobot_ws/src/iron_mobot/worlds/model_home.world
2)  rviz2

# after 2nd step we need to add the robot model and set the fixed frame to base_link
# we need to add the laser_sacn and set the topic to /scan

3)  ros2 run nav2_map_server map_server --ros-args -p yaml_filename:=mobot_ws/src/iron_mobot/map/my_map_save.yaml -p use_sim_time:=true
4)  ros2 run nav2_util lifecycle_bringup map_server

# add the map and set the topic to /map and in the topic set the durability policy to transient local

5)  ros2 run nav2_amcl amcl --ros-args -p use_sim_time:=true

# set the fixed  frame as map and run the next command

6)  ros2 run nav2_util lifecycle_bringup amcl

# then click the 2D pose estimate button click and drag where robot is facing and located and then finally run the next command line

7) ros2 launch iron_mobot navigation_launch.py

# then add another map for navigation and set the topic to /global_costmap/costmap and set color scheme to costmap
# then click 2D goal pose and click the goal location


