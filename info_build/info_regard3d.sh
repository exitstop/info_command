# стачало нужно скомпилить ceres - некий реталье уравнений для поиска совпадений точек
https://en.wikiversity.org/wiki/Photogrammetry/Regard3D/Installation

# ceres установился нормально
https://github.com/googlecartographer/cartographer/issues/993

git clone https://ceres-solver.googlesource.com/ceres-solver
cd ceres-solver
mkdir build
cd build
cmake .. -G Ninja -DCXX11=ON  -DCMAKE_INSTALL_PREFIX=/usr/local/stow/ceres
ninja -j15
sudo ninja install
cd /usr/local/stow/ 
sudo stow ceres

# затем сколмпилить regard3d
http://www.regard3d.org/index.php/documentation/compiling



http://security.ubuntu.com/ubuntu/pool/universe/e/eigen3/
sudo apt-get install libflann-dev
sudo apt install libassimp-dev
#git clone git://github.com/pioneerspacesim/pioneer-thirdparty.git pioneer-thirdparty

cmake -GNinja  -DCMAKE_BUILD_TYPE="Release" -DCERES_DIR=/ceres/install/dir -DOPENMVG_SRC_DIR=/path/to/openmvg/src -DUSE_SSE2=TRUE ..
