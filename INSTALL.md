# How to install Infer from source

## Pre-compiled clang versions

We provide a source release of Infer packaged with pre-build binaries
for clang and facebook-clang-plugins for Linux and MacOS. We encourage
you to use this release as compiling clang is time-consuming. Install
the dependencies as explained in the next section, then follow the
instructions in our [Getting
Started](http://fbinfer.com/docs/getting-started.html#install-from-source)
page to compile and install Infer.


## Infer dependencies for MacOSX

Here are the prerequisites to be able to compile Infer on MacOSX. This
is required to be able to [use the
release](http://fbinfer.com/docs/getting-started.html) (faster), or to
compile everything from source (see the end of this document).

- opam >= 1.2.0 (instructions [here](https://opam.ocaml.org/doc/Install.html#OSX))
- reason >= 0.0.5 ([installation](https://github.com/facebook/reason/blob/master/README.md))
- Python 2.7
- Java (only needed for the Java analysis)
- clang in Xcode command line tools. You can install them with the command
  `xcode-select --install` (only needed for the C/Objective-C analysis)
- Xcode >= 6.1 (only needed for the C/Objective-C analysis)
- autoconf >= 2.63 and automake >= 1.11.1 (if building from git)

You can install some of these dependencies using
[Homebrew](http://brew.sh/):

```sh
brew install autoconf automake opam caskroom/cask/brew-cask && \
brew cask install caskroom/versions/java7
```


## Infer dependencies for Linux

Here are the prerequisites to be able to compile Infer on Linux. This
is required to be able to [use the
release](http://fbinfer.com/docs/getting-started.html) (faster), or to
compile everything from source (see the end of this document).

- opam >= 1.2.0
- reason >= 0.0.5 ([installation](https://github.com/facebook/reason/blob/master/README.md))
- Python 2.7
- Java (only needed for the Java analysis)
- gcc >= 4.7.2 or clang >= 3.1 (only needed for the C/Objective-C analysis)
- autoconf >= 2.63 and automake >= 1.11.1 (if building from git)

See also the distro-specific instructions for Ubuntu and Debian below.


## Install Infer from source

Run the following commands to get Infer up and running:

```sh
# Checkout Infer
git clone https://github.com/facebook/infer.git
cd infer
# Compile Infer
./build-infer.sh java
# Install Infer into your PATH
export PATH=`pwd`/infer/bin:$PATH
```

Replace `./build-infer.sh java` with `./build-infer.sh clang` to build
the C and Objective-C analyzer from source. Beware that this command
may take a really long time because it will compile a custom version
of clang. This custom version is used by Infer to parse C and
Objective-C source code. We encourage you to use [a
release](https://github.com/facebook/infer/releases/) instead, which
ship with clang already compiled.

See `./build-infer.sh --help` for more options, eg `./build-infer.sh`
on its own will build the analyzers for both Java and C/ObjC.


## Install Infer from source without opam

If for some reason you prefer to install Infer's OCaml dependencies by
some means other than opam, you can still compile Infer by running:

```sh
./autogen.sh
./configure
make # or make java
# Install Infer into your PATH
export PATH=`pwd`/infer/bin:$PATH
```


## How to install the dependencies on Linux

Here are instructions on how to install the dependencies needed to
compile Infer on a few Linux distributions.

### Debian 7 and Ubuntu 14.04 LTS

```sh
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y \
  autoconf \
  automake \
  build-essential \
  git \
  libgmp-dev \
  libmpc-dev \
  libmpfr-dev \
  m4 \
  openjdk-7-jdk \
  python-software-properties \
  unzip \
  zlib1g-dev
```

### Ubuntu 12.04.4 LTS

```sh
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get upgrade
sudo apt-get install -y \
  autoconf \
  automake \
  build-essential \
  g++-4.8 \
  gcc-4.8 \
  git \
  libgmp-dev \
  libmpc-dev \
  libmpfr-dev \
  m4 \
  openjdk-7-jdk \
  python-software-properties \
  unzip \
  zlib1g-dev
sudo update-alternatives \
  --install /usr/bin/gcc gcc /usr/bin/gcc-4.8 60 \
  --slave /usr/bin/g++ g++ /usr/bin/g++-4.8
```

### Setting up opam

Unfortunately, the version of opam that ships with some Linux
distributions is broken, so you'll have to get it from the web:

```sh
wget https://github.com/ocaml/opam/releases/download/1.2.2/opam-1.2.2-x86_64-Linux
chmod +x opam-1.2.2-x86_64-Linux
sudo cp opam-1.2.2-x86_64-Linux /usr/local/bin/opam
opam init --comp=4.02.3
```

Alternatively, follow the instructions [from the opam
webpage](https://opam.ocaml.org/doc/Install.html).
