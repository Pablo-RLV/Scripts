#!/bin/bash


sudo apt install ros-humble-navigation2 ros-humble-nav2-bringup ros-humble-turtlebot3*

sudo apt install ros-humble-rmw-cyclonedds-cpp

echo "export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp" >> ~/.bashrc

sudo apt install ros-humble-nav2-simple-commander ros-humble-tf-transformations python3-transforms3d

echo "export TURTLEBOT3_MODEL=burger" >> ~/.bashrc && source ~/.bashrc

# Setup LDS-02
mkdir -p ~/turtlebot3_ws/src && cd ~/turtlebot3_ws/src
git clone -b ros2-devel https://github.com/ROBOTIS-GIT/ld08_driver.git
cd ~/turtlebot3_ws/
colcon build --symlink-install
echo 'source ~/turtlebot3_ws/install/setup.bash' >> ~/.bashrc
echo 'export LDS_MODEL=LDS-02' >> ~/.bashrc
source ~/.bashrc

#Setup do OpenCR
sudo cp `ros2 pkg prefix turtlebot3_bringup`/share/turtlebot3_bringup/script/99-turtlebot3-cdc.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
sudo udevadm trigger
sudo dpkg --add-architecture armhf
sudo apt update
#sudo apt install libc6:armhf
ls /dev/ttyACM*
echo 'export OPENCR_PORT=/dev/ttyACM0' >> ~/.bashrc
echo 'export OPENCR_MODEL=burger' >> ~/.bashrc
wget https://github.com/ROBOTIS-GIT/OpenCR-Binaries/raw/master/turtlebot3/ROS2/latest/opencr_update.tar.bz2
tar -xvf ./opencr_update.tar.bz2
cd ~/opencr_update
./update.sh $OPENCR_PORT $OPENCR_MODEL.opencr
echo "everything is done"