# libfabric-efa-demo

Blog Post: [Journey to 3200 Gbps: High-Performance GPU Memory Transfer on AWS](https://www.perplexity.ai/hub/blog/high-performance-gpu-memory-transfer-on-aws)

# Build Instructions

Install GDRCopy, libfabric, and fabtests inside `build/` folder:

```bash
bash ./install-deps.sh
```

Build the demo code:

```bash
make
```
See the comments at the top of each source file for instructions and examples of each demo.

## Build with standard AWS libraries
AWS provides librabric as a part of [efa_installer](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/efa-start.html) bundle.
Starting from efa_installer-1.39.0 is use libfarbic-2.x, so this demo can be build with it.
```bash
# Install EFA installer bundle
AWS_EFA_INSTALLER_VER=1.39.0
curl -sL https://efa-installer.amazonaws.com/aws-efa-installer-${AWS_EFA_INSTALLER_VER}.tar.gz | tar zx
cd aws-efa-installer
./efa_installer.sh -y -n

# just create build dir
mkdir -p build
# Build source with preinstalled library
make LIBFABRIC_HOME=/opt/amazon/efa
```


